package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.nanum.domain.BoardNN;
import com.nanum.domain.Location;
import com.nanum.domain.MemberNN;
import com.nanum.persistance.MemberDAO;
import com.nanum.persistance.ProfileDAO;
import com.nanum.persistance.SmsDAO;

@Service
public class ProfileService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public HashMap<String, Object> my_profile(MemberNN membernn, Location location, HttpSession session) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDAO = sqlsession.getMapper(MemberDAO.class);
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		// 로그인한 회원 정보 가져오기
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		membernn = profileDAO.select_membernn(memberDAO.select_member_no(userinfo.getUsername()));
		hashmap.put("membernn", membernn);
		hashmap.put("location", memberDAO.select_location(membernn.getLocation_no()));
		session.setAttribute("Membernn", membernn);
		session.setAttribute("Location", memberDAO.select_location(membernn.getLocation_no()));
		return hashmap;
	}
	
	public void my_profile_update(HttpServletRequest request, String wk, Location location, MemberNN membernn,
			String profile, String file_profile, HttpSession session, List<String> filenames) throws ClassNotFoundException, SQLException{
		if (file_profile.equals("change")) {
			membernn.setMember_image(filenames.get(0));
		} else {
			membernn.setMember_image(profile);
		}
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인한 정보 가져오기
		int num1 = wk.indexOf(","); // 위도 경도 나누기
		int num2 = wk.length(); // 위도 경도 나누기
		location.setLocation_wedo(Double.parseDouble(wk.substring(1, num1))); // 위도 경도 매핑
		location.setLocation_kyoungdo(Double.parseDouble(wk.substring(num1 + 2, num2 - 1)));// 위도 경도 매핑
		profileDAO.location_update(location); // 위치 정보 업데이트
		membernn.setMember_id(memberDao.select_member_no(userinfo.getUsername())); // 프로필 회원 번호 매핑
		profileDAO.profile_update(membernn);
		session.setAttribute("Membernn", membernn);
		session.setAttribute("Location", memberDao.select_location(membernn.getLocation_no()));// 프로필 정보 업데이트
	}

	public HashMap<String, Object> profile(int member_id) throws ClassNotFoundException, SQLException{
		
		// 맵퍼설정
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		int like = profileDAO.getLike(member_id);
		
		List<BoardNN> profile = profileDAO.getProfile(member_id);
		int nanumsize = profile.size();
		// 멤버 뿌려주기
		MemberNN membernn = profileDAO.getProfileMember(member_id);
		
		hashmap.put("like", like);
		hashmap.put("profile", profile);
		hashmap.put("nanumsize", nanumsize);
		hashmap.put("membernn", membernn);
		
		return hashmap;
	}
}
