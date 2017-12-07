package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nanum.domain.BoardNN;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.Message;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.MemberDAO;
import com.nanum.persistance.MessageDAO;

@Service
public class MessageService {

	@Autowired
	private SqlSession sqlsession;
	
	public HashMap<String, Object> message_detail(int Sender,HttpSession session,String board_no) throws ClassNotFoundException, SQLException{
		
		MemberNN membernn = (MemberNN)session.getAttribute("Membernn");
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		BoardDAO boardDAO = sqlsession.getMapper(BoardDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberNN sendername = messageDAO.getSenderName(Sender);
		messageDAO.messageCheckUpdate(membernn.getMember_id(), Sender);
		if(board_no != null){
			BoardNN requestboard = boardDAO.board_detail(Integer.parseInt(board_no));
			hashmap.put("requestboard", requestboard);
		}
		hashmap.put("membernn", membernn);
		hashmap.put("sendername", sendername);
		hashmap.put("Sender", Sender);
		return hashmap;
	}
	
	public void insertChat(String text,int sender_no,int board_no,HttpSession session) throws ClassNotFoundException, SQLException{
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		Member member = (Member)session.getAttribute("Member");
		messageDAO.messageInsert(text,sender_no,member.getMember_id(),board_no);
		messageDAO.messageInsertSuccess(text, sender_no, member.getMember_id(),board_no);
	}
	
	public StringBuffer getMessageList(int sender_no,HttpSession session,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		Member member = (Member)session.getAttribute("Member");
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		List<Message> list = messageDAO.getMessageList(member.getMember_id(),sender_no);
		MemberNN senderimage = messageDAO.getSenderName(sender_no);
		StringBuffer outs = new StringBuffer();
		outs.append("data:");
		for (Message e : list){
			if(e.getReceiver_state() == 1){
				outs.append("<div><div class='track-buyer'><div class='track-buyer-right'><div class='inline-block float-left margin-5'>");
				outs.append("<img src='"+request.getContextPath()+"/resources/images/track_buyer.png' alt=''>");
				outs.append("</div></div><div class='inline-block track-buyer-left'><div class='message inline-block'>");
				outs.append(e.getMessage_content());
				outs.append("</div><div class='track-buyer-time inline-block'>");
				outs.append(e.getMessage_date());
				outs.append("</div></div></div></div>");
			}else{
				outs.append("<div><div class='track-seller'><div class='track-seller-left'><div class='inline-block'><a href='profile.nn?member_id="+sender_no+"'>");
				outs.append("<img class='border-round track-profile' src='"+request.getContextPath()+"/resources/upload/"+senderimage.getMember_image()+"' alt=''>");
				outs.append("</a></div><div class='inline-block float-right margin-5'>");
				outs.append("<img src='"+request.getContextPath()+"/resources/images/track_seller.png' alt=''>");
				outs.append("</div></div><div class='inline-block track-seller-right'><div class='message inline-block'>");
				outs.append(e.getMessage_content());
				outs.append("</div><div class='track-seller-time inline-block'>");
				outs.append(e.getMessage_date());
				outs.append("</div></div></div></div>");
			}
		}
		return outs;
	}
	
	public HashMap<String, Object> messageCheck(HttpSession session) throws ClassNotFoundException, SQLException{
		
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		Member member = (Member) session.getAttribute("Member");
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		if (member != null) {
			hashmap.put("messagenumber",messageDAO.messageCheck(member.getMember_id()));
		}
		return hashmap;
	}
}
