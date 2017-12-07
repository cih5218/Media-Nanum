package com.nanum.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import com.nanum.domain.BoardLike;
import com.nanum.domain.BoardNN;
import com.nanum.domain.CheckBoard;
import com.nanum.domain.CheckRe;
import com.nanum.domain.Checked;
import com.nanum.domain.Location;
import com.nanum.domain.MemberNN;
import com.nanum.domain.SMS;
import com.nanum.domain.Tag;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.MemberDAO;
import com.nanum.service.BoardService;
import com.nanum.service.FileUpload;

@Controller
public class BoardController {

	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private FileUpload fileupload;
	
	@Autowired
	private BoardService boardservice;
	
	
	// 나눔 등록 이동
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/board_write.nn")
	public String board_write(HttpSession session, Model model) {
		model.addAttribute("location", (Location) session.getAttribute("Location"));
		return "board.board_write";
	}
	
	//인덱스 글 목록
	@RequestMapping(value = "/list.nn", method = RequestMethod.POST)
	public View getList(String selectTitle, Model model) throws ClassNotFoundException, SQLException {
		List<BoardNN> list = sqlsession.getMapper(MemberDAO.class).getList(selectTitle);
		List<MemberNN> list2 = sqlsession.getMapper(BoardDAO.class).board_member_list(selectTitle);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return JsonView;
	}
	
	// 등록 게시글 등록 파일 업로드 (서비스 완료)
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping(value = "/board_writeOk.nn", produces = "application/json")
	public String board_writeOk(HttpServletRequest request, BoardNN boardnn, Location location, Tag tag, String wk,
			String tag_name_ok) throws IOException, ClassNotFoundException, SQLException{
		List<CommonsMultipartFile> files = boardnn.getFiles();
		List<String> filenames = fileupload.File_Upload(files, request);
		boardservice.board_writeOk(request, boardnn, location, tag, wk, tag_name_ok, filenames);
		return "redirect:board_list.nn?title=" + boardnn.getBoard_category();
	}
		
	// 나눔 글 상세 이동 (서비스 완료)
	@Secured({"ROLE_일반회원","ROLE_재능대기","ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/board_detail.nn")
	public String board_detail(String board_no, Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		BoardNN boardnn = sqlsession.getMapper(BoardDAO.class).board_detail(Integer.parseInt(board_no));
		if(boardnn.getBoard_level()!=1){
			return "index.index";	// 페이지 처리
		}else{
			HashMap<String, Object> hashmap = boardservice.board_detail(boardnn, board_no, session);
			model.addAttribute("checkrelist", hashmap.get("checkrelist"));
			model.addAttribute("str", hashmap.get("str"));
			model.addAttribute("result", hashmap.get("result"));
			model.addAttribute("taginfo", hashmap.get("taginfo"));
			model.addAttribute("user_email", hashmap.get("user_email")); // 글쓴이의 이메일
			model.addAttribute("list", hashmap.get("list")); // 댓글 리스트
			model.addAttribute("userid", hashmap.get("userid")); // 현재 로그인한 사람의 이메일
			model.addAttribute("boardnn", hashmap.get("boardnn")); // 등록 게시글 내용
			model.addAttribute("membernn", hashmap.get("membernn")); // 글쓴이의 프로필
			model.addAttribute("member", hashmap.get("member")); // 글쓴이의 정보
			model.addAttribute("count", hashmap.get("count")); // 글쓴이의 작업수
			model.addAttribute("location", hashmap.get("location"));
			model.addAttribute("writernn", hashmap.get("writernn"));
			model.addAttribute("mylocation", hashmap.get("mylocation"));
			model.addAttribute("connectboardlist", hashmap.get("connectboardlist")); //비슷한 게시글 가져오기
			model.addAttribute("connectboardmember", hashmap.get("connectboardmember")); //비슷한 게시글 회원 정보 가져오기
			return "board.board_detail";
		}
	}
	
	//나눔 글 상세 댓글 입력 (서비스 완료)
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/check_board.nn")
	public View check_board(String check_score, String check_content, String board_no, CheckBoard checkboard, Checked check, Model model) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = boardservice.check_board(check_score, check_content, board_no, checkboard, check);
		model.addAttribute("sender_member", hashmap.get("sender_member"));
		model.addAttribute("receiver_member", hashmap.get("receiver_member"));
		model.addAttribute("check_date", hashmap.get("check_date"));
		model.addAttribute("userid", hashmap.get("userid"));
		model.addAttribute("check", hashmap.get("check"));
		return JsonView;
	}
		
	/*보드 리스트 가져오기 (수정 지역 검색 추가)*/
	@RequestMapping("/board_list.nn")
	public String board_list(String title, String search, HttpServletRequest request, String pg, String category,
			String cityName, String gooName, Model model, String latitude, String longitude, String loc)
			throws ClassNotFoundException, SQLException {
		HashMap<String, Object> hashmap = boardservice.board_list(title, search, request, pg, category, cityName,
				gooName, latitude, longitude, loc);

		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);

