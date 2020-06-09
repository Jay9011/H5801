package command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dbcommon.AjaxBook;
import dbcommon.DTOBook;

public class AjaxBookCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTOBook [] arr = (DTOBook []) request.getAttribute("list");
			
		AjaxBook result = new AjaxBook();
		
		result.setStatus((String)request.getAttribute("status"));
		result.setMessage((String)request.getAttribute("message"));
		
		if(arr != null) {
			result.setCount(arr.length);
			result.setList(Arrays.asList(arr));
		}
		
		try {
			result.setPage((Integer)request.getAttribute("page"));
			result.setTotalPage((Integer)request.getAttribute("totalPage"));
			result.setWritePages((Integer)request.getAttribute("writePages"));
			result.setPageRows((Integer)request.getAttribute("pageRows"));
			result.setTotalCnt((Integer)request.getAttribute("totalCnt"));
			
		} catch(Exception e) {
			
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = 
					mapper.writerWithDefaultPrettyPrinter().writeValueAsString(result);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
