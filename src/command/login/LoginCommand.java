package command.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.Command;
import dbcommon.DAOLogin;
import dbcommon.DTOMember;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOLogin login = new DAOLogin();
		DTOMember member = null;
		HttpSession session = request.getSession();
		int result = 0;

		String m_email = request.getParameter("m_email");
		String m_pw = request.getParameter("m_pw");

		if(m_email.trim().length() > 0 && m_email != null && m_pw.trim().length() > 0 && m_pw != null) {
			member = login.login(m_email);
			if(member != null && member.getM_pw().equals(m_pw)) {
				session.setAttribute("m_uid", member.getM_uid());
				session.setAttribute("m_email", member.getM_email());
				session.setAttribute("m_name", member.getM_name());
				session.setAttribute("m_nick", member.getM_nick());
				session.setAttribute("m_grade", member.getM_grade());
				session.setAttribute("m_birth", member.getM_birth());
				result = 1;
			} // end if
		} // end if
		request.setAttribute("result", result);
	} // end execute()
}
