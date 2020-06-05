package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class DeleteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy dao = new DAOStudy();

		int cnt = 0;
		int s_uid = Integer.parseInt(request.getParameter("s_uid"));
		try {
			cnt = dao.deleteByUid(s_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}

}
