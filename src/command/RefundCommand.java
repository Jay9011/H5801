package command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
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
import dbcommon.DTOPay;

public class RefundCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		HttpURLConnection conn = null;
		BufferedReader in = null;
		
		DAOPay dao = new DAOPay();
		DTOPay [] arr = null;
		int p_uid;
		
		
		if(request.getParameter("p_uid") != null) {
			p_uid = Integer.parseInt(request.getParameter("p_uid"));
			//System.out.println(p_uid);
			
		} else {
			p_uid = 0;
			//System.out.println(p_uid);
			return;
		}
		
		try {
			arr = dao.selectByUid(p_uid);
			URL url = new URL("https://kapi.kakao.com/v1/payment/cancel");
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 7498c3868ab21028b64464d2774c74e3");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			String cid = "TC0ONETIME";
			String tid = arr[0].getTid();
			System.out.println(tid);
			int cancel_amount = arr[0].getTotal_amount();
			int cancel_tax_free_amount = arr[0].getTotal_amount();
			int cancel_vat_amount = 0;
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("cid", cid);
			params.put("tid", tid);
			params.put("cancel_amount", cancel_amount);
			params.put("cancel_tax_free_amount", cancel_tax_free_amount);
			params.put("cancel_vat_amount", cancel_vat_amount);
			
			String string_params = new String();
			for(Map.Entry<String, Object> elem: params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			
			OutputStream out = conn.getOutputStream();
			out.write(string_params.getBytes());
			
			
			
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String cancel = null;
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			

			cancel = (String)obj.get("status");
			System.out.println(obj.get("status"));
			request.setAttribute("cancel", cancel);
			session.setAttribute("p_uid", p_uid);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(conn != null) conn.disconnect();
		}
	}

}
