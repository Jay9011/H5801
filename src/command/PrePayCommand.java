package command;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOPay;

public class PrePayCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int p_uid = 0;
		DAOPay daoPay = new DAOPay();

		int m_uid = 0;
		if(request.getParameter("m_uid") != null) {
			m_uid = Integer.parseInt(request.getParameter("m_uid"));
		}
		int t_uid = 0;
		if(request.getParameter("t_uid") != null) {
			t_uid = Integer.parseInt(request.getParameter("t_uid"));
		}
		int total_amount = 0;
		if(request.getParameter("total_amount") != null) {
			total_amount = Integer.parseInt(request.getParameter("total_amount"));
		}
		String p_starttime = request.getParameter("selectDate");
		String item_name = request.getParameter("item_name");
		String p_endtime = "";

		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date endtime = dateFormat.parse(p_starttime);
			Calendar c = Calendar.getInstance();
			c.setTime(endtime);
			c.add(Calendar.DATE, 1);
			p_endtime = dateFormat.format(c.getTime());
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		try {
			p_uid = daoPay.createOrder(p_starttime, p_endtime, item_name, total_amount, m_uid, t_uid);
			if(p_uid > 0) {
				request.setAttribute("p_uid", p_uid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // end execute()
} // end Class
