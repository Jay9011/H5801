package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.holic.beans.UserDAO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();

		// 매개변수 받아오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		try {
			int chk = udao.selectByUid(email, pw);
			if (chk == 1) {
				request.setAttribute("chk", chk);
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
			} else {
				request.setAttribute("chk", chk);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
