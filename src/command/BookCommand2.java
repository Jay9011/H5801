package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Pagination;
import dbcommon.DAOBook2;
import dbcommon.DTOBook;


//작성자 : 윤지우
public class BookCommand2 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOBook2 dao = new DAOBook2();
		DTOBook[] arr = null;
		HttpSession session = request.getSession(true);
		int uid = (Integer)session.getAttribute("uid");
//		System.out.println(uid);
		//매개변수 받아오기
		//int uid = Integer.parseInt(request.getParameter("m_uid"));
		
		try {
			
			//내가 쓴 게시글 받아오기
//			stables = dao.selectBoard(uid);
//			request.setAttribute("all", stables);
			
			//페이징 바
			Pagination pg = new Pagination();
	    	dao = new DAOBook2();
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
			
			dao = new DAOBook2();
			arr = dao.selectPaging_st(uid, fromRow, toRow);
			request.setAttribute("all", arr);
			
			//================================================================================================================
			
			
			
			
			//몇개의 페이지 구현할지
			fromRow = (curPage-1) * pg.getListCnt() + 1;
			toRow = fromRow + pg.getListCnt();
			
//			dao = new DAOBook2();
//			stables = dao.selectPaging_like(uid, fromRow, toRow);
//			request.setAttribute("like", stables);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
