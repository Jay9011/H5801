package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Pagination;
import controller.Pagination2;
import dbcommon.DAOBook;
import dbcommon.DAOBook2;
import dbcommon.DAOBook3;
import dbcommon.DTOBook;


public class BookCommand3 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOBook3 dao = new DAOBook3();
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
		
		if(uid != 0 && !(uid<0)){
			try {
				//arr1 = dao.selectByUid(uid);
				//System.out.println(arr.length);
			
				
				//request.setAttribute("book", arr1);
				
				//페이징 바
				Pagination2 pg = new Pagination2();
		    	dao = new DAOBook3();
				int maxNum = dao.getCount(uid);
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
				
				dao = new DAOBook3();
				arr = dao.selectPaging_st(uid, fromRow, toRow);
				request.setAttribute("book", arr);
				
				//================================================================================================================
				
				
				
				
				//몇개의 페이지 구현할지
				fromRow = (curPage-1) * pg.getListCnt() + 1;
				toRow = fromRow + pg.getListCnt();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	} // end execute()

} // end class
