package dbcommon;

// 작성자: 낙경
// 2020-06-01  23:00 수정

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dbcommon.Common;

public class DAOPassword {
	Connection conn = null; // DB 연결을 위한 받기 객체
	Statement stmt = null; // SQL 문을 수행하고 그 결과를 리턴하기 위한 객체
	PreparedStatement pstmt = null; // 강화된 statement(precompiled SQL문, for multiple time)
	ResultSet rs = null; // SELECT 결과, executeQuery() // 쿼리 수행결과를 테이블로 담는 객체 (행 단위로 커서 이동)
	
	// DAO 객체가 생성될때 Connection 도 생성된다.	
	public DAOPassword() {
		
		try {
			Class.forName(Common.DRIVER);
			// DriverManager: JDBC 드라이버를 관리하기 위한 기본 서비스 
			// getConnection: 해당 DB URL에 연결 시도
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
			System.out.println("DAOPassword 생성, 데이터베이스 연결");
		} catch (Exception e) {
			e.printStackTrace();
			// throw e;
		}
	} // end Constructor
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		// 오픈 역순으로 반납
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	// ResultSet --> DTO 배열 리턴
	public DTOPassword[] createArray(ResultSet rs) throws SQLException {
		DTOPassword [] arr = null; // DTO 배열
		
		ArrayList<DTOPassword> list = new ArrayList<DTOPassword>();
		
		// next(): 커서를 첫 행부터 다음 행으로 옮김
			// 리턴값: true - 다음 행이 있음, false - 다음 행이 없음
		while(rs.next()) {
			//getInt(), getString(): 현재 선택(cursor)된 행의 해당 컬럼(매개변수)에서 값을 검색하여 해당 Java 값(int, String)로 반환해 리턴
				// 매개변수: 컬럼 라벨
				// 리턴값: 해당 컬럼 값 (없으면 int -> 0, String, Date, Time -> null)
			int uid = rs.getInt("m_uid");
			String email = rs.getString("m_email");
			String pw = rs.getString("m_pw");
			String nick = rs.getString("m_nick");
			String name = rs.getString("m_name");
			
			DTOPassword dto = new DTOPassword(uid, email, pw, nick, name);
			
			// add(): Appends the specified element to the end of this list.
				// 매개변수: element
				// 리턴값: true
			list.add(dto);
		} // end while
		
		// size()
			// 리턴값: list의 element 갯수
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new DTOPassword[size];
		
		// toArray()
			// 매개변수: list의 elements를 담을 array
			// 리턴값: list의 elements를 순서대로 담은 array
		list.toArray(arr);  // List -> 배열
		return arr;
	} // end createArray()
	
	// 특정 uid 의 회원정보만 SELECT --> 수정을 위한 메소드
	public DTOPassword [] selectByUid(int uid) throws SQLException {
		DTOPassword [] arr = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM m_user WHERE m_uid = ?");
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	
	public DTOPassword[] selectByEmail(String email) throws SQLException {
		DTOPassword[] arr = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM m_user WHERE m_email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
		} finally {
			close();
		}
		
		return arr;
	}
	
	public int updateByEmail(int uid, String pw) throws SQLException {
		int cnt = 0;
		
		try {
			// 임시 비밀번호 설정
			pstmt = conn.prepareStatement("UPDATE m_user SET m_pw = ? WHERE m_uid = ?");
			pstmt.setString(1, pw);
			pstmt.setInt(2, uid);			
			
			cnt = pstmt.executeUpdate();
			
	
		} finally {
			close();
		}
		
		return cnt;
	} // end updateByEmail
	
} // end class
