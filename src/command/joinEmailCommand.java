package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import dbcommon.DAOUser;
import dbcommon.DTOUser;
import dbcommon.Email;

import java.util.Properties;
import java.util.Random;

public class joinEmailCommand implements Command, Email{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		// 이메일이 존재하면 이메일 안보내지도록 하고 없으면 이메일 보내지도록 만들기 
		String email  = null;
		//매개 변수 받기 
		if(request.getParameter("email") != null) {
			email = request.getParameter("email");			
		}
		// 메일 서버 세팅
		String host = "smtp.gmail.com"; // "smtp.naver.com"
		String user = USER; // gmail ID
		String password = PASSWORD; // gmail 비밀번호 
		
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
	     String com = uri.substring(conPath.length());
		//사용자에게 보낼 메세지 기입(이메일 인증하기로 이동)
		String local = url.toString().replaceAll(com,"");
		// 사용자의 이메일
		String to = email;
		// 제목, 내용
		String subject = "HOLIC 스터디 카페 회원가입 이메일 인증입니다.";
		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요"+"<a href='"+local+"joinEchk.ho?email="+to+"'>이메일 인증하기</a>";
		
		//SMTP 에 접속하기 위한 정보 기입
		Properties props = new Properties();
		props.put("mail.smtp.user", user);
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465); // 465 혹은 587
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.debug", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email 전송
		try{
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "holic"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
			msg.setSubject(subject);
			msg.setContent(content, "text/html;charset=UTF-8");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
