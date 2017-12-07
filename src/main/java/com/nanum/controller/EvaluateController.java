package com.nanum.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import com.nanum.domain.Checked;
import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.NanumBest;
import com.nanum.domain.NanumCheck;
import com.nanum.service.EvaluateService;
import com.nanum.service.FileUpload;

@Controller
public class EvaluateController {
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private EvaluateService evaluateservice;
	
	@Autowired
	private FileUpload fileupload;

	// 나눔 인증 이동
	@Secured({ "ROLE_일반회원", "ROLE_관리자" })
	@RequestMapping("/nanum_check.nn")
	public String nanum_check() {
		return "board.nanum_check";
	}

	// 나눔 인증 리스트 이동 (서비스 완료)
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/nanum_check_list.nn")
	public String nanum_check_list(NanumBest nanumbest, Model model) throws ClassNotFoundException, SQLException {
		HashMap<String, Object> hashmap = evaluateservice.nanum_check_list(nanumbest);
		model.addAttribute("mymember_no", hashmap.get("mymember_no"));
		model.addAttribute("check_eva_list", hashmap.get("check_eva_list"));
		model.addAttribute("mymember_email", hashmap.get("mymember_email"));
		model.addAttribute("list", hashmap.get("list"));
		return "board.nanum_check_list";
	}

	// 나눔 인증 평가 등록 (서비스 완료)
	@Secured({ "ROLE_재능대기", "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("nanum_check_best.nn")
	public View nanum_check_best(Checked check, Member member, NanumCheck nanumcheck, Model model)
			throws ClassNotFoundException, SQLException {
		model.addAttribute("finalstr", evaluateservice.nanum_check_best(check, member, nanumcheck));
		return JsonView;
	}

	// 나눔 인증 등록 (서비스 완료)
	@RequestMapping(value = "/nanum_checkok.nn", produces = "application/json")
	public String nanum_checkok(HttpServletRequest request, MemberNN membernn,
			NanumBest nanumbest, Location location)
			throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		List<CommonsMultipartFile> files = membernn.getFiles();
		List<String> filenames = fileupload.File_Upload(files, request);
		System.out.println("확인:");
		System.out.println(request);
		System.out.println(membernn);
		System.out.println(nanumbest);
		System.out.println(location);
		System.out.println(filenames);
		System.out.println("끝");
		
		evaluateservice.nanum_checkok(request, membernn, nanumbest, location, filenames);
		return "index.index";
	}
}
