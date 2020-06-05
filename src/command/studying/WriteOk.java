package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class WriteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAOStudy dao = new DAOStudy();

		int m_uid = Integer.parseInt(request.getParameter("m_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int sc_uid = Integer.parseInt(request.getParameter("sc_uid"));

		if(subject != null && subject.trim().length() > 0 ) {
			try {
				cnt = dao.insert(m_uid, subject, content, sc_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end try
		} // end if

		request.setAttribute("result", cnt);
	}

}
