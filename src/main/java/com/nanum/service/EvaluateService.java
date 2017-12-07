package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.nanum.domain.Checked;
import com.nanum.domain.CountScore;
import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.NanumBest;
import com.nanum.domain.NanumCheck;
import com.nanum.domain.Nanum_Check_List;
import com.nanum.domain.Nanum_member_check;
import com.nanum.persistance.MemberDAO;

@Service
public class EvaluateService {
	
	@Autowired
	private SqlSession sqlsession;

	// 나눔 인증 리스트 이동
	public HashMap<String, Object> nanum_check_list(NanumBest nanumbest) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		List<Nanum_Check_List> list = memberDao.nanum_check_list();// 나눔 인증 리스트 가져오기
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Nanum_member_check> checklist = memberDao.check_eva_list();
		hashmap.put("mymember_no", memberDao.select_member_no(userinfo.getUsername()));
		hashmap.put("check_eva_list", checklist);
		hashmap.put("mymember_email", userinfo.getUsername());
		hashmap.put("list", list);
		return hashmap;
	}
	
	// 나눔 인증 평가 등록
	public String nanum_check_best(Checked check, Member member, NanumCheck nanumcheck) throws ClassNotFoundException, SQLException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		check.setMember_id(memberDao.select_member_no(userinfo.getUsername()));
		memberDao.check_insert(check);
		nanumcheck.setMember_id(memberDao.select_member_no(member.getMember_email()));
		nanumcheck.setChecked_no(memberDao.check_no_select());
		memberDao.nanum_check_insert(nanumcheck);
		CountScore countscore = memberDao.count_nanum_best(memberDao.select_member_no(member.getMember_email()));
		String finalstr = "first";
		if (countscore.getCount() >= 5 && (countscore.getSum() / countscore.getCount()) >= 3.0) {
			memberDao.nanum_best_update(memberDao.select_member_no(member.getMember_email()));
			memberDao.update_nanumstatus(memberDao.select_member_no(member.getMember_email()));
			finalstr = "finalstr";
		}
		return finalstr;
	}
	
	// 나눔 인증 등록
	public void nanum_checkok(HttpServletRequest request, MemberNN membernn,
			NanumBest nanumbest, Location location, List<String> filenames) throws ClassNotFoundException, SQLException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		// 로그인한 회원 정보 가져오기
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// 위도 경도 나누기
		int num1 = request.getParameter("wk").indexOf(",");
		int num2 = request.getParameter("wk").length();
		// 위도 경도 매핑
		location.setLocation_wedo(Double.parseDouble(request.getParameter("wk").substring(1, num1)));
		location.setLocation_kyoungdo(Double.parseDouble(request.getParameter("wk").substring(num1 + 2, num2 - 1)));
		int member_id = memberDao.select_member_no(userinfo.getUsername());
		System.out.println("멤버아이디:"+member_id);
//		System.out.println("나눔베스트:"+nanumbest);
	
		memberDao.insert_location(location); // 위치 정보 입력
		membernn.setLocation_no(memberDao.select_location_no()); // 위치 정보 번호 매핑
		membernn.setMember_id(member_id); // 프로필 회원 번호 매핑
		membernn.setMember_image(filenames.get(0)); // 프로필 사진 등록
		memberDao.nanum_checkok(membernn); // 프로필 입력
		nanumbest.setMember_id(member_id); // 나눔인증 회원 번호 매핑
		nanumbest.setBest_image(filenames.get(1)); // 나눔 인증 사진 등록
		memberDao.nanum_bestok(nanumbest); // 나눔인증 입력
		memberDao.nanum_wait(member_id); // 회원 권한 업데이트
	}
}
