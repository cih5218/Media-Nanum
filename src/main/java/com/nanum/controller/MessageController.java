package com.nanum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import com.nanum.domain.BoardNN;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.Message;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.MemberDAO;
import com.nanum.persistance.MessageDAO;
import com.nanum.persistance.SmsDAO;
import com.nanum.service.MessageService;

@Controller
public class MessageController {
	
	//@Secured({"ROLE_일반회원","ROLE_재능대기","ROLE_재능회원","ROLE_블라인드","ROLE_관리자"})
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private MessageService messageservice;
	
	//메시지 목록
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/message_list.nn")
	public String message_list(Model model,HttpSession session) throws ClassNotFoundException, SQLException{
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		Member member = (Member)session.getAttribute("Member");
		model.addAttribute("list",messageDAO.messageList(member.getMember_id()));
		model.addAttribute("name",messageDAO.messageListName(member.getMember_id()));
		return "message.message_list";
	}
	
	//메시지 상세
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/message_detail.nn")
	public String message_detail(int Sender,@RequestParam(value = "board_no", required = false)String board_no,Model model,HttpSession session) throws ClassNotFoundException, SQLException {
		HashMap<String, Object> hashmap = messageservice.message_detail(Sender, session,board_no);
		model.addAttribute("Sender",Sender);
		model.addAttribute("sendername",hashmap.get("sendername"));
		model.addAttribute("membernn",hashmap.get("membernn"));
		model.addAttribute("requestboard",hashmap.get("requestboard"));
		return "message.message_detail";
	}
	
	//메시지 상세 목록
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping(value="/message_get.nn",method=RequestMethod.GET)
	public void getMessageList(int sender_no,HttpServletResponse response,HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, IOException{
		response.setContentType("text/event-stream;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
		StringBuffer outs = messageservice.getMessageList(sender_no, session, request);
		PrintWriter writer = response.getWriter();
		//writer.write("retry:100\n");
        writer.write(outs + "\n\n");
		writer.flush();
	}
	
	//메시지 전송
	@Secured({"ROLE_재능회원","ROLE_관리자"})
	@RequestMapping("/message_insert.nn")
	public void insertChat(String text,int sender_no,int board_no,HttpSession session) throws ClassNotFoundException, SQLException{
		messageservice.insertChat(text, sender_no, board_no, session);
	}
	
	//메시지 삭제
	@RequestMapping(value="/messageDelete.nn",method=RequestMethod.POST)
	public View messageDelete(String member_id,HttpSession session) throws ClassNotFoundException, SQLException{
		MessageDAO messageDAO = sqlsession.getMapper(MessageDAO.class);
		Member member = (Member)session.getAttribute("Member");
		messageDAO.messageDelete(member_id,member.getMember_id());
		return JsonView;
	}
	
	// 메시지 수신 여부 체크
	@RequestMapping("/messagecheck.nn")
	public void messageCheck(HttpSession session, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		response.setContentType("text/event-stream;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		HashMap<String, Object> hashmap = messageservice.messageCheck(session);
		PrintWriter writer = response.getWriter();
		writer.write("data:");
		writer.write(hashmap.get("messagenumber") + "\n\n");
		writer.flush();
	}
}