/*
	@FileName : BoardNN.java
	@Project : NANUM
	@Date : 2016. 6. 7.
	@Author : 한수민
*/
package com.nanum.domain;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/*  	 
	 @Class : BoardNN
 
 //관련된 테이블 생성문
 CREATE TABLE BOARD_NN (
		board_no NUMBER NOT NULL,   
		board_title VARCHAR2(100) NOT NULL,
		board_category VARCHAR2(20) NOT NULL,   
		board_image_title VARCHAR2(1000) NOT NULL,   
		board_image_detail VARCHAR2(1000) NOT NULL, 
		board_movie_url VARCHAR2(1000) NOT NULL,  
		board_content VARCHAR2(1000) NOT NULL,   
		board_account NUMBER NOT NULL,   
		board_date DATE NOT NULL,   
		board_term NUMBER NOT NULL,   
		board_hit NUMBER NOT NULL,   
		board_like NUMBER NOT NULL,   
		member_id NUMBER NOT NULL,   
		board_level NUMBER NOT NULL,   
		location_no NUMBER NOT NULL   
	);
*/
public class BoardNN {
	
	private int board_no; //게시글 번호
	private String  board_title; //제목
	private String  board_category; //카테고리
	private String  board_image_title; //대문 사진
	private String  board_image_detail; //상세 내용 사진 
	private String  board_movie_url; //동영상 주소 
	private String  board_content; //내용
	private int  board_account; //금액
	private String  board_date; //등록일
	private String  board_term; //등록기간
	private int  board_hit; //조회수
	private int  board_like; //좋아요
	private int member_id; //회원번호
	private int  board_level; //권한번호
	private int location_no; //위치정보 번호
	private double distance;
	private String member_email;
	private String member_image;
	
	
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	private List<CommonsMultipartFile> files;
	
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	
	/*
	Update
	
	@Contents : DTO getter,setter 추가
	
	*/
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_image_title() {
		return board_image_title;
	}
	public void setBoard_image_title(String board_image_title) {
		this.board_image_title = board_image_title;
	}
	public String getBoard_image_detail() {
		return board_image_detail;
	}
	public void setBoard_image_detail(String board_image_detail) {
		this.board_image_detail = board_image_detail;
	}
	public String getBoard_movie_url() {
		return board_movie_url;
	}
	public void setBoard_movie_url(String board_movie_url) {
		this.board_movie_url = board_movie_url;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_account() {
		return board_account;
	}
	public void setBoard_account(int board_account) {
		this.board_account = board_account;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_term() {
		return board_term;
	}
	public void setBoard_term(String board_term) {
		this.board_term = board_term;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_like() {
		return board_like;
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