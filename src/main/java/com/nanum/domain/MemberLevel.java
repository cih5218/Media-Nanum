/*
@FileName : MemberLevel.java
@Project : NANUM
@Date : 2016. 6. 7.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : MemberLevel

//관련된 테이블 생성문 
 CREATE TABLE MEMBER (
	member_id NUMBER NOT NULL,
	member_email VARCHAR2(50) NOT NULL, 
	member_password VARCHAR2(30) NOT NULL, 
	member_signdate DATE NOT NULL,
	member_lastdate DATE NOT NULL, 
	member_level NUMBER NOT NULL 
);
*/
public class MemberLevel {

	private int member_level; //권한 번호
	private String member_state; //권한 내용
	
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public String getMember_state() {
		return member_state;
	}
	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}
	
	
}
