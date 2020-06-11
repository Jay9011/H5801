package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOUser;

public class ChkMailCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		
		String email = request.getParameter("email");
		int re = udao.check_email(email);
		
		if(re == 1) {
			request.setAttribute("result",re); // 이메일 있음
		}else {
			request.setAttribute("result", re);
		}
		
	}
	

}
