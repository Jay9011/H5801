package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOStudyTable;

public class TableList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		DTOStudyTable[] table = null;

		try {
			table = daoStudy.selectAll();
			request.setAttribute("listRow", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end execute()

} // end Class
