package command.reservation;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import command.Command;
import dbcommon.DTOReservation;

public class ReservJsonParse implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTOReservation[] reservations = (DTOReservation[]) request.getAttribute("ReservList");
		ReservationJSON json = new ReservationJSON();
		String status = (String) request.getAttribute("status");

		if(reservations == null) {
			json.setStatus(status);
			json.setCount(0);
			json.setMessage("데이터가 없습니다.");
		} else {
			json.setStatus(status);
			json.setCount(reservations.length);
			json.setList(Arrays.asList(reservations));
		}

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


	} // end execute()

} // end Class
