package com.nanum.persistance;

import java.sql.SQLException;

import com.nanum.domain.SMS;

public interface SmsDAO {

	// sms_update
	public void sms_update(int sms_no) throws ClassNotFoundException, SQLException;

	// sms_no가져오기
	public SMS sms_level_check(int sms_no) throws ClassNotFoundException, SQLException;

	// 나눔 요청 문자전송
	public String sms_getphonenumber(int board_no) throws ClassNotFoundException, SQLException;

	// 나눔 번호 주기
	public String sms_givephonenumber(int member_id) throws ClassNotFoundException, SQLException;

	// 문자 전송시 sms테이블에 내역 등록
	public void sms_insert(SMS sms) throws ClassNotFoundException, SQLException;

	// 문자 전송시 보낸사람 id 저장해야한다.
	public int sms_receive_id(int board_no) throws ClassNotFoundException, SQLException;

	// sms_no가져와야함
	public int sms_no(int board_no) throws ClassNotFoundException, SQLException;

	
}
