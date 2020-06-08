package command.reservation;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOReservation;
import dbcommon.DTOReservation;

public class ReservListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOReservation dao = new DAOReservation();
		DTOReservation[] reservations = null;

		String pickedDate = request.getParameter("pickedDate");
		String status = "";

		try {
			reservations = dao.selectFromDate(pickedDate);
			status = "OK";
		} catch (SQLException e) {
			status = "FAIL";
		}

		request.setAttribute("status", status);
		request.setAttribute("ReservList", reservations);

	} // end execute();

} // end Class
