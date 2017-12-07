/*
@FileName : BoardRequest.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author : 한수민
*/
package com.nanum.domain;

/*  	 
 	 @Class : BoardRequest

//관련된 테이블 생성문
CREATE TABLE BOARD_REQUEST (
	help_no NUMBER NOT NULL,
	request_title VARCHAR2(100) NOT NULL,  
	request_category VARCHAR2(20) NOT NULL,   
	request_content VARCHAR2(1000) NOT NULL,   
	request_account NUMBER NOT NULL,   
	request_date DATE NOT NULL,   
	request_term NUMBER NOT NULL,   
	member_id NUMBER NOT NULL,   
	board_level NUMBER NOT NULL,   
	location_no NUMBER NOT NULL   
);
*/

public class BoardRequest{
	
	private int help_no; //게시글 번호
	private String request_title; //제목
	private String request_category; //카테고리
	private String request_content; //내용
	private int request_account; //금액
	private String request_date; //등록일
	private String request_term; //등록기간
	private int member_id; //회원번호
	private int board_level; //권한번호
	private int location_no; //위치정보 번호
	
	/*
	Update
	
	@Contents : DTO getter,setter 추가
	
	*/
	
	public int getHelp_no() {
		return help_no;
	}
	public void setHelp_no(int help_no) {
		this.help_no = help_no;
	}
	public String getRequest_title() {
		return request_title;
	}
	public void setRequest_title(String request_title) {
		this.request_title = request_title;
	}
	public String getRequest_category() {
		return request_category;
	}
	public void setRequest_category(String request_category) {
		this.request_category = request_category;
	}
	public String getRequest_content() {
		return request_content;
	}
	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}
	public int getRequest_account() {
		return request_account;
	}
	public void setRequest_account(int request_account) {
		this.request_account = request_account;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	public String getRequest_term() {
		return request_term;
	}
	public void setRequest_term(String request_term) {
		this.request_term = request_term;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getBoard_level() {
		return board_level;
	}
	public void setBoard_level(int board_level) {
		this.board_level = board_level;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
}