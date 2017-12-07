/*
@FileName : Scrap.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : Scrap

//관련된 테이블 생성문 
 CREATE TABLE SCRAP (
	board_no NUMBER NOT NULL,
	member_id NUMBER NOT NULL,
	scrap_date DATE NOT NULL
);
*/
public class Scrap {

	private int board_no; //게시글 번호
	private int member_id; //회원번호
	private String scrap_date; //날짜
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getScrap_date() {
		return scrap_date;
	}
	public void setScrap_date(String scrap_date) {
		this.scrap_date = scrap_date;
	}
	
	
}
