package command.faq;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class FaqDeleteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOFaq dao = new DAOFaq();

		int cnt = 0;
		int f_uid = Integer.parseInt(request.getParameter("f_uid"));
		try {
			cnt = dao.deleteByUid(f_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}

}
