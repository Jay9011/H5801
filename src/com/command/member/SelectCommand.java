package com.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.holic.beans.MemberDAO;
import com.holic.beans.MemberDTO;

public class SelectCommand implements Command1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO [] arr = null; 
		
		// 매개변수 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			arr = dao.selectByUid(uid);
			
			request.setAttribute("select_arr", arr);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // end execute()

}
