package command.studying;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOComment;
import dbcommon.DTOStudyTable;

public class View implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		DTOStudyTable[] studyTable = null;
		boolean isViewed = false;
		int liked = 0;

		int uid = Integer.parseInt(request.getParameter("s_uid"));

		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("s_table_no" + uid)) {
					// 만약 "s_table_no" + uid 라는 쿠키가 존재한다면
					isViewed = true;
				} else {
					// 쿠키가 없었다면
					Cookie cookie = new Cookie("s_table_no" + uid, "visited");
					cookie.setMaxAge(60 * 60 * 12);	// 60초(1분) *-> 60분(1시간) -> 12시간
					response.addCookie(cookie);
				} // end if
			} // end for
		} // end if

		try {
			studyTable = daoStudy.viewPage(uid, isViewed);

			daoStudy = new DAOStudy();
			HttpSession session = request.getSession(false);
			int m_uid = 0;
			if(session.getAttribute("m_uid") != null) {
				m_uid = (int) session.getAttribute("m_uid");
				liked = daoStudy.selectFavor(uid, m_uid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("viewInfo", studyTable);
		request.setAttribute("liked", liked);
	}

}
