package command;

import java.sql.SQLException;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOUser;
import oracle.net.aso.s;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		DAOUser dao = new DAOUser();
		
		// 매개변수 받아오기
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String phoneNum = request.getParameter("phoneNum");
		String addressA =request.getParameter("addressA");
		String addressB = request.getParameter("addressB");
		int smsOk = Integer.parseInt(request.getParameter("smsok"));
	
		if(name != null && nick != null && email != null && pw !=null && birth != null && addressA != null &&
				name.trim().length() > 0 && nick.trim().length() > 0 && email.trim().length() > 0 && pw.trim().length() > 0
				&& birth.trim().length() > 0 && phoneNum.trim().length() > 0 && addressA.trim().length() > 0) {
			
			try {
				cnt = dao.insert(email, pw, nick, name, birth, phoneNum, gender, addressA, addressB, smsOk);
			} catch (SQLException e) {
				e.printStackTrace();
			}// end if
			
			request.setAttribute("cnt", cnt);
			
		}
	
	
	
	
	
	
	
	
	
	} // end execute()

} // end Command
