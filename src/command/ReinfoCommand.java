package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOUser;
import dbcommon.DTOUser;

public class ReinfoCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		DTOUser [] uarr = null;
		
		String email = request.getParameter("email");
		
		try {
			uarr = udao.selectByEmail(email);
			request.setAttribute("ulist", uarr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
