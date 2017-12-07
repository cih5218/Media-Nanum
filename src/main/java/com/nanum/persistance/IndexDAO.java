package com.nanum.persistance;

import java.sql.SQLException;
import java.util.ArrayList;

import com.nanum.domain.BoardNN;

public interface IndexDAO {
	// 장바구니 입력
	public int basketInsert(int borad_no, int member_id) throws ClassNotFoundException, SQLException;

	// 장바구니 가져오기
	public ArrayList<BoardNN> basket_select(int member_id) throws ClassNotFoundException, SQLException;

	// 장바구니 삭제
	public int basket_delete(int member_id, int board_no) throws ClassNotFoundException, SQLException;

}
