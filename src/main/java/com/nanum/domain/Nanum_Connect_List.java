package com.nanum.domain;

public class Nanum_Connect_List {

	int member_id;//
	String board_title;
	String board_image_title;
	int board_account;
	String sms_date;
	int board_no;
	String sms_email;//이건컨트롤러에서 값 받아와야함
	
	
	
	public int getSend_id() {
		return member_id;
	}
	public void setSend_id(int send_id) {
		this.member_id = send_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_image_title() {
		return board_image_title;
	}
	public void setBoard_image_title(String board_image_title) {
		this.board_image_title = board_image_title;
	}
	public int getBoard_account() {
		return board_account;
	}
	public void setBoard_account(int board_account) {
		this.board_account = board_account;
	}
	public String getSms_date() {
		return sms_date;
	}
	public void setSms_date(String sms_date) {
		this.sms_date = sms_date;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getSms_email() {
		return sms_email;
	}
	public void setSms_email(String sms_email) {
		this.sms_email = sms_email;
	}
	
	
	@Override
	public String toString() {
		return "Nanum_Connect_List [member_id=" + member_id + ", board_title=" + board_title + ", board_image_title="
				+ board_image_title + ", board_account=" + board_account + ", sms_date=" + sms_date + ", board_no="
				+ board_no + ", sms_email=" + sms_email + "]";
	}

	
	
	
}
