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
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String phoneNum = request.getParameter("phoneNum");
		int smsok = Integer.parseInt(request.getParameter("smsok"));
		String addressA = request.getParameter("addressA");
		String addressB = request.getParameter("addressB");
		
		try {
			cnt = udao.update(uid, pw, nick, phoneNum, gender, addressA, addressB, smsok);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("update", cnt);
	}
}
