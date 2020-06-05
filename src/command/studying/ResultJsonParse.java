package command.studying;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.Command;

public class ResultJsonParse implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = (Integer) request.getAttribute("result");
		ResultJSON resultJSON = new ResultJSON();

		if(result < 1) {
			resultJSON.setStatus("FAIL");
		} else {
			resultJSON.setStatus("OK");
		}

		ObjectMapper mapper = new ObjectMapper();

		try {
			String jsonString = mapper.writeValueAsString(resultJSON);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
