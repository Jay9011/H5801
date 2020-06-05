package command.studying;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class ComDeleteOk implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy dao = new DAOStudy();

		int cnt = 0;
		int sr_uid = Integer.parseInt(request.getParameter("sr_uid"));

		try {
			cnt = dao.deleteComment(sr_uid);
		} catch (Exception e) {

		}

		request.setAttribute("result", cnt);
	} // end execute
} // end Class
