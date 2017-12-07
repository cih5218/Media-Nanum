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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import com.nanum.domain.Location;
import com.nanum.domain.MemberNN;
import com.nanum.domain.SMS;
import com.nanum.persistance.SmsDAO;
import com.nanum.service.FileUpload;
import com.nanum.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private FileUpload fileupload;
	
	@Autowired
	private ProfileService profileservice;
	
	
	// 나의 프로필 이동 (서비스 완료)
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/my_profile.nn")
	public String my_profile(MemberNN membernn, Location location, HttpSession session, Model model)
			throws ClassNotFoundException, SQLException {
		HashMap<String, Object> hashmap = profileservice.my_profile(membernn, location, session);
		model.addAttribute("membernn", hashmap.get("membernn"));
		model.addAttribute("location", hashmap.get("location"));
		return "etc.my_profile";
	}

	// 프로필 수정 (서비스 완료)
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/my_profile_update.nn")
	public String my_profile_update(HttpServletRequest request, String wk, Location location, MemberNN membernn,
			String profile, String file_profile, HttpSession session)
			throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		List<CommonsMultipartFile> files = membernn.getFiles();
		List<String> filenames = fileupload.File_Upload(files, request); // 파일명만 추출
		profileservice.my_profile_update(request, wk, location, membernn, profile, file_profile, session, filenames);
		return "redirect:my_profile.nn";
	}
	
	// 상대방 프로필 이동
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("profile.nn")
	public String profile(int member_id, @RequestParam(value = "sms_no", required = false) String sms_no,
			HttpSession session, Model model) throws ClassNotFoundException, SQLException {

		// 세션설정
		// Member member =(Member)session.getAttribute("Member");
		// System.out.println("멤버확인:"+member.getMember_email());
		HashMap<String, Object> hashmap = profileservice.profile(member_id);
		SmsDAO smsDAO = sqlsession.getMapper(SmsDAO.class);
		// 보내기
		model.addAttribute("like", hashmap.get("like")); // 총 좋아요 횟수
		model.addAttribute("profile", hashmap.get("profile")); // 상대 나눔 기록
		model.addAttribute("membernn", hashmap.get("membernn")); // 상대 프로필 정보
		model.addAttribute("nanumsize", hashmap.get("nanumsize")); // 상대 나눔 기록 횟수
		if (sms_no != null) {
			SMS smsdata = smsDAO.sms_level_check(Integer.parseInt(sms_no));
			model.addAttribute("sms", smsdata); // sms가져간다
		}
		return "etc.profile";
	}
}
