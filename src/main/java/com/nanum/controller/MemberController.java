package com.nanum.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.nanum.domain.Member;
import com.nanum.persistance.MemberDAO;
import com.nanum.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private MemberService memberservice;
	
	//로그인 화면 이동
	@RequestMapping("/login.nn")
	public String login(HttpSession session, HttpServletRequest request){
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
		return "/login/login";
	}
	
	//회원가입 화면 이동
	@RequestMapping("/signup.nn")
	public String signup(){
		return "/joinus/signup";
	}
	
	//아이디 비밀번호 찾기
	@RequestMapping("/forgot_account.nn")
	public String forgot_account(){
		return "/login/forgot_account";
	}
	
	//회원가입시 아이디 체크 (비동기)
	@RequestMapping("/duplicationCheck.nn")
	public @ResponseBody String duplicationCheck(String email) throws Exception {
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		return memberservice.duplicationCheck(email);
	}
	
	//로그인 시 이메일, 비밀번호 체크 (비동기)
	@RequestMapping("/loginCheck.nn")
	public View loginCheck(String member_email, String member_password ,Model model) throws Exception {
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		Member member = memberDao.loginCheck(member_email);
		memberDao.lastDate(member_email, member_password);
		
		if(memberDao.checkedEmail(member_email) != 0){
			model.addAttribute("member_email", member.getMember_email());
			model.addAttribute("member_password", member.getMember_password());
		}else{
			model.addAttribute("member_email", null);
			model.addAttribute("member_password", null);
		}
		return JsonView;
	}

	//페이스북 로그인 중복체크해서 잇으면 로그인 없으면 가입 맵퍼를 탄다.
	@RequestMapping("/fblogin")
	public @ResponseBody String fblogin(String email) throws Exception {
		sqlsession.getMapper(MemberDAO.class).fblogin(email);
		return sqlsession.getMapper(MemberDAO.class).getfbpassword(email);
	}	
	
	//페이스북 가입 
	@RequestMapping("/fbsignup.nn")
	public @ResponseBody void fbsignup(String email, String fbaccesstoken) throws Exception {
		MemberDAO  memberdao = sqlsession.getMapper(MemberDAO.class);
		memberdao.fbsignup(email,fbaccesstoken.substring(0, 10));
	}	

	//아이디 찾기 
	@RequestMapping(value="/id_search.nn",method=RequestMethod.POST)
	public View Id_search(String name , String number, ModelMap map) throws ClassNotFoundException, SQLException{
		map.addAttribute("email",sqlsession.getMapper(MemberDAO.class).Id_search(name,number));
		return JsonView;
	}
	
	//비밀번호 찾기 
	@RequestMapping(value = "/forgot.nn", method = RequestMethod.POST)
	public View forget(String pwdname, String email ,ModelMap map) throws ClassNotFoundException, SQLException {
		map.addAttribute("result",memberservice.forget(pwdname,email));
		return JsonView;
	}
	
	//회원가입 이메일 인증 보내기 
	@RequestMapping(value = "/signup.nn", method = RequestMethod.POST)
	public View signup(String email, String password) throws ClassNotFoundException, SQLException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		if(memberDao.checkedEmailLevel(email) == 0){
			memberDao.insertSignup(email, password); //이메일 인증 전에 권한 0 주기
		}else{
			memberDao.updateSignup(email, password); //이메일 중복이면 비밀번호만 새로 변경해주기
		}
		memberservice.signup(email, password);
		return JsonView;
	}
	
	//회원가입 이메일 인증 보내기 
	@RequestMapping("/signup_certification.nn")
	public String signupCertification(String email, String password , Model model) throws ClassNotFoundException, SQLException{
		model.addAttribute("email", email);
		model.addAttribute("password", password);
		return "/joinus/signup_certification";
	}
	
	//회원가입 처리 이메일 인증 후에 권한 1 로 업데이트
	@RequestMapping("/joinok.nn")
	public String insert(String email, String password) throws ClassNotFoundException, SQLException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		memberDao.insert(email,password);
		return "/login/login";
	}
}
