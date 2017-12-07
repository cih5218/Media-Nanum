package com.nanum.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.nanum.domain.MemberNN;
import com.nanum.domain.SMS;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.SmsDAO;
import com.nanum.service.BoardService;
import com.nanum.service.SmsService;
import com.nanum.sms.Coolsms;

@Controller
public class SmsController {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private View JsonView;

	@Autowired
	private SmsService smsservice;
	
	// sms보내기 (판매자->구매자)
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/send_sms.nn")
	public String board_sms_insert_send(int member_id, String sms_no, HttpSession session)
			throws ClassNotFoundException, SQLException {
	
		SmsDAO smsDAO = sqlsession.getMapper(SmsDAO.class);
		MemberNN member = (MemberNN) session.getAttribute("Membernn"); // 세션설정
	
		String phonenum = smsDAO.sms_givephonenumber(member_id);
		String msg = "[나눔]\n" + member.getMember_name() + "님의 번호를 받았습니다 \n" + member.getMember_cell(); // 메세지																								// 설정
		
		// 권한이 0일때만 보내줌 1일때는 보내준거니까 막기
		SMS sms_lv = smsDAO.sms_level_check(Integer.parseInt(sms_no));
	
		smsservice.board_sms_insert_send(sms_lv, phonenum, msg);
		
	
		return "index.index";

	}

	// sms보내기 (구매자->판매자) //비동기
	@Secured({ "ROLE_재능회원", "ROLE_관리자" })
	@RequestMapping("/board_sms_insert.nn")
	public View board_sms_insert_receive(SMS sms, int board_no, String board_msg, int member_id)
			throws ClassNotFoundException, SQLException {

		SmsDAO smsDAO = sqlsession.getMapper(SmsDAO.class);
	
		sms.setBoard_no(board_no);
		sms.setSend_id(member_id); // id설정
		sms.setReceive_id(smsDAO.sms_receive_id(board_no));// sms등록할것 정해주기
	
		smsDAO.sms_insert(sms);// sms 테이블에 넣기 0:대기 1:완료
		smsDAO.sms_no(board_no);// sms 테이블에 값 등록
	
		String message = "누군가가 당신에게 나눔을 요청합니다! \n" + board_msg + "\n" + "회원정보보기 :"
				+ "http://192.168.43.111:8090/nanum/profile.nn?member_id=" + member_id + "&sms_no="
				+ smsDAO.sms_no(board_no);

		smsservice.board_sms_insert_receive(message, board_no);

		return JsonView;
	}
}
