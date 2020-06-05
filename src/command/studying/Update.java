package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOStudyTable;

public class Update implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy dao = new DAOStudy();
		DTOStudyTable[] arr = null;

		int s_uid = Integer.parseInt(request.getParameter("s_uid"));

		try {
			arr = dao.selectByUid(s_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("selected", arr);
	}

}
