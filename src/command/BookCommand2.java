package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Pagination;
import dbcommon.DAOBook;
import dbcommon.DTOBook;

 
public class BookCommand2 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOBook dao = new DAOBook();  // DAO 객체 생성
		DTOBook [] arr = null;

//		HttpSession session = request.getSession(true);
//		int m_uid;
//		
//		// 매개변수 받아오기
//		if(request.getSession().getAttribute("uid") != null) {
//			m_uid = (Integer)(request.getSession().getAttribute("uid"));
//		} else {
//			m_uid = 0;
//			return;
//		}
		
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		// 페이징 관련 세팅값들
		int page =1; // 현재 페이지 (디폴트는 1 page)
		int pageRows = 5; // 한 '페이지' 에 몇개의 글을 리스트? (디폴트 8개)
		int writePages = 5; // 한 [페이징] 에 몇개의 '페이지' 를 표시? (디폴트 10)
		int totalCnt = 0; // 글은 총 몇개인지?
		int totalPage = 0;   // 총 몇 '페이지' 분량인지?
		
		String param;
		
		param= request.getParameter("page");
		if(param != null && param.trim().length() !=0) {
			try{
				page = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				// 예외 처리 안함
			}
		}
				

	
		// pageRows 값 :  '한 페이지' 에 몇개의 글?
		param = request.getParameter("pageRows");
		if(param != null && param.trim().length() !=0){
			try {
				pageRows = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				// 예외 처리 안함
			}
		}
		

			try {
				// 글 전체 개수 구하기
				//totalCnt = dao.countAll(m_uid);
				totalCnt = dao.countAll();
				System.out.println(totalCnt);
				
				// 총 몇 페이지 분량인가?
				totalPage = (int)Math.ceil(totalCnt/(double)pageRows);
				
				// 몇번재 row 부터 ?
				int fromRow = (page -1) * pageRows + 1; // ORACLE 은 1부터 ROWNUM시작
				//int fromRow = (page - 1) * pageRows;  // MySQL 은 0부터 시작
				
				//arr = dao.selectFromRow( fromRow, pageRows);
				arr = dao.selectFromRow(fromRow, pageRows);
				
				if(arr == null) {
					message.append("데이터 없음");
				} else {
					status = "OK";
				}
				
				
			} catch(SQLException e) {
				message.append("[트랜잭션 에러:" + e.getMessage()+ "]");
			}
	
		
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		request.setAttribute("list", arr);
		
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("writePages", writePages);
		request.setAttribute("pageRows", pageRows);
		request.setAttribute("totalCnt", totalCnt);
		
	} // end execute()

} // end class
