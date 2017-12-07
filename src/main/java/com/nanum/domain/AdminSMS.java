package com.nanum.domain;

public class AdminSMS {

	private String send_id;
	private String receive_id;
	private int board_no;
	private String sms_date;
	
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getSms_date() {
		return sms_date;
	}
	public void setSms_date(String sms_date) {
		this.sms_date = sms_date;
	}
}
