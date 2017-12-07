package com.nanum.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.nanum.domain.BoardNN;
import com.nanum.domain.Member;
import com.nanum.persistance.IndexDAO;
import com.nanum.persistance.MemberDAO;

@Controller
public class IndexController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;

	// 인덱스 화면
	@RequestMapping({ "/index.nn", "/", "" })
	public String index(Model model) throws ClassNotFoundException, SQLException {
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		model.addAttribute("getchecked", memberDao.getChecked());
		model.addAttribute("getname", memberDao.getCheckedName());
		model.addAttribute("getdate", memberDao.getCheckedDate());
		model.addAttribute("getboard", memberDao.getCheckedMember());
		return "index.index";
	}
	
	// 장바구니 저장
	@RequestMapping("/basket_item.nn")
	public @ResponseBody View basket_item(String board_no, HttpSession session, Model model)
			throws ClassNotFoundException, SQLException {
		Member member = (Member) session.getAttribute("Member");
		IndexDAO indexDAO = sqlsession.getMapper(IndexDAO.class);
		try {
			int result = indexDAO.basketInsert(Integer.parseInt(board_no), member.getMember_id());
			model.addAttribute("basket_item", "success");
		} catch (Exception e) {
			model.addAttribute("basket_item", "fail");
		}
		return JsonView;
	}

	// 장바구니 로드
	@RequestMapping("/basket_select.nn")
	public @ResponseBody View basket_select(Model model, HttpSession session)
			throws ClassNotFoundException, SQLException {
		IndexDAO indexDAO = sqlsession.getMapper(IndexDAO.class);
		List<BoardNN> list = indexDAO.basket_select(((Member) session.getAttribute("Member")).getMember_id());
		model.addAttribute("basket_select", list);
		return JsonView;
	}

	// 장바구니 삭제
	@RequestMapping("/basket_delete.nn")
	public View basket_delete(HttpSession session, int board_no, Model model)
			throws ClassNotFoundException, SQLException {
		
		int result = sqlsession.getMapper(IndexDAO.class).basket_delete(((Member) session.getAttribute("Member")).getMember_id(), board_no);
		model.addAttribute("board_no", board_no);
		return JsonView;
	}
	
	// 권한거부 페이지
	@RequestMapping("/acessdenied.nn")
	public String acessdenied() {
		return "admin.exception";
	}
}
