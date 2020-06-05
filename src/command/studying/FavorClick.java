package command.studying;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.Command;
import dbcommon.DAOStudy;

public class FavorClick implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy dao = new DAOStudy();
		FavorJSON favorJSON = new FavorJSON();

		int[] resultSet = new int[2];
		int s_uid = Integer.parseInt(request.getParameter("s_uid"));
		int m_uid = Integer.parseInt(request.getParameter("m_uid"));

		try {
			resultSet = dao.favorClick(s_uid, m_uid);

			if(resultSet[0] < 1) {
				favorJSON.setStatus("FAIL");
			} else {
				favorJSON.setStatus("OK");
			}
			favorJSON.setIsClicked(resultSet[1]);

			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(favorJSON);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
