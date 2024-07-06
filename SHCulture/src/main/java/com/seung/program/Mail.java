package com.seung.program;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class Mail {
	private int ranNum;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	public void RandomNum() {
		Random ran = new Random();
		int checkNum = ran.nextInt(88888) + 11111;
		System.out.println("인증번호: " + checkNum);
		ranNum = checkNum;
	}

	public String sendContent(String email) {
		System.out.println("sendContent");
		RandomNum();
		String setFrom = "ysh2030ys@gmail.com";
		String toMail = email;
		String title = "오늘의 맛집 이메일 인증번호입니다."; 
		String content = "홈페이지에 방문해주셔서 감사합니다" +
						"<br><br>" + "인증번호  " + ranNum + 
						"<br>" + "<해당 인증번호를 기입하세요>";
		
		mailSender(setFrom,toMail, title, content);
		return Integer.toString(ranNum);
	}

	public void mailSender(String setFrom, String toMail, String title, String content) {
		System.out.println(mailSender);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
