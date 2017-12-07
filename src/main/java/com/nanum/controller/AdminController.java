package com.nanum.controller;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nanum.domain.Member;
import com.nanum.domain.Report;
import com.nanum.persistance.AdminDAO;
import com.nanum.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private AdminService adminservice;
	
	// 신고 페이지 이동
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("report_write.nn")
	public String report_write(int board_no, ModelMap model) throws ClassNotFoundException, SQLException {
		AdminDAO adminDAO = sqlsession.getMapper(AdminDAO.class); 
		Member report_member = adminDAO.report_user_email(board_no);// 신고할사람 이메일,아이디 가져오기
		model.addAttribute("report_email", report_member.getMember_email()); // 메일보내기(보여주기)
		model.addAttribute("report_member_id", report_member.getMember_id()); // 아이디보내기(db에넘겨줄것)
		model.addAttribute("report_category", adminDAO.report_user_category(board_no));// 신고할 게시글 카테고리 가져오기
		return "etc.report_write";
	}

	// 신고등록
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("report_insert.nn")
	public String report_insert(Report report) throws ClassNotFoundException, SQLException {
		sqlsession.getMapper(AdminDAO.class).report_insert(report);
		return "redirect:index.nn";
	}
	
	// admin
	@Secured({"ROLE_관리자"})
	@RequestMapping({"/admin","/admin.nn"})
	public String Admin(Model model) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = adminservice.Admin_list();
		model.addAttribute("memberlist",hashmap.get("memberlist")); //회원 관리
		model.addAttribute("boardlist",hashmap.get("boardlist")); //게시글 관리
		model.addAttribute("taglist",hashmap.get("taglist")); //검색어 관리
		model.addAttribute("categorylist",hashmap.get("categorylist")); //카테고리 관리
		model.addAttribute("reportlist",hashmap.get("reportlist")); //신고 관리
		model.addAttribute("smslistsend",hashmap.get("smslistsend")); //sms관리
		model.addAttribute("smslistreceive",hashmap.get("smslistreceive")); //sms관리
		return "admin.admin";
	}
}
