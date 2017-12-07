package com.nanum.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.nanum.domain.BoardRequest;
import com.nanum.domain.Member;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.MemberDAO;
import com.nanum.persistance.RequestBoardDAO;

@Controller
public class RequestBoardController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;
	
	// 나눔 요청 이동
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/board_request.nn")
	public String board_request() {
		return "board.board_request";
	}
	
	// 나눔 요청 목록 이동
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping(value = "/board_request_list.nn", method = RequestMethod.GET)
	public String board_request_list(Model model) throws ClassNotFoundException, SQLException {
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		model.addAttribute("requestprogress", memberDao.getRequestResult()); // 진행중인
		model.addAttribute("requestsuccess", memberDao.getSuccessRequestResult()); // 완료된
		model.addAttribute("membernumber", memberDao.getMember_nn()); // 재능인 인원
		return "board.board_request_list";
	}

	// 요청 게시글 목록 가져오기(비동기)
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping(value = "/board_request_list.nn", method = RequestMethod.POST)
	public View getBoardRequest(String selectTitle, HttpSession session, Model model)
			throws ClassNotFoundException, SQLException {
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		Member user_id = (Member) session.getAttribute("Member");
		HashMap map = new HashMap();
		map.put("selectTitle", selectTitle);
		map.put("user_id", user_id.getMember_id());
		model.addAttribute("user_id", user_id);// 세션보내기
		model.addAttribute("boardrequestlist", memberDao.getBoardRequest(map));
		model.addAttribute("member", memberDao.getMember_name(map));
		return JsonView;
	}

	/* request_board*/
	// 요청 등록
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/board_request_input.nn")
	public String board_request_input(BoardRequest board, HttpSession session)
			throws ClassNotFoundException, SQLException {
		Member member = (Member) session.getAttribute("Member"); // check
																	// session
		RequestBoardDAO requestBoardDAO = sqlsession.getMapper(RequestBoardDAO.class); // mapper
		requestBoardDAO.board_request_input(board);
		return "redirect:board_request_list.nn";
	}

	// board_request_modify 요청 게시판 수정 요청하기->요청게시판으로 보내기
	@RequestMapping("/board_request_modify.nn")
	public String board_request_modify(int board_no, Model model) throws ClassNotFoundException, SQLException {

		RequestBoardDAO requestBoardDAO = sqlsession.getMapper(RequestBoardDAO.class); // mapper
		BoardRequest reqdata = requestBoardDAO.board_request_data(board_no);
		reqdata.setRequest_term(reqdata.getRequest_term().substring(0, 10).replace("-", ""));// 달력
																								// 값
																								// 바꿔주기
		model.addAttribute("reqdata", reqdata);
		return "board.board_request_modify";
	}

	// board_request_update.nn 요청게시판 수정 완료
	@RequestMapping("/board_request_update.nn")
	public String board_request_update(BoardRequest board) throws ClassNotFoundException, SQLException {
		RequestBoardDAO requestBoardDAO = sqlsession.getMapper(RequestBoardDAO.class); // mapper
		requestBoardDAO.board_request_update(board);
		return "board.board_request_list";
	}

	// 요청게시판 삭제
	@RequestMapping("/board_request_delete.nn")
	public String board_request_delete(int board_no) throws ClassNotFoundException, SQLException {
		RequestBoardDAO requestBoardDAO = sqlsession.getMapper(RequestBoardDAO.class); // mapper
		requestBoardDAO.board_request_delete(board_no);
		return "board.board_request_list";
	}
}
