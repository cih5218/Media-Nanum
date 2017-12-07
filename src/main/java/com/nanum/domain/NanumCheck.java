/*
@FileName : NanumCheck.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : NanumCheck

//관련된 테이블 생성문 
 CREATE TABLE NANUM_CHECK (
	member_id NUMBER NOT NULL,
	checked_no NUMBER NOT NULL,
	check_date DATE NOT NULL
);
*/
public class NanumCheck {

	private int member_id; //회원 번호
	private int checked_no; //평가 번호
	private String check_date; //평가 날짜
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getChecked_no() {
		return checked_no;
	}
	public void setChecked_no(int checked_no) {
		this.checked_no = checked_no;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	
	
}
