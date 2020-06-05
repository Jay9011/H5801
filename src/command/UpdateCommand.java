package command;

// 작성자: 낙경
// 2020-06-01  23:00 수정
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOPassword;


public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		int uid;
		DAOPassword dao = new DAOPassword();
		
		// 매개변수 받아오기
		if(request.getParameter("uid").trim() != null) {
			uid = Integer.parseInt(request.getParameter("uid").trim());
		} else {
			uid =0;
			return;
		}
		
		String pw = request.getParameter("resetPw");
		
		String keyCode = (String) request.getSession().getAttribute("keyCode");
		String chkKeyCode = request.getParameter("chkKeyCode").trim();
		System.out.println(keyCode);
		System.out.println(chkKeyCode);
		
		if(keyCode == null) {
			System.out.println("인증번호 존재하지 않음");
			cnt = -2;
			request.setAttribute("reset_result", cnt);
			
			return;
		}
		
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
				cnt = dao.updateByEmail(uid, pw);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
		
		request.setAttribute("reset_result", cnt);

	}

}
