package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nanum.domain.SMS;
import com.nanum.persistance.SmsDAO;
import com.nanum.sms.Coolsms;

@Service
public class SmsService {

	
	@Autowired
	private SqlSession sqlsession;
	
	public void board_sms_insert_send(SMS sms_lv, String phonenum, String msg)
			throws ClassNotFoundException, SQLException {
		
		SmsDAO smsDAO = sqlsession.getMapper(SmsDAO.class);
		if (sms_lv.getSms_level() == 0) {
			
			String api_key = "NCS57669A9A2CF28";
			String api_secret = "C98E44D860F72775740F0793CEACF60F";
			Coolsms coolsms = new Coolsms(api_key, api_secret);

			// Parameters
			// 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
			HashMap<String, String> set = new HashMap<String, String>();
			
			JSONObject obj = new JSONObject();
			JSONArray list = new JSONArray();
			
			obj.put("type", "sms"); // 문자타입
			obj.put("to", phonenum); // 받는사람번호
			obj.put("text", msg); // 문자내용

			list.add(obj); // 원하는 만큼 obj를 넣어주면 됩니다.
			
			set.put("extension", list.toString()); // set extension
			set.put("from", "01025366326"); // 발신번호
			
			JSONObject result = coolsms.send(set); // 보내기&전송결과받기
			
			smsDAO.sms_update(sms_lv.getSms_no()); // 1로 권한 변경
		}

	}
	
	public void board_sms_insert_receive(String message,int board_no)
			throws ClassNotFoundException, SQLException {

		// sms
		String api_key = "NCS57669A9A2CF28";
		String api_secret = "C98E44D860F72775740F0793CEACF60F";
		
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		
		JSONObject obj = new JSONObject();
		JSONArray list = new JSONArray();
		
		obj.put("type", "lms"); // 문자타입
		obj.put("to", sqlsession.getMapper(SmsDAO.class).sms_getphonenumber(board_no)); // 받는사람번호
		obj.put("text", message); // 문자내용
		
		list.add(obj); // 원하는 만큼 obj를 넣어주면 됩니다.
	
		set.put("extension", list.toString()); // set extension
		set.put("from", "01025366326"); // 발신번호
	
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	}

}
