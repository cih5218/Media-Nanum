package com.nanum.domain;

public class CategoryCount {

	private String board_category;
	private int category_count;
	private int all_category;
	
	
	public int getAll_category() {
		return all_category;
	}
	public void setAll_category(int all_category) {
		this.all_category = all_category;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public int getCategory_count() {
		return category_count;
	}
	public void setCategory_count(int category_count) {
		this.category_count = category_count;
	}
}
