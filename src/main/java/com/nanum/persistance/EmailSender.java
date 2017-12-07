package com.nanum.persistance;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.nanum.domain.Email;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(Email email) throws Exception{
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom("NANUM");		
		messageHelper.setTo(email.getReciever()); 
		messageHelper.setSubject(email.getSubject());
		messageHelper.setText(email.getContent());

		mailSender.send(message);
	}
}
