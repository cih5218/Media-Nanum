/*
@FileName : NanumBest.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : NanumBest

//관련된 테이블 생성문 
 CREATE TABLE NANUM_BEST (
	member_id NUMBER NOT NULL,
	best_image VARCHAR2(255) NOT NULL,
	best_about VARCHAR2(255) NOT NULL,
	best_title VARCHAR2(255) NOT NULL,
	best_date DATE NOT NULL
);
*/
public class NanumBest {

	private int member_id; //회원 번호
	private String best_image; //인증 사진
	private String best_about; //인증 소개
	private String best_title; //인증 제목
	private String best_date; //등록일
	private int best_status; //등록일
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
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
	public int getBest_status() {
		return best_status;
	}
	public void setBest_status(int best_status) {
		this.best_status = best_status;
	}
	
}
