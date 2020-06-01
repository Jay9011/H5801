package dbcommon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class DAOLogin {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAOLogin() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	} // end close()

	public DTOMember login(String m_email) {
		DTOMember member = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_MEMBER_WHERE_EMAIL);
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				int m_uid = rs.getInt("m_uid");
				String m_pw = rs.getString("m_pw");
				String m_nick = rs.getString("m_nick");
				String m_name = rs.getString("m_name");
				Date m_birth_date = rs.getDate("m_birth");
				String m_birth = new SimpleDateFormat("yyyy-MM-dd").format(m_birth_date);
				String m_phoneNum = rs.getString("m_phoneNum");
				String m_gender = rs.getString("m_gender");
				String m_addressA = rs.getString("m_addressA");
				String m_addressB = rs.getString("m_addressB");
				int m_SMSOk = rs.getInt("m_SMSOk");
				int m_grade = rs.getInt("m_grade");

				member = new DTOMember(m_uid, m_email, m_pw, m_nick, m_name, m_birth, m_phoneNum, m_gender, m_addressA, m_addressB, m_SMSOk, m_grade);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}
}
