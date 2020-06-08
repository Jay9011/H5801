package command.notice;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class NoticeUpdateOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice noticedao = new DAONotice();

		int n_uid = Integer.parseInt(request.getParameter("n_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		int cnt = 0;

		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = noticedao.update(n_uid, subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("result", cnt);
	}

}
