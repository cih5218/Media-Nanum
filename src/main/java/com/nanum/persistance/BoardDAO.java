package com.nanum.persistance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.nanum.domain.BoardLike;
import com.nanum.domain.BoardNN;
import com.nanum.domain.CheckRe;
import com.nanum.domain.MemberNN;
import com.nanum.domain.Nanum_Connect_List;
import com.nanum.domain.SMS;
import com.nanum.domain.Tag;

public interface BoardDAO {

	// 등록 게시글 목록 가져오기
	public List<MemberNN> board_member_list(String title) throws ClassNotFoundException, SQLException;

	// 태그 목록 가져오기
	public List<Tag> tag_select_list() throws ClassNotFoundException, SQLException;

	// 태그 입력
	public int tag_insert(String tag_name) throws ClassNotFoundException, SQLException;

	// 태그 정보 입력
	public int taginfo_insert(String tag_name) throws ClassNotFoundException, SQLException;

	// 게시판 별 태그 가져오기
	public List<Tag> board_taginfo_list(int board_no) throws ClassNotFoundException, SQLException;

	// 페이지 멤버 프로필 리스트 받기
	public List<MemberNN> pageMemberList(HashMap map) throws ClassNotFoundException, SQLException;

	// 태그 정보 삭제
	public int taginfo_delete(int board_no) throws ClassNotFoundException, SQLException;

	// 등록 게시글 삭제(상태변경)
	public int board_delete(int board_no) throws ClassNotFoundException, SQLException;

	// 게시글 상세 보기
	public BoardNN board_detail(int board_no) throws ClassNotFoundException, SQLException;

	// sendId data가져오기
	public List<SMS> nanum_list_getSendid(int member_id) throws ClassNotFoundException, SQLException;

	// nanum_list_getReceiveid
	public List<SMS> nanum_list_getReceiveid(int member_id) throws ClassNotFoundException, SQLException;

	// 좋아요 여부 확인 like_count_check
	public int like_count_check(BoardLike boardlike) throws ClassNotFoundException, SQLException;

	// 좋아요 등록 like_count_insert
	public int like_count_insert(BoardLike boardlike) throws ClassNotFoundException, SQLException;

	// 좋아요 삭제 like_count_delete
	public int like_count_delete(BoardLike boardlike) throws ClassNotFoundException, SQLException;

	// 좋아요 게시판 전체 개수 like_count_delete
	public int like_count_total(int board_no) throws ClassNotFoundException, SQLException;

	// 등록 게시글 평가 확인
	public int board_check_eva(int board_no, int member_id) throws ClassNotFoundException, SQLException;

	// 등록 게시글 평가 답글 입력
	public int checkre_insert(CheckRe checkre) throws ClassNotFoundException, SQLException;

	// 등록 게시글 평가 답글 목록
	public List<CheckRe> checkre_list(int board_no) throws ClassNotFoundException, SQLException;

	// 나눔내역 판거 리스트 가져오기 nanum_list_buy
	public Nanum_Connect_List nanum_list_buy(int send_id, int board_no, int sms_level)
			throws ClassNotFoundException, SQLException;

	// 나눔내역 판거 리스트 가져오기
	public Nanum_Connect_List nanum_list_sell(int send_id, int board_no, int sms_level)
			throws ClassNotFoundException, SQLException;

	// 지역 검색 결과 카운트 가져오기
	public int getAreaSearchCount(HashMap map) throws ClassNotFoundException, SQLException;

	// 지역 검색 결과 리스트 받기
	public List<BoardNN> getAreaSearchList(HashMap map) throws ClassNotFoundException, SQLException;

	// 디테일 중복값 체크
	public int overlap_exist(int board_no, int member_id) throws ClassNotFoundException, SQLException;

	// 게시글 조회수 업데이트
	public int update_board_hit(BoardNN boardnn) throws ClassNotFoundException, SQLException;

	// 비슷한 게시글 가져오기
	public List<BoardNN> connect_board_list(String category) throws ClassNotFoundException, SQLException;

	// 비슷한 게시글 올린이 정보 가져오기
	public List<MemberNN> connect_board_Member(String category) throws ClassNotFoundException, SQLException;
}
