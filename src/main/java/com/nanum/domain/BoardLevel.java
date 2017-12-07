/*
 	@FileName : BoardLevel.java
 	@Project :NANUM 
 	@Date:	2016. 6. 7. 
 	@Author:한수민 
 
*/
package com.nanum.domain;
/*  	 
  	 @Class :BoardLevel
*/
/*
 //관련된 테이블 생성문 
	CREATE TABLE BOARD_LEVEL(
	board_level NUMBER NOT NULL,
	board_state VARCHAR2(1000)NOT NULL
	);
*/
public class BoardLevel {
	
	private int board_level; //권한번호
	private String board_state; //권한내용
	
	/*
	Update

	@Contents : DTO getter,setter 추가
	
	*/
	public int getBoard_level() {
		return board_level;
	}
	public void setBoard_level(int board_level) {
		this.board_level = board_level;
	}
	public String getBoard_state() {
		return board_state;
	}
	public void setBoard_state(String board_state) {
		this.board_state = board_state;
	}
}