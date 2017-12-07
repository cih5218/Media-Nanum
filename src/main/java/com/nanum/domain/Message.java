/*
@FileName : Message.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : Message

//관련된 테이블 생성문 
 CREATE TABLE MESSAGE (
	message_no NUMBER NOT NULL,
	message_content VARCHAR2(1000) NOT NULL,
	message_date DATE NOT NULL,
	member_receiver NUMBER NOT NULL,
	member_sender NUMBER NOT NULL
);
*/
public class Message {

	private int message_no; //쪽지 번호
	private String message_content; //내용
	private String message_date; //보낸 날짜
	private int member_receiver; //수신 회원번호
	private int member_sender; //발신 회원번호
	private int member_confirm; //읽음 여부
	private int receiver_state; //수신자 상태
	private int sender_state; //발신자 상태
	private int board_no; //게시글 번호
	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getReceiver_state() {
		return receiver_state;
	}
	public void setReceiver_state(int receiver_state) {
		this.receiver_state = receiver_state;
	}
	public int getSender_state() {
		return sender_state;
	}
	public void setSender_state(int sender_state) {
		this.sender_state = sender_state;
	}
	public int getMember_confirm() {
		return member_confirm;
	}
	public void setMember_confirm(int member_confirm) {
		this.member_confirm = member_confirm;
	}
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public int getMember_receiver() {
		return member_receiver;
	}
	public void setMember_receiver(int member_receiver) {
		this.member_receiver = member_receiver;
	}
	public int getMember_sender() {
		return member_sender;
	}
	public void setMember_sender(int member_sender) {
		this.member_sender = member_sender;
	}
	
	
}