		request.setAttribute("title", title);
		request.setAttribute("tag", hashmap.get("tag"));
		request.setAttribute("latitude", latitude);
		request.setAttribute("longitude", longitude);
		model.addAttribute("loc", hashmap.get("loc"));
		model.addAttribute("list", hashmap.get("list"));
		model.addAttribute("pg", hashmap.get("pg"));
		model.addAttribute("allPage", hashmap.get("allPage"));
		model.addAttribute("block", hashmap.get("block"));
		model.addAttribute("fromPage", hashmap.get("fromPage"));
		model.addAttribute("toPage", hashmap.get("toPage"));
		model.addAttribute("categoryall", hashmap.get("categoryall"));

		return "index.board_list";
	}
		   
	
	
	

	//좋아요 체크 (비동기) 등록/삭제해주기
	@RequestMapping("/board_like.nn")
	public View board_like(BoardLike boardlike,Model model) throws Exception {
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		
		// 게시판 전체 좋아요 값
		// 인설트 딜리트 해줘야함
		int like_board_total=boarddao.like_count_total(boardlike.getBoard_no());
		//좋아요 전체갯수 가져오는지 확인
	
		//개인 사용자가 좋아요를 눌렀는지 안눌렀는지 
		int like_exist=boarddao.like_count_check(boardlike);
		if(like_exist==0){
			//데이터에 값이 없으므로 insert해주자
			//아주 중요한문제: 처음에 trigger을 걸어서 반대로 값이 들어감 그래서 인설트가 1이어야되고 딜리트가 0이어야됨
			boarddao.like_count_insert(boardlike);
		}else{
			//데이터가 있는데 클릭을 눌렀으니 delete해주자
			boarddao.like_count_delete(boardlike);
		}
		model.addAttribute("like_board_total", like_board_total);
		model.addAttribute("like_exist", like_exist);
		return JsonView;
	}
	

	//board_like_state.nn
	//초기로드 (좋아요 상태확인,전체게시판 갯수 확인) 
	@RequestMapping("/board_like_state.nn")

	public View board_like_state(BoardLike boardlike,Model model) throws Exception {
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);

		// 게시판 전체 좋아요 값
		int like_board_total=boarddao.like_count_total(boardlike.getBoard_no());
		//좋아요 전체갯수 가져오는지 확인
		//개인 사용자가 좋아요를 눌렀는지 안눌렀는지 
		int like_state=boarddao.like_count_check(boardlike);
		model.addAttribute("like_state", like_state);
		model.addAttribute("like_board_total", like_board_total);
		return JsonView;
	}
	
	
	// 등록 게시글 수정하기 (서비스 완료)
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/board_modify.nn")
	public String board_modify (String board_no, Model model) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = boardservice.board_modify(board_no);
		model.addAttribute("taginfo", hashmap.get("taginfo"));
		model.addAttribute("boardnn", hashmap.get("boardnn"));
		model.addAttribute("location", hashmap.get("location"));
		return "board.board_modify";
	}
			
	// 등록 게시글 수정 완료 (서비스 완료)
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping(value = "/board_modifyOk.nn")
	public String board_modifyOk(HttpServletRequest request, BoardNN boardnn, Location location, Tag tag, String board_no,
			String wk, String title, String detail, String file_title, String file_detail, String tag_name_ok)
			throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		List<CommonsMultipartFile> files = boardnn.getFiles();
		List<String> filenames = fileupload.File_Upload(files, request); // 파일명만 추출
		boardservice.board_modifyOk(request, boardnn, location, tag, board_no, wk, title, detail, file_title, file_detail, tag_name_ok, filenames);
		return "redirect:board_detail.nn?board_no=" + board_no;
	}
	

	// 등록 게시글 삭제(상태변경)
	@RequestMapping("board_delete.nn")
	public String board_delete(String board_no) throws NumberFormatException, ClassNotFoundException, SQLException {
		sqlsession.getMapper(BoardDAO.class).board_delete(Integer.parseInt(board_no));
		return "index.index";
	}
	
	// 평가 댓글 입력 (서비스 완료)
	@RequestMapping("checkre_insert.nn")
	public View checkre_insert(HttpServletRequest request, CheckRe checkre, Model model) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = boardservice.checkre_insert(request, checkre);
		model.addAttribute("result", hashmap.get("result"));
		model.addAttribute("checkre_content", hashmap.get("checkre_content"));
		return JsonView;
	}
	
	
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/board_nanum_list.nn")
	public String board_nanum_list(int member_id, Model model)
			throws NumberFormatException, ClassNotFoundException, SQLException {

		System.out.println("board_nanum_list.nn");

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class); // sql문 설정
		List<SMS> sms_sell = boarddao.nanum_list_getSendid(member_id); // sms 값 // 가져오기
		List<SMS> sms_buy = boarddao.nanum_list_getReceiveid(member_id);
		
		boardservice.board_nanum_list(sms_sell, sms_buy);
		
		return "board.board_nanum_list";
	}
		
	@RequestMapping("/overlap_exist.nn")
	public View overlap_exist(int board_no, int member_id, Model model)
			throws NumberFormatException, ClassNotFoundException, SQLException {
		System.out.println("overlap_exist.nn");

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		int result = boarddao.overlap_exist(board_no, member_id);

		model.addAttribute("result", result);

		return JsonView;

	}

	
}
