/*
@FileName : TagInfo.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : TagInfo

//관련된 테이블 생성문 
 CREATE TABLE TAGINFO (
	board_no NUMBER NOT NULL,
	tag_name VARCHAR2(50) NOT NULL
);
*/
public class TagInfo {

	private int board_no; //게시글 번호
	private String tag_name; //태그명
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	
}
