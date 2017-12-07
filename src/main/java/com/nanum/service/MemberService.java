
	/*
	    @FileName : JoinService.java
		@Project : NANUM
		@Date : 2016. 6. 14.
		@Author : 신진우
	*/

package com.nanum.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nanum.persistance.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
    private VelocityEngine velocityEngine;
	
	public String forget(String name,String email) throws ClassNotFoundException, SQLException {
		
		//임시 비밀번호 설정
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		 
		for(int i=0; i<10; i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		
		String password = String.valueOf(buf); //임시 비밀번호 형변환
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		String mail = memberDao.getMemberEmail(name,email); //이름과 이메일이 일치하는지 확인
		String result = "";
		if (mail != null) {
			memberDao.setMemberPwd(password,mail); //임시 비밀번호 변경

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("chaih5218@gmail.com","NANUM");
				messageHelper.setTo(mail);
				messageHelper.setSubject("[NANUM] NANUM 임시 비밀번호");
				Map model = new HashMap();
                model.put("password", password);
                String text = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine,"com/nanum/service/password.vm","UTF-8",model);
				//messageHelper.setText(name + " 님의 임시 비밀번호는 "+password+" 입니다. 로그인 하신 후에 비밀번호 재설정을 통해 비밀번호를 변경해주세요.");
                messageHelper.setText(text,true);
				mailSender.send(message);
				result = "1";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			result = "0";
		}

		return result;
	}
	
	/*회원인증*/
	public void signup(String email,String password) throws ClassNotFoundException, SQLException{
		
		//String result = "";
		//if (email == null) {

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("chaih5218@gmail.com","NANUM");
				messageHelper.setTo(email);
				messageHelper.setSubject("[NANUM] NANUM 에 오신 것을 환영합니다.");
				Map model = new HashMap();
                model.put("email", email);
                model.put("password", password);
                String text = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine,"com/nanum/service/mail.vm","UTF-8",model);
				//messageHelper.setText("링크를 클릭하여 회원인증을 해주세요 <HTML><a href='http://192.168.0.149:8090/nanum/signup_certification.nn?email="+email+"&password="+password+"'>회원 인증</a></HTML>",true);
                messageHelper.setText(text,true);
				mailSender.send(message);
				//result = "1";
			} catch (Exception e) {
				e.printStackTrace();
			}
		//}else{
		//	result = "0";
		//} 
		
		//return result;
		
	}
		
	//회원가입시 아이디 체크 (비동기)
	public String duplicationCheck(String email) throws Exception {
		String result;
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		if (memberDao.checkedEmail(email) > 0 && memberDao.getEmailLevel(email) > 0) {
			result = "false"; // 아이디사용불가
		} else {
			result = "true"; // 아이디사용가능
		}
		return result;
	}
	
}