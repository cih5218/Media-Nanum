package com.nanum.domain;

public class Nanum_Check_List {
	
	private int check_no;
	private String best_image;
	private String best_about;
	private String best_title;
	private String best_date;
	private String member_id;
	private String member_image;
	private String member_email;
	private double check_score_avg;
	
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getCheck_no() {
		return check_no;
	}
	public String getBest_image() {
		return best_image;
	}
	public void setBest_image(String best_image) {
		this.best_image = best_image;
	}
	public String getBest_about() {
		return best_about;
	}
	public void setBest_about(String best_about) {
		this.best_about = best_about;
	}
	public String getBest_title() {
		return best_title;
	}
	public void setBest_title(String best_title) {
		this.best_title = best_title;
	}
	public String getBest_date() {
		return best_date;
	}
	public void setBest_date(String best_date) {
		this.best_date = best_date;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public void setCheck_score_avg(double check_score_avg) {
		this.check_score_avg = check_score_avg;
	}
	public double getCheck_score_avg() {
		return check_score_avg;
	}

}
