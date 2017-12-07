package com.nanum.domain;

public class AdminMemberList {

	private int member_id; //회원번호
	private String member_email; //회원 이메일
	private String member_signdate; //회원 가입일
	private String member_lastdate; //회원 접속일
	private int member_level; //회원 권한번호
	private String member_name; //이름
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_signdate() {
		return member_signdate;
	}
	public void setMember_signdate(String member_signdate) {
		this.member_signdate = member_signdate;
	}
	public String getMember_lastdate() {
		return member_lastdate;
	}
	public void setMember_lastdate(String member_lastdate) {
		this.member_lastdate = member_lastdate;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}