package command.notice;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;


public class NoticeView implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice daoNotice = new DAONotice();
		DTONotice[] table = null;
		
		try {
			int n_uid = Integer.parseInt(request.getParameter("uid"));			
			table = daoNotice.selectUid(n_uid);
			request.setAttribute("nListView", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}