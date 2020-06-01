package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.holic.beans.MemberDAO;


public class UpdateCommand implements Command1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		
		// 매개변수 받아오기
		int uid = Integer.parseInt(request.getParameter("uid").trim());
		String pw = request.getParameter("resetPw");
		
		String keyCode = (String) request.getSession().getAttribute("keyCode");
		String chkKeyCode = request.getParameter("chkKeyCode").trim();
		
		if(!keyCode.equals(chkKeyCode)) {
			System.out.println("인증번호 불일치");
			cnt = -1;
			request.setAttribute("reset_result", cnt);
			
			return;
		}
		
		System.out.println(uid);
		System.out.println(pw);
		
		if(uid != 0 && pw != null && pw.trim().length()>0) {
			
			try {
				cnt = dao.updateByEmail2(uid, pw);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
		
		request.setAttribute("reset_result", cnt);

	}

}
