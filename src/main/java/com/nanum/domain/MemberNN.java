/*
@FileName : MemberNN.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/*      
 @Class : MemberNN

//관련된 테이블 생성문 
 CREATE TABLE MEMBER_NN (
	member_id NUMBER NOT NULL,
	member_image VARCHAR2(255) NOT NULL,
	member_name VARCHAR2(255) NOT NULL,
	member_cell VARCHAR2(30) NOT NULL,
	member_age NUMBER NOT NULL,
	member_loc VARCHAR2(50) NOT NULL,
	member_category VARCHAR2(255),
	member_about VARCHAR2(1000)
);
*/
public class MemberNN {

	private int member_id; //회원 번호
	private String member_image; //사진
	private String member_name; //이름
	private String member_cell; //연락처
	private int member_age; //나이
	private int location_no; //활동지역
	private String member_category; //관심분야
	private String member_about; //자기소개
	
	private List<CommonsMultipartFile> files;
	
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_cell() {
		return member_cell;
	}
	public void setMember_cell(String member_cell) {
		this.member_cell = member_cell;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getMember_category() {
		return member_category;
	}
	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}
	public String getMember_about() {
		return member_about;
	}
	public void setMember_about(String member_about) {
		this.member_about = member_about;
	}
	
	
}
