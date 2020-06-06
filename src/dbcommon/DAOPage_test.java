package dbcommon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOPage_test {
	Connection conn = null; // DB 연결을 위한 받기 객체
	Statement stmt = null; // SQL 문을 수행하고 그 결과를 리턴하기 위한 객체
	PreparedStatement pstmt = null; // 강화된 statement(precompiled SQL문, for multiple time)
	ResultSet rs = null;   // SELECT 결과, executeQuery() // 쿼리 수행결과를 테이블로 담는 객체 (행 단위로 커서 이동)
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public DAOPage_test() {
		
		try {
			Class.forName(Common.DRIVER);
			// DriverManager: JDBC 드라이버를 관리하기 위한 기본 서비스 
			// getConnection: 해당 DB URL에 연결 시도
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
			System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
		} catch(Exception e) {
			e.printStackTrace();
			// throw e;
		}		
		
	} // 생성자

	// DB 자원 반납 메소드
	public void close() throws SQLException {
		// 오픈한 반대로 반납. 
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
}
