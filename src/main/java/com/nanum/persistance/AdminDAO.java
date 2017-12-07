package com.nanum.persistance;

import java.sql.SQLException;
import java.util.List;

import com.nanum.domain.AdminMemberList;
import com.nanum.domain.AdminReportList;
import com.nanum.domain.AdminSMS;
import com.nanum.domain.BoardNN;
import com.nanum.domain.CategoryCount;
import com.nanum.domain.Member;
import com.nanum.domain.Report;
import com.nanum.domain.SMS;
import com.nanum.domain.Tag;

public interface AdminDAO {
	
	//신고 등록report_user_id
	public void report_insert(Report report) throws ClassNotFoundException, SQLException;
	//신고할 이메일
	Member report_user_email(int board_no)throws ClassNotFoundException, SQLException;

	//신고 카테고리report_user_category
	public String report_user_category(int board_no)throws ClassNotFoundException, SQLException;


	//회원 관리
	public List<AdminMemberList> getMemberList() throws ClassNotFoundException, SQLException;
	
	//게시글 관리
	public List<BoardNN> getBoardList() throws ClassNotFoundException, SQLException;
	
	//인기 태그
	public List<Tag> getTagList() throws ClassNotFoundException, SQLException;
	
	//카테고리 별 나눔 수
	public List<CategoryCount> getCategoryList() throws ClassNotFoundException, SQLException;
	
	//신고 리스트
	public List<AdminReportList> getReportList() throws ClassNotFoundException, SQLException;
	
	//SMS 전송 내역(send)
	public List<AdminSMS> getSmsListSend() throws ClassNotFoundException, SQLException;
	
	//SMS 전송 내역(receive)
	public List<AdminSMS> getSmsListReceive() throws ClassNotFoundException, SQLException;
}
