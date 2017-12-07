package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nanum.domain.AdminMemberList;
import com.nanum.domain.AdminReportList;
import com.nanum.domain.AdminSMS;
import com.nanum.domain.BoardNN;
import com.nanum.domain.CategoryCount;
import com.nanum.domain.Tag;
import com.nanum.persistance.AdminDAO;

@Service
public class AdminService {

	@Autowired
	private SqlSession sqlsession;
	
	public HashMap<String, Object> Admin_list() throws ClassNotFoundException, SQLException{
		
		AdminDAO adminDao = sqlsession.getMapper(AdminDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		List<AdminMemberList> memberlist = adminDao.getMemberList();
		List<BoardNN> boardlist = adminDao.getBoardList();
		List<Tag> taglist = adminDao.getTagList();
		List<CategoryCount> categorylist = adminDao.getCategoryList();
		List<AdminReportList> reportlist = adminDao.getReportList();
		List<AdminSMS> smslistsend = adminDao.getSmsListSend();
		List<AdminSMS> smslistreceive = adminDao.getSmsListReceive();
		
		hashmap.put("memberlist", memberlist);
		hashmap.put("boardlist", boardlist);
		hashmap.put("taglist", taglist);
		hashmap.put("categorylist", categorylist);
		hashmap.put("reportlist", reportlist);
		hashmap.put("smslistsend", smslistsend);
		hashmap.put("smslistreceive", smslistreceive);
		
		return hashmap;
	}
}
