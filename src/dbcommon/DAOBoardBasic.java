package dbcommon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOBoardBasic {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	/**
	 * 기본 생성자 : DB 접속
	 */
	public DAOBoardBasic() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end Class()

	/**
	 * 마지막 DB 접속 종료 사용.
	 * @throws SQLException
	 */
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	} // end close()

} // end Class
