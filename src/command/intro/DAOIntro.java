package command.intro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbcommon.Common;

public class DAOIntro{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public DAOIntro() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	// ERD -> List -> 배열 과정
	// ERD -> List 진행
	public DTOIntro[] createArray(ResultSet resultSet) throws SQLException{
		DTOIntro[] dtoIntro = null;
		
		ArrayList<DTOIntro> list = new ArrayList<DTOIntro>();
		
		while (resultSet.next()) {
			int t_uid = resultSet.getInt("t_uid");
			String t_name = resultSet.getString("t_name");
			int t_pay = resultSet.getInt("t_pay");
			int t_maxnum = resultSet.getInt("t_maxnum");
			
			DTOIntro idto = new DTOIntro(t_uid, t_name, t_pay, t_maxnum);
			list.add(idto);

		}
		// List -> 배열 진행
		int size = list.size();
		if(size == 0) return null;
		dtoIntro = new DTOIntro[size];
		list.toArray(dtoIntro);
		
		return dtoIntro;
	}// 배열로 완성
	
	public DTOIntro[] selectALL() throws SQLException{
		DTOIntro[] dtoIntros = null;
		
		try {
			pstmt = conn.prepareStatement(IntroCommon.SQL_DEFULT_SELECT);
			rs = pstmt.executeQuery();
			dtoIntros = createArray(rs);
		} finally {
			close();
		}
		return dtoIntros;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}