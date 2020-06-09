package command.reservation;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.Command;
import dbcommon.DTORoomInfo;
import dbcommon.RoomInfoJSON;

public class RoomInfoJsonParse implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTORoomInfo[] roomInfos = (DTORoomInfo[]) request.getAttribute("RoomsInfo");
		RoomInfoJSON json = new RoomInfoJSON();
		String status = (String) request.getAttribute("status");
		String message = (String) request.getAttribute("message");

		if(roomInfos == null) {
			json.setStatus("FAIL");
			json.setCount(0);
			json.setMessage(message + "정보를 불러오는데 실패했습니다.");
		} else {
			json.setStatus(status);
			json.setCount(roomInfos.length);
			json.setList(Arrays.asList(roomInfos));
		} // end if

		ObjectMapper mapper = new ObjectMapper();

		try {
			String jsonString = mapper.writeValueAsString(json);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	} // end execute();
} // end Class
