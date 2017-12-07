package com.nanum.persistance;

import java.sql.SQLException;
import java.util.List;

import com.nanum.domain.MemberNN;
import com.nanum.domain.Message;

public interface MessageDAO {
	// 메시지 리스트 가져오기
	public List<Message> messageList(int member_id) throws ClassNotFoundException, SQLException;

	// 메시지 리스트 이름 가져오기
	public List<MemberNN> messageListName(int member_id) throws ClassNotFoundException, SQLException;

	// 메시지 정보 가져오기
	public List<Message> getMessageList(int member_id, int send_no) throws ClassNotFoundException, SQLException;

	// 메시지 정보 입력하기 (수신자 기준)
	public void messageInsert(String text, int sender_no, int member_id, int board_no)
			throws ClassNotFoundException, SQLException;

	// 보낸 메시지 상대 이름 가져오기
	public MemberNN getSenderName(int sender_no) throws ClassNotFoundException, SQLException;

	// 메시지 삭제하기
	public void messageDelete(String member_id, int my_id) throws ClassNotFoundException, SQLException;

	// 메시지 정보 입력하기 (발신자 기준)
	public void messageInsertSuccess(String text, int sender_no, int member_id, int board_no)
			throws ClassNotFoundException, SQLException;

	// 헤더 페이지에서 메시지 알림 여부 확인
	public int messageCheck(int member_id) throws ClassNotFoundException, SQLException;

	// 메시지 확인시 확인 여부 1로 변경
	public void messageCheckUpdate(int member_id, int sender_no) throws ClassNotFoundException, SQLException;

}
