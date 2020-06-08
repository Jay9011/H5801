package command.faq;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class FaqWriteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAOFaq dao = new DAOFaq();

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		if(subject != null && subject.trim().length() > 0 ) {
			try {
				cnt = dao.insert(subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end try
		} // end if

		request.setAttribute("result", cnt);

	}

}
