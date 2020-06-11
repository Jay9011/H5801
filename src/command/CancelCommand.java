package command;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOPay;

public class CancelCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int p_uid = 0;
		DAOPay daoPay = new DAOPay();

		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("puid")) {
				p_uid = Integer.parseInt(cookies[i].getValue());
			}
		}

		try {
			daoPay.deleteOrder(p_uid);
		} catch (SQLException e) {
		}


		Cookie cookie2 = new Cookie("puid", "0");
		cookie2.setMaxAge(0);
		response.addCookie(cookie2);
	}

}
