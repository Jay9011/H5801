package command.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOReservation;
import dbcommon.DTORoomInfo;

public class RoomInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOReservation dao = new DAOReservation();
		DTORoomInfo[] rooms = null;
		String status = "";
		String message = "";

		String roomIdS = request.getParameter("roomId");
		int roomId = 0;
		if(roomIdS == null || roomIdS.trim().equals("") || roomIdS.length() < 1) {
			message = "[잘못된 접근입니다]";
			status = "FAIL";
		} else {
			try {
				roomId = Integer.parseInt(roomIdS);
				rooms = dao.selectRoomInfo(roomId);
				status = "OK";
			} catch (Exception e) {
				status = "FAIL";
				message = "[정보를 가져오는 중 에러 : " + e.getMessage() + "]";
			} // end try
		} // end if


		request.setAttribute("status", status);
		request.setAttribute("RoomsInfo", rooms);
		request.setAttribute("message", message);

//		request.setAttribute("rooms", rooms);

	} // end execute();
} // end Class
