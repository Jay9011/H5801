package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOUser;
import dbcommon.DTOUser;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		DTOUser udto = null;
		// 매개변수 받아오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		try {
			int chk = udao.selectByUid(email, pw);
			if (chk == 1) {
				request.setAttribute("chk", chk);
				HttpSession session = request.getSession();
				udao = new DAOUser();
				udto = udao.login(email);
				session.setAttribute("email",udto.getEmail());
				session.setAttribute("uid", udto.getUid());
				session.setAttribute("nick", udto.getNick());
				session.setAttribute("grade", udto.getGrade());
			} else {
				request.setAttribute("chk", chk);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

