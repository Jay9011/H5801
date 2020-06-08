package command.pagenotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.Command;
import command.notice.DAONotice;
import command.notice.DTONotice;
import dbcommon.DAOLoadBoard;

public class NoticePageingLoad implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice ndao = new DAONotice();
		DTONotice[] ndto = null;
		
		try {
			NoticePageing pg = new NoticePageing();
			ndao = new DAONotice();
			int maxNum = ndao.getNCount();
			
			pg.makeLastPageNum(maxNum);
			
			int curPage = 1;
			
			if(request.getParameter("page") == null || request.getParameter("page").trim().equals("")) {
				
			}else{
				try {
					curPage = Integer.parseInt(request.getParameter("page"));
					if (curPage < 1) {
						
					}else if (curPage > pg.getLastPageNum()) {
						curPage = pg.getLastPageNum();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			pg.makeBlock(curPage);
			
			request.setAttribute("curPageNum", curPage);
			request.setAttribute("blockStartNum", pg.getBlockStartNum());
			request.setAttribute("blockLastNum", pg.getBlockLastNum());
			request.setAttribute("lastPageNum", pg.getLastPageNum());
			
			int fromRow = (curPage-1) * pg.getListCnt() + 1;
			int toRow = fromRow + pg.getListCnt();
			
			ndao = new DAONotice();
			ndto = ndao.selectPaging_nt(fromRow, toRow);
			request.setAttribute("npagetable", ndto); 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
