package command.faq;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

public class FaqLoad implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOFaq daoFaq = new DAOFaq();
		DTOFaq[] table = null;
		
		try {
			table = daoFaq.selectALL();
			request.setAttribute("listRow", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}