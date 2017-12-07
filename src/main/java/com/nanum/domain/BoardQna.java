/*
	@FileName : BoardQna.java
	@Project : NANUM
	@Date : 2016. 6. 7.
	@Author: 한수민
*/
package com.nanum.domain;
/*  	 
 	@Class : BoardQna

//관련된 테이블 생성문
CREATE TABLE BOARD_QNA (
	qna_no NUMBER NOT NULL,  
	board_no NUMBER NOT NULL, 
	qna_content VARCHAR2(1000) NOT NULL,  
	qna_date DATE NOT NULL,  
	qna_member_no NUMBER NOT NULL 
);
*/
public class BoardQna{
	
	private int qna_no; //나눔문의 번호
	private int board_no; //게시글 번호 
	private String qna_content; //나눔문의 내용
	private String qna_date; //나눔문의 날짜
	private int qna_member_no; //나눔문의 회원 번호
	
	/*
	Update

	@Contents : DTO getter,setter 추가
	
	*/
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_member_no() {
		return qna_member_no;
	}
	public void setQna_member_no(int qna_member_no) {
		this.qna_member_no = qna_member_no;
	}
}