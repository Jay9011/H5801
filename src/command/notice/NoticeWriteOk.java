package command.notice;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.Command;
import dbcommon.DAOStudy;

public class NoticeWriteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAONotice dao = new DAONotice();

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		HttpSession httpSession = request.getSession();
		int m_uid = (int) httpSession.getAttribute("uid");

		if(subject != null && subject.trim().length() > 0 ) {
			try {
				cnt = dao.insert(subject, content, m_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end try
		} // end if

		request.setAttribute("result", cnt);

	}

}
