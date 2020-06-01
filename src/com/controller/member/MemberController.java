package com.controller.member;

import java.io.IOException;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.member.Command1;
import com.command.member.SelectCommand;
import com.command.member.SendCommand;
import com.command.member.UpdateCommand;
import com.holic.beans.MemberDTO;

import java.util.Properties;
import java.util.Random;

@WebServlet("*.holic")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() invoke");
		
		// POST 방식에서 폼 태크 입력 값이 JSP 파일로 전송 될 때 한글이 깨지지 않도록 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		// 컨트롤러는 다음 두 개를 선택해야 한다.
		String viewPage = null; // 어떠한 뷰? --> 페이지
		Command1 command = null; // 어떠한 커맨드?--> 어떠한 로직 수행
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI(); 
		String conPath = request.getContextPath(); 
		String com = uri.substring(conPath.length()); 
		// String.substring(int beginIndex): 해당 스트링의 앞에서부터 index만큼 삭제
		
		//테스트 출력
				System.out.println("uri: "+uri);
				System.out.println("conPath: "+conPath);
				System.out.println("com: "+com);
				
		// 컨트롤러는 커맨드에 따라, 로직을 수행할 결과를 내보낼 view를 결정한다.
		switch(com) {
		// 비밀번호 찾기(인증번호 받기)
		case "/findPw.holic":
			viewPage = "findPw.jsp";
			break;

		case "/findPwOk.holic":
			command = new SendCommand();
			command.execute(request, response);
			viewPage = "findPwOk.jsp";
			break;
		
		// 비밀번호 변경
		case "/resetPw.holic":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "resetPw.jsp";
			break;
		
		case "/resetPwOk.holic":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "resetPwOk.jsp";
			break;
		} // end switch
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		
			// getRequestDispatcher()
				// 매개변수: path name("/"로 시작함).
				// 리턴값: RequestDispatcher 객체 (resource wrapper) or null
		} // end if
	} // end actionDo
} // end class
