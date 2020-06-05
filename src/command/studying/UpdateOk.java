package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class UpdateOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy dao = new DAOStudy();

		int s_uid = Integer.parseInt(request.getParameter("s_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		int cnt = 0;

		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.update(s_uid, subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("result", cnt);
	}

}
