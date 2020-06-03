package command.intro;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

public class IntroLoad implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOIntro daoIntro = new DAOIntro();
		DTOIntro[] table = null;
		
		try {
			table = daoIntro.selectALL();
			request.setAttribute("introRow", table);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}
	
}