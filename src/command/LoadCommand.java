package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOLoadBoard;
import dbcommon.DTOStudyTable;

//작성자 : 윤지우
public class LoadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOLoadBoard dao = new DAOLoadBoard();
		DTOStudyTable[] arr = null;
		
		//매개변수 받아오기
		int uid = Integer.parseInt(request.getParameter("m_uid"));
		
		try {
			//내가 쓴 게시글 받아오기
			arr = dao.selectBoard(uid);
			request.setAttribute("all", arr);
			
//			//내가 댓글 쓴 게시글
//			arr = dao.selectCMTBoard(uid);
//			request.setAttribute("comment", arr);
//			
//			//내가 찜한 게시글
//			arr = dao.selectLikeBoard(uid);
//			request.setAttribute("like", arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
