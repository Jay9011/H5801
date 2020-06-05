package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOBook;
import dbcommon.DTOBook;


public class BookCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOBook dao = new DAOBook();
		DTOBook [] arr = null;
		
		// 매개변수 받아오기
		int uid = (int)(request.getSession().getAttribute("uid"));
		System.out.println(uid);
		if(uid != 0 && !(uid<0)){
			try {
				arr = dao.selectByUid(uid);
				//System.out.println(arr.length);
				
				request.setAttribute("book", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	} // end execute()

} // end class
