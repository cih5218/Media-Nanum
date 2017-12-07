package com.nanum.domain;

public class SMS {

	int sms_no;
	int sms_level;
	int send_id;
	int receive_id;
	int board_no;
	String sms_date;
	String sms_date_req;
	
	
	public int getSms_no() {
		return sms_no;
	}
	public void setSms_no(int sms_no) {
		this.sms_no = sms_no;
	}
	public int getSms_level() {
		return sms_level;
	}
	public void setSms_level(int sms_level) {
		this.sms_level = sms_level;
	}
	public int getSend_id() {
		return send_id;
	}
	public void setSend_id(int send_id) {
		this.send_id = send_id;
	}
	public int getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(int receive_id) {
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
	
	
	public String getSms_date_req() {
		return sms_date_req;
	}
	public void setSms_date_req(String sms_date_req) {
		this.sms_date_req = sms_date_req;
	}
	
	@Override
	public String toString() {
		return "SMS [sms_no=" + sms_no + ", sms_level=" + sms_level + ", send_id=" + send_id + ", receive_id="
				+ receive_id + ", board_no=" + board_no + ", sms_date=" + sms_date + ", sms_date_req=" + sms_date_req
				+ "]";
	}

	
	

	
	
	
	
}
