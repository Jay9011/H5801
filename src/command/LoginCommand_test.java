package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOLogin_test;
import dbcommon.DTOLogin_test;

public class LoginCommand_test implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOLogin_test dao = new DAOLogin_test();
		DTOLogin_test [] arr = null;
		HttpSession session = request.getSession();
		int cnt = 0;
		
		// 매개변수 받아오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		System.out.println(email);
		System.out.println(pw);
		try {
			arr = dao.login(email, pw);
			System.out.println(arr.toString());
			
			if(arr != null || arr.length != 0) {
				session.setAttribute("uid", arr[0].getUid());
				System.out.println(arr[0].getUid());
//				session.setAttribute("email", arr[0].getEmail());
//				session.setAttribute("name", arr[0].getUid());
//				session.setAttribute("nick", arr[0].getNick());
				//HttpContext.Current.Session.Add("uid", arr[0].getUid());
				cnt = 1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("login", cnt);
	} // end execute()
}
