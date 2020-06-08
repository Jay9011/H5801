package command.faq;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class FaqUpdateOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOFaq faqdao = new DAOFaq();

		int f_uid = Integer.parseInt(request.getParameter("f_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		int cnt = 0;

		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = faqdao.update(f_uid, subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("result", cnt);
	}

}
