// 작성자: 낙경
// 2020-06-03  15:00 수정

package command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dbcommon.DAOPay;
import dbcommon.DTOBook;
import dbcommon.DTOPay;



public class PayCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		HttpURLConnection conn = null;
		BufferedReader in = null;
		String url_domain = request.getScheme() + "://" + request.getServerName()+":"+ request.getServerPort();
		String conPath = request.getContextPath();
		DAOPay dao = new DAOPay();
		DTOPay [] arr = null;
		int p_uid;
		
		if(request.getParameter("p_uid") != null) {
			p_uid = Integer.parseInt(request.getParameter("p_uid"));
			System.out.println(p_uid);
			
		} else {
			p_uid = 0;
			System.out.println(p_uid);
			return;
		}
		
		
		try {
			arr = dao.selectByUid(p_uid);
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 7498c3868ab21028b64464d2774c74e3");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			
			String cid = "TC0ONETIME";
			//String partner_order_id = request.getParameter("partner_order_id");
			//String partner_order_id = "partner_order_id";
			int partner_order_id = arr[0].getP_uid();
			String partner_user_id = arr[0].getEmail();
			//String partner_user_id = "partner_user_id";
			String item_name = arr[0].getB_seatType()+ arr[0].getT_name();
			//String item_name = "seat101";
			String quantity = "1";
			int total_amount = arr[0].getTotal_amount();
			String tax_free_amount = "1";
			String approval_url = url_domain+conPath+"/Payment/payOk.ho";
			String cancel_url = url_domain+conPath+"/MyPage/book.ho";
			String fail_url =  url_domain+conPath+"/MyPage/book.ho";
			
			
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("cid", cid);
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);
			params.put("item_name", item_name);
			params.put("quantity", quantity);
			params.put("total_amount", total_amount);
			params.put("tax_free_amount", tax_free_amount);
			params.put("approval_url", approval_url);
			params.put("cancel_url", cancel_url);
			params.put("fail_url", fail_url);
//			params.put("approval_url", "http://localhost:8101/Payment_Test/approve.payment");
//			params.put("cancel_url", "http://localhost:8101/Payment_Test/cancle.payment");
//			params.put("fail_url", "http://localhost:8101/Payment_Test/fail.payment");
			
			String string_params = new String();
			for(Map.Entry<String, Object> elem: params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			
			System.out.println(string_params);
			
			OutputStream out = conn.getOutputStream();
			out.write(string_params.getBytes());
			out.flush();
			out.close();
			
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String successUrl = null;
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			
			successUrl = (String)obj.get("next_redirect_pc_url");
			

			session.setAttribute("tid", (String)obj.get("tid"));
			System.out.println((String)obj.get("tid"));
			session.setAttribute("partner_order_id", partner_order_id);
			session.setAttribute("partner_user_id", partner_user_id);
			session.setAttribute("total_amount", total_amount);
			session.setAttribute("item_name", item_name);
			
			
			request.setAttribute("successUrl", successUrl);
			//response.sendRedirect(successUrl);
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}

}
