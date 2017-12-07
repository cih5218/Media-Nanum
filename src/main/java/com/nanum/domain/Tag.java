/*
@FileName : Tag.java
@Project : NANUM
@Date : 2016. 6. 8.
@Author: 신진우
*/
package com.nanum.domain;
 
/*      
 @Class : Tag

//관련된 테이블 생성문 
 CREATE TABLE TAG (
	tag_name VARCHAR2(50) NOT NULL,
	tag_hits NUMBER NOT NULL
);
*/
public class Tag {

	private String tag_name; //태그명
	private int tag_hits; //횟수
	
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public int getTag_hits() {
		return tag_hits;
	}
	public void setTag_hits(int tag_hits) {
		this.tag_hits = tag_hits;
	}
	
	
}
