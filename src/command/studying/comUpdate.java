package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOComment;

public class comUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		DTOComment[] comments = null;

		int uid = Integer.parseInt(request.getParameter("sr_uid"));

		try {
			comments = daoStudy.selectCommentBySRuid(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("CommentList", comments);
	}

}
