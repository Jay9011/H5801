package command.notice;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class NoticeDeleteOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice dao = new DAONotice();

		int cnt = 0;
		int n_uid = Integer.parseInt(request.getParameter("n_uid"));
		try {
			cnt = dao.deleteByUid(n_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}

}
