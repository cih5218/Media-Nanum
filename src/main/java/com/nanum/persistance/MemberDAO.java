package com.nanum.persistance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.nanum.domain.BoardNN;
import com.nanum.domain.BoardRequest;
import com.nanum.domain.CheckBoard;
import com.nanum.domain.CheckBoard_List;
import com.nanum.domain.Checked;
import com.nanum.domain.CountScore;
import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.NanumBest;
import com.nanum.domain.NanumCheck;
import com.nanum.domain.Nanum_Check_List;
import com.nanum.domain.Nanum_member_check;

public interface MemberDAO {

	// 회원가입
	public int insert(String member_email, String member_password) throws ClassNotFoundException, SQLException;

	// 회원가입 이메일 중복확인
	public int checkedEmail(String email) throws ClassNotFoundException, SQLException;

	// 로그인 이메일 비밀번호 확인
	public Member loginCheck(String member_email) throws ClassNotFoundException, SQLException;

	// 접속일 업데이트
	public int lastDate(String member_email, String member_password) throws ClassNotFoundException, SQLException;

	// 인덱스 글 목록
	public List<BoardNN> getList(String title) throws ClassNotFoundException, SQLException;

	// fb login ->update last date
	public void fblogin(String email) throws ClassNotFoundException, SQLException;

	// fb sign up
	public void fbsignup(String email, String password) throws ClassNotFoundException, SQLException;

	// fb비밀번호 보내기(시큐리티떄무넹씀)
	public String getfbpassword(String email) throws ClassNotFoundException, SQLException;

	// 셋로그인세션
	public Member setloginsession(String email) throws ClassNotFoundException, SQLException;

	// 임시 비밀번호로 변경
	public int setMemberPwd(String password, String email) throws ClassNotFoundException, SQLException;

	// 이메일 찾기
	public String Id_search(String name, String number) throws ClassNotFoundException, SQLException;

	// 비밀번호 찾기에서 해당하는 이메일이 있는지 확인
	public String getMemberEmail(String pwdname, String email) throws ClassNotFoundException, SQLException;

	// 위치정보 insert
	public int insert_location(Location location) throws ClassNotFoundException, SQLException;

	// 위치정보 insert 된것 가져오기
	public int select_location_no() throws ClassNotFoundException, SQLException;

	// 회원 번호 가져오기
	public int select_member_no(String member_email) throws ClassNotFoundException, SQLException;

	// 등록 게시글 입력
	public int board_write(BoardNN boardnn) throws ClassNotFoundException, SQLException;

	
	// 평가 내용 입력
	public int check_insert(Checked check) throws ClassNotFoundException, SQLException;

	// 평가 번호 가져오기
	public int check_no_select() throws ClassNotFoundException, SQLException;

	// 게시글 평가 내역 입력
	public int check_board_insert(CheckBoard checkboard) throws ClassNotFoundException, SQLException;

	// 등록 게시글 작성 회원 아이디 가져오기
	public String board_member_email(int board_no) throws ClassNotFoundException, SQLException;

	// 게시글 평가 날짜 가져오기
	public String check_board_date(CheckBoard checkboard) throws ClassNotFoundException, SQLException;

	// 게시글 평가 내역 리스트 가져오기
	public List<CheckBoard_List> checkboard_list(int board_no) throws ClassNotFoundException, SQLException;

	// 등록 게시글 입력한 회원 이메일 가져오기
	public String board_member_select(int board_no) throws ClassNotFoundException, SQLException;

	// 보드 리스트 카운트
	public int getBoardCount(String title) throws ClassNotFoundException, SQLException;

	// 페이지 보드 리스트 받기
	public List<BoardNN> pageBoardList(HashMap map) throws ClassNotFoundException, SQLException;

	// 인기태그 받기
	public List getTag() throws ClassNotFoundException, SQLException;

	// 프로필 등록
	public int nanum_checkok(MemberNN membernn) throws ClassNotFoundException, SQLException;

	// 나눔인증 등록
	public int nanum_bestok(NanumBest nanumbest) throws ClassNotFoundException, SQLException;

	// 나눔대기 회원으로 권한 업데이트
	public int nanum_wait(int member_id) throws ClassNotFoundException, SQLException;
	
	// 위치정보 가져오기
	public Location select_location(int location_no) throws ClassNotFoundException, SQLException;
	
	// 회원가입시 이메일 인증 하기전 권한 0 주기
	public void insertSignup(String email, String password) throws ClassNotFoundException, SQLException;

	// 요청 게시글 목록
	public List<BoardRequest> getBoardRequest(HashMap map) throws ClassNotFoundException, SQLException;

	// 진행중인 도와주세요 총 건수 가져오기
	public int getRequestResult() throws ClassNotFoundException, SQLException;

	// 완료된 도와주세요 총 건수 가져오기
	public int getSuccessRequestResult() throws ClassNotFoundException, SQLException;

	// 총 재능인 인원 가져오기
	public int getMember_nn() throws ClassNotFoundException, SQLException;

	// 도와주세요 이름,사진 가져오기
	public List<MemberNN> getMember_name(HashMap map) throws ClassNotFoundException, SQLException;

	// 인덱스 페이지 후기 가져오기
	public List<Checked> getChecked() throws ClassNotFoundException, SQLException;

	// 인덱스 페이지 이름 가져오기
	public List<MemberNN> getCheckedName() throws ClassNotFoundException, SQLException;

	// 인덱스 페이지 올린 날짜 가져오기
	public List<CheckBoard> getCheckedDate() throws ClassNotFoundException, SQLException;

	// 인덱스 페이지 후기 판매자 제목 가져오기
	public List<BoardNN> getCheckedMember() throws ClassNotFoundException, SQLException;

	
	// 나눔 인증 리스트 가져오기
	public List<Nanum_Check_List> nanum_check_list() throws ClassNotFoundException, SQLException;

	// 나눔 인증 평가 입력
	public int nanum_check_insert(NanumCheck nanumcheck) throws ClassNotFoundException, SQLException;

	// 회원 정보 가져오기
	public Member select_member(int member_id) throws ClassNotFoundException, SQLException;

	// 게시글 count 가져오기
	public int count_boardnn(int member_id) throws ClassNotFoundException, SQLException;

	// 등록 게시글 업데이트
	public int boardnn_update(BoardNN boardnn) throws ClassNotFoundException, SQLException;

	// 회원가입 이메일 권한 체크
	public int checkedEmailLevel(String email) throws ClassNotFoundException, SQLException;

	// 회원가입시 이메일 중복일 때 비밀번호 변경
	public void updateSignup(String member_email, String member_password) throws ClassNotFoundException, SQLException;

	// 회원가입시 이메일 권한 번호 체크
	public int getEmailLevel(String email) throws ClassNotFoundException, SQLException;
	
	// 검색 결과 카운트
	public int getSearchResultCount(HashMap search) throws ClassNotFoundException, SQLException;

	// 페이지 보드 리스트 받기
	public List<BoardNN> SearchpageBoardList(HashMap map) throws ClassNotFoundException, SQLException;

	// 나눔인증 점수 합계, 개수 가져오기
	public CountScore count_nanum_best(int member_id) throws ClassNotFoundException, SQLException;

	// 나눔인증 상태 업데이트
	public int nanum_best_update(int member_id) throws ClassNotFoundException, SQLException;

	// 나눔 인증 정보 가져오기
	public List<Nanum_member_check> check_eva_list() throws ClassNotFoundException, SQLException;
	
	// 권한 업데이트
	public int update_nanumstatus(int member_id) throws ClassNotFoundException, SQLException;
}
