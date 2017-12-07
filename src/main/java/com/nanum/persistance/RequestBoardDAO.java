package com.nanum.persistance;

import java.sql.SQLException;

import com.nanum.domain.BoardRequest;

public interface RequestBoardDAO {

	//requestboard	요청 등록
	public void board_request_input(BoardRequest board) throws ClassNotFoundException, SQLException;
	
	//요청글 수정board_request_update
	public void board_request_update(BoardRequest board) throws ClassNotFoundException, SQLException;

	//요청글 삭제
	public void	board_request_delete(int board_no) throws ClassNotFoundException, SQLException;

	//요청글 데이터 가져오기
	public BoardRequest board_request_data(int board_id)throws ClassNotFoundException, SQLException;
		
	
}
