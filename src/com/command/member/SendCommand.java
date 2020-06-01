package com.command.member;

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

import com.holic.beans.MemberDAO;
import com.holic.beans.MemberDTO;

import common.Email;

import java.util.Properties;
import java.util.Random;


public class SendCommand implements Command1, Email{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		MemberDTO [] arr = null;
		
		
		// 매개변수 받아오기
		String email = request.getParameter("email");
		
		try {
			arr = dao.selectByEmail(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 회원정보를 받아오고 가져온 데이터에서 email 값을 비교하여 존재하지 않으면 인증 메일 미발송
		if(arr == null || arr.length == 0) {
			request.setAttribute("send_result", cnt);
			return;
		}
		
		// 메일 서버 세팅
		String host = "smtp.gmail.com"; // "smtp.naver.com"
		String user = USER; // gmail ID
		String password = PASSWORD; // gmail 비밀번호 
		
		// 메일 받을 주소
		String to_email = arr[0].getEmail();
		
		// SMTP 서버 정보 설정
		Properties props = new Properties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.debug", "true");
		
		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rd = new Random();
		for(int i=0; i<10; i++) {
			int rdIndex = rd.nextInt(3);
			switch(rdIndex) {
			case 0: // a-z
				temp.append((char) ((int)(rd.nextInt(26))+97));
				break;
			case 1: // A-Z
				temp.append((char) ((int)(rd.nextInt(26))+65));
				break;
			case 2: // 0-9
				temp.append((rd.nextInt(10)));
				break;
			}
		}
		String keyCode = temp.toString();
		System.out.println(keyCode);
		
		// 
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "holic"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			
			// 메일 제목
			msg.setSubject("Holic 스터디 카페 인증 메일");
			
			// 메일 내용
			msg.setText("인증 번호는 : " + temp);
			
			
			Transport.send(msg);
			System.out.println("이메일 전송");
			cnt = 1;
			request.setAttribute("send_result", cnt);
			request.setAttribute("send_arr", arr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("keyCode", keyCode);
		
		
	} // end execute()

} // end SendCommand
