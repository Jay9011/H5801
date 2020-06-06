package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOUser;

public class chkNickCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		
		String nick = request.getParameter("nick");
		int re = udao.check_nick(nick);
		
		if(re == 1) {
			request.setAttribute("result",re); // 닉네임 있음
		}else {
			request.setAttribute("result", re);
		}
		
	}
	

}
