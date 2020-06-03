package command.notice;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

public class NoticeLoad implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAONotice daoNotice = new DAONotice();
		DTONotice[] table = null;
		
		try {
			table = daoNotice.selectAll();
			request.setAttribute("nListRow", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}