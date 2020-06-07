package command.studying;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.corba.se.spi.ior.MakeImmutable;

import command.Command;
import dbcommon.DTOStudyTable;

public class ListJSONParse implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTOStudyTable[] tables = (DTOStudyTable[]) request.getAttribute("list");

		PostJSON postJSON = new PostJSON();

		postJSON.setStatus((String) request.getAttribute("status"));
		postJSON.setMessage((String) request.getAttribute("message"));
		if(tables == null) {
			postJSON.setCount(0);
		} else {
			postJSON.setCount(tables.length);
			postJSON.setList(Arrays.asList(tables));
		}
		postJSON.setPageRows((Integer) request.getAttribute("pageRows"));
		postJSON.setTotalCnt((Integer) request.getAttribute("totalCnt"));
		// 현재 페이지
		postJSON.setPage((Integer) request.getAttribute("page"));
		// 전체 페이지
		postJSON.setTotalPage((Integer) request.getAttribute("totalPage"));
		// 페이징 페이지
		postJSON.setWritePages((Integer) request.getAttribute("writePages"));
		// 블럭 시작/종료 계산
		postJSON.makeBlock();

		ObjectMapper mapper = new ObjectMapper();

		try {
			String jsonString = mapper.writerWithDefaultPrettyPrinter()
					.writeValueAsString(postJSON);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // end try
	} // end execute()

} // end Class
