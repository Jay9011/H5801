package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcommon.DAOPay;

public class RefundOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		DAOPay dao = new DAOPay();
		int p_uid;
		int cnt;
		
		try {
			
			if(session.getAttribute("p_uid") != null && (Integer)session.getAttribute("p_cancel") == 1) {
				p_uid = (Integer) session.getAttribute("p_uid");
				System.out.println(p_uid);
				
			} else {
				p_uid = 0;
				System.out.println(p_uid);
				cnt = 0;
				request.setAttribute("refundOk", cnt);
				return;
			}
			
			String tid_cancel= null;
			int p_cancel = 2;
			
			cnt = dao.updateTidbyRefund(tid_cancel, p_cancel ,p_uid);
			
			request.setAttribute("refundOk", cnt);
			System.out.println(cnt);
			
		}  catch (SQLException e) {
			e.printStackTrace();
		} 
	}

}
