package command.faq;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

public class FaqView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOFaq daoFaq = new DAOFaq();
		DTOFaq[] table = null;
		
		try {
			int f_uid = Integer.parseInt(request.getParameter("uid"));
			table = daoFaq.selectByUid(f_uid);
			request.setAttribute("fListView", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
