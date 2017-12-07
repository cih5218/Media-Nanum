package com.nanum.domain;

public class CheckBoard_List {
	
	private String member_email;
	private int check_no;
	private int check_score;
	private String check_content;
	private String check_date;
	private String member_image;
	private int member_id;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getCheck_score() {
		return check_score;
	}
	public void setCheck_score(int check_score) {
		this.check_score = check_score;
	}
	public String getCheck_content() {
		return check_content;
	}
	public void setCheck_content(String check_content) {
		this.check_content = check_content;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMember_id() {
		return member_id;
	}
}
