package command.faq;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DTOStudyTable;

public class FaqUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOFaq dao = new DAOFaq();
		DTOFaq[] arr = null;

		int f_uid = Integer.parseInt(request.getParameter("f_uid"));

		try {
			arr = dao.selectByUid(f_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("selected", arr);
	}

}
