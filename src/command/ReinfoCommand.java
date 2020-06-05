package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOUser;
import dbcommon.DTOUser;
import oracle.net.aso.s;

public class ReinfoCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOUser udao = new DAOUser();
		DTOUser [] uarr = null;
	
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		try {
			uarr = udao.selectByEmail(email);
			request.setAttribute("ulist", uarr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
