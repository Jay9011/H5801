package command.studying;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;

public class commentOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAOStudy dao = new DAOStudy();

		String s_uid = request.getParameter("s_uid");
		String m_uid = request.getParameter("m_uid");
		String content = request.getParameter("content");
		String sc_group = request.getParameter("sc_group");
		String depth = request.getParameter("depth");

		if(content != null && content.trim().length() > 0 && s_uid != null && m_uid != null) {
			cnt = dao.insertComment(s_uid, m_uid, content, sc_group, depth);
		}
	}

}
