/*
@FileName : Report.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : Report

//관련된 테이블 생성문 
 CREATE TABLE REPORT (
	report_no NUMBER NOT NULL,
	report_category VARCHAR2(200) NOT NULL,
	report_member_no NUMBER NOT NULL,
	report_date DATE NOT NULL,
	report_content VARCHAR2(1000) NOT NULL,
	board_no NUMBER NOT NULL
);
*/
public class Report {

	private int report_no; //신고 번호
	private String report_category; //카테고리
	private int report_member_no; //신고한 회원번호
	private String report_date; //신고날짜
	private String report_content; //신고내용
	private int board_no; //게시글 번호
	
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public String getReport_category() {
		return report_category;
	}
	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
	public int getReport_member_no() {
		return report_member_no;
	}
	public void setReport_member_no(int report_member_no) {
		this.report_member_no = report_member_no;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	
}
