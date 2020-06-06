package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOUser;

public class ReinfoOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		int cnt = 0;
	
		HttpSession session = request.getSession();
		int uid = (Integer)session.getAttribute("uid");
		String nick = (String) session.getAttribute("nick");
		String pw = (String) session.getAttribute("pw");
		String phoneNum = (String) session.getAttribute("phoneNum");
		
		try {
			cnt = udao.update(uid, nick, pw, phoneNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("update", cnt);
	}
}
