package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Pagination;
import dbcommon.DAOBook;
import dbcommon.DTOBook;

public class BookAdminCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOBook dao = new DAOBook();
		DTOBook [] arr = null;

		HttpSession session = request.getSession(true);
		int uid;

		// 매개변수 받아오기
		if(request.getSession().getAttribute("uid") != null) {
			uid = (Integer)(request.getSession().getAttribute("uid"));
		} else {
			uid = 0;
			return;
		}
		
		
		//System.out.println(uid);
		
		if(uid != 0 && !(uid < 0)){
			try {

				//페이징 바
				Pagination pg = new Pagination();
				int maxNum = dao.countAllAdmin();
				pg.makeLastPageNum(maxNum);
				
				int curPage = 0;
				
				if(request.getParameter("page") == null || request.getParameter("page").trim().equals("")) {
					curPage = 1;
				}else {
					curPage = Integer.parseInt(request.getParameter("page")); //페이지에 파라미터값을 넘겨준다
				}
				pg.makeBlock(curPage);
				
				request.setAttribute("curPageNum", curPage);
				request.setAttribute("blockStartNum", pg.getBlockStartNum());
				request.setAttribute("blockLastNum", pg.getBlockLastNum());
				request.setAttribute("lastPageNum", pg.getLastPageNum());
				
				
				//몇개의 페이지 구현할지
				int fromRow = (curPage-1) * pg.getListCnt() + 1;
				int toRow = fromRow + pg.getListCnt();
				
				dao = new DAOBook();
				arr = dao.selectFromRowAdmin(fromRow, toRow);
				request.setAttribute("book", arr);
				
				//================================================================================================================
				
				
				
				
				//몇개의 페이지 구현할지
				fromRow = (curPage-1) * pg.getListCnt() + 1;
				toRow = fromRow + pg.getListCnt();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}

}
