package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOStudyTable;

public class View implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		DTOStudyTable[] studyTable = null;

		int uid = Integer.parseInt(request.getParameter("s_uid"));

		try {
			studyTable = daoStudy.viewPage(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("viewInfo", studyTable);
	}

}
