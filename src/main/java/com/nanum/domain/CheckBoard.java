/*
	@FileName : CheckBoard.java
	@Project : NANUM
	@Date : 2016. 6. 8.
	@Author : 한수민
*/

package com.nanum.domain;

/*  	 
	@Class : CheckBoard

//관련된 테이블 생성문
 CREATE TABLE CHECK_BOARD (
	checked_no NUMBER NOT NULL,  
	board_no NUMBER NOT NULL,   
	check_date DATE NOT NULL  
);
*/

public class CheckBoard{
	
	private int check_no; //평가 번호 
	private int board_no; //게시글 번호
	private String check_date; //평가 날짜 
	
	/*
	Update

	@Contents : DTO getter,setter 추가
	
	*/
	
	
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
}