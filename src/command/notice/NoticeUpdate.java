package command.notice;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DTOStudyTable;

public class NoticeUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice dao = new DAONotice();
		DTONotice[] arr = null;

		int n_uid = Integer.parseInt(request.getParameter("n_uid"));

		try {
			arr = dao.selectByUid(n_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("selected", arr);
	}

}
