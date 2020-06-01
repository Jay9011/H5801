package dbcommon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dbcommon.Common;

public class DAOUser {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public DAOUser() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
			System.out.println("UserDAO 생성, 데이터 베이스 연결");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close();
	
	//public int insert(UserDTO dto) throws SQLException{
 //int cnt = 0;
//	}
	
	// 회원가입
	public int insert(String email, String pw, String nick, String name, String birth, String phoneNum, String gender, String addressA, String addressB, int smsOk) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_USER_INSERT);
			pstmt.setString(1, name);
			pstmt.setString(2, nick);
			pstmt.setString(3, email);
			pstmt.setString(4, pw);
			pstmt.setString(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, phoneNum);
			pstmt.setInt(8, smsOk);
			pstmt.setString(9, addressA);
			pstmt.setString(10, addressB);
			
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// 로그인 
	public int selectByUid(String email, String pw) throws SQLException{
		try {
			pstmt = conn.prepareStatement(Common.SQL_USER_SELECT);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			// 아이디 있는지 없는지 체크
			if(rs.next()) {
				 if(rs.getString("m_pw").equals(pw)) {
					 return 1;
				 }else{
					 return 0; // 비밀번호 틀림
				 }// end if 비밀번호 체크
			}
		} finally {
			close();
		}
		return -1;
	}
	
	// nick 실시간 유효성 체크
	public int check_nick(String nick) {
		int chk = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_UNICK_SELECT);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	// nick 실시간 유효성 체크
	public int check_email(String email) {
		int chk = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_UEMAIL_SELECT);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	
	
	
	
	
	
	
	
}




















