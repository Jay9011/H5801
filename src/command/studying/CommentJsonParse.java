package command.studying;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.Command;
import dbcommon.DTOComment;

public class CommentJsonParse implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTOComment[] comments = (DTOComment[]) request.getAttribute("CommentList");
		CommentJSON commentJSON = new CommentJSON();

		if(comments == null) {
			commentJSON.setStatus("FAIL");
		} else {
			commentJSON.setStatus("OK");
			commentJSON.setCount(comments.length);
			commentJSON.setList(Arrays.asList(comments));
		}

		ObjectMapper mapper = new ObjectMapper();

		try {
			String jsonString = mapper.writeValueAsString(commentJSON);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
