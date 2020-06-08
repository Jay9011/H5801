package command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class PayOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 7498c3868ab21028b64464d2774c74e3");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			String cid = "TC0ONETIME";
			String tid = (String)session.getAttribute("tid");
			//String partner_order_id = request.getParameter("partner_order_id");
			int partner_order_id = (int) session.getAttribute("partner_order_id");
			//String partner_user_id = request.getParameter("partner_user_id");
			String partner_user_id = (String)session.getAttribute("partner_user_id");
			String pg_token = request.getParameter("pg_token");
			
			Map<String, Object>params = new HashMap<String, Object>();
			
			params.put("cid", cid);
			params.put("tid", tid);
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);
			params.put("pg_token", pg_token);
			
			
			
			StringBuffer string_params = new StringBuffer();
			for(Map.Entry<String, Object> elem: params.entrySet()) {
				string_params.append(elem.getKey()+ "=" + elem.getValue() +"&");
			}
			
			conn.getOutputStream().write(string_params.toString().getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(in);
			
			String amount = obj.get("amount").toString();
			System.out.println(amount);
			String item_name = obj.get("item_name").toString();
			System.out.println(item_name);
			JSONObject amountObj = (JSONObject)parser.parse(amount);
			String total = amountObj.get("total").toString();
			System.out.println(total);
			
			session.setAttribute("item_name", (String)obj.get("item_name"));
			session.setAttribute("total", total);
			
			request.setAttribute("item_name", item_name);
			request.setAttribute("total", total);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
