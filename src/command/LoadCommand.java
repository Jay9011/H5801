package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Pagination;
import dbcommon.DAOLoadBoard;
import dbcommon.DTOStudyTable;

//작성자 : 윤지우
public class LoadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOLoadBoard dao = new DAOLoadBoard();
		DTOStudyTable[] stables = null;
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
	    	dao = new DAOLoadBoard();
			int maxNum = dao.getCount(uid, "s_table");
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
			
			dao = new DAOLoadBoard();
			stables = dao.selectPaging_st(uid, fromRow, toRow);
			request.setAttribute("all", stables);
			
			//================================================================================================================
			
			//내가 댓글 쓴 게시글
			
			
			pg = new Pagination();
			dao = new DAOLoadBoard();
			maxNum = dao.getCount(uid, "sr_comment");
			pg.makeLastPageNum(maxNum);
		
			
			if(request.getParameter("page") == null || request.getParameter("page").trim().equals("")) {
				curPage = 1;
			}else {
				curPage = Integer.parseInt(request.getParameter("page")); //페이지에 파라미터값을 넘겨준다
			}
			pg.makeBlock(curPage);
			
			request.setAttribute("acurPageNum", curPage);
			request.setAttribute("ablockStartNum", pg.getBlockStartNum());
			request.setAttribute("ablockLastNum", pg.getBlockLastNum());
			request.setAttribute("alastPageNum", pg.getLastPageNum());
			
			
			//몇개의 페이지 구현할지
			fromRow = (curPage-1) * pg.getListCnt() + 1;
			toRow = fromRow + pg.getListCnt();
			
			dao = new DAOLoadBoard();
			stables = dao.selectPaging_cmt(uid, fromRow, toRow);
			request.setAttribute("comment", stables);
			
			
			//================================================================================================================
			
			
			
			
			//내가 찜한 게시글
			pg = new Pagination();
			dao = new DAOLoadBoard();
			maxNum = dao.getCount(uid, "s_favor");
			pg.makeLastPageNum(maxNum);
		
			
			if(request.getParameter("page") == null || request.getParameter("page").trim().equals("")) {
				curPage = 1;
			}else {
				curPage = Integer.parseInt(request.getParameter("page")); //페이지에 파라미터값을 넘겨준다
			}
			pg.makeBlock(curPage);
			
			request.setAttribute("bcurPageNum", curPage);
			request.setAttribute("bblockStartNum", pg.getBlockStartNum());
			request.setAttribute("bblockLastNum", pg.getBlockLastNum());
			request.setAttribute("blastPageNum", pg.getLastPageNum());
			
			
			//몇개의 페이지 구현할지
			fromRow = (curPage-1) * pg.getListCnt() + 1;
			toRow = fromRow + pg.getListCnt();
			
			dao = new DAOLoadBoard();
			stables = dao.selectPaging_like(uid, fromRow, toRow);
			request.setAttribute("like", stables);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
