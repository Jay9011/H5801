// 작성자: 낙경
// 2020-06-02  22:00 수정

package dbcommon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;

public class DAOBook {
	Connection conn = null; // DB 연결을 위한 받기 객체
	Statement stmt = null; // SQL 문을 수행하고 그 결과를 리턴하기 위한 객체
	PreparedStatement pstmt = null; // 강화된 statement(precompiled SQL문, for multiple time)
	ResultSet rs = null;   // SELECT 결과, executeQuery() // 쿼리 수행결과를 테이블로 담는 객체 (행 단위로 커서 이동)
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public DAOBook() {
		
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
	
	public void closeWithoutConn() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
	} // end closeWithoutConn()
	
	// ResultSet --> DTO 배열로 리턴
		public DTOBook [] createArray(ResultSet rs) throws SQLException {
			DTOBook [] arr = null;  // DTO 배열
			
			ArrayList<DTOBook> list = new ArrayList<DTOBook>();
			
			// next(): 커서를 첫 행부터 다음 행으로 옮김
				// 리턴값: true - 다음 행이 있음, false - 다음 행이 없음
			while(rs.next()) {
				//getInt(), getString(), getDate(), getTime() : 현재 선택(cursor)된 행의 해당 컬럼(매개변수)에서 값을 검색하여 해당 Java 값(int, String, Date, Time)로 반환해 리턴
					// 매개변수: 컬럼 라벨
					// 리턴값: 해당 컬럼 값 (없으면 int -> 0, String, Date, Time -> null)
				int rnum = rs.getInt("rnum");
				int p_uid = rs.getInt("p_uid");
				String tid = rs.getString("tid");
				Date b_sdate = rs.getDate("b_sdate");
				String b_stime = rs.getString("b_stime");
				String b_etime = rs.getString("b_etime");
				int b_term = rs.getInt("b_term");
				int b_duration = rs.getInt("b_duration");
				int b_refund = rs.getInt("b_refund");
				int total_amount = rs.getInt("total_amount");
				Date b_date = rs.getDate("b_date");
				int p_cancel = rs.getInt("p_cancel");
				int m_uid = rs.getInt("m_uid");
				String m_email = rs.getString("m_email");
				String m_nick = rs.getString("m_nick");
				String m_name = rs.getString("m_name");
				int m_grade = rs.getInt("m_grade");
				String b_seatType = rs.getString("b_seatType");
				int t_name = rs.getInt("t_name");
				float t_pay = rs.getFloat("t_pay");
				int t_maxmun = rs.getInt("t_maxnum");
				
				// add(): Appends the specified element to the end of this list.
				// 매개변수: element
				// 리턴값: true
				DTOBook dto = new DTOBook(rnum
										, p_uid
										, tid
										, b_sdate
										, b_stime
										, b_etime
										, b_term
										, b_duration
										, b_refund
										, total_amount
										, b_date
										, p_cancel
										, m_uid
										, m_email
										, m_nick
										, m_name
										, m_grade
										, b_seatType
										, t_name
										, t_pay
										, t_maxmun);
				list.add(dto);
				
			} // end while
			
			// size()
				// 리턴값: list의 element 갯수
			int size = list.size();
			
			// list에 add된 게 없으면 null 리턴
			if(size == 0) return null;
			
			arr = new DTOBook[size];
			// toArray()
				// 매개변수: list의 elements를 담을 array
				// 리턴값: list의 elements를 순서대로 담은 array
			list.toArray(arr);  // List -> 배열		
			return arr;
		} // end createArray()
		
		// 전체 SELECT
		public DTOBook [] selectByUid(int uid) throws SQLException {
			DTOBook [] arr = null;
			
			try {
				// "SELECT * FROM test_write ORDER BY wr_uid DESC"
				pstmt = conn.prepareStatement("SELECT * FROM v_book WHERE m_uid = ? ORDER BY p_startTime DESC");
				pstmt.setInt(1, uid);
				// executeQuery(): 쿼리문 수행
					// 리턴값: 수행한 결과를 담은 ResultSet
				rs = pstmt.executeQuery();
				// 쿼리 수행 -> ResultSet -> WriteDTO 생성(한 row씩) -> ArrayList에 담기(한 row씩) -> Array 변환
				arr = createArray(rs);
			} finally {
				close();
			}		
			
			return arr;
		} // end select()
		
		// 쿼리: 페이지네이션 구현
		public int countAll(int m_uid) throws SQLException {
			int cnt = 0;

			try {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM v_book WHERE m_uid = ? AND p_cancel IN (1, 2)");
				pstmt.setInt(1, m_uid);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cnt = rs.getInt(1);
				}
			} finally {
				closeWithoutConn();
			}
			return cnt;
		}
		
		// 관리자 페이지용
		public int countAllAdmin() throws SQLException {
			int cnt = 0;

			try {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM v_book WHERE p_cancel IN (1, 2)");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cnt = rs.getInt(1);
				}
			} finally {
				closeWithoutConn();
			}
			return cnt;
		}
		
		// Ajax 테스트용
		public int countAll() throws SQLException {
			int cnt = 0;

			try {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM v_book");
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			
			} finally {
				closeWithoutConn();
			}
			return cnt;
		}
		
		// BOARD의 페이징
		public DTOBook[] selectPaging_st(int m_uid, int fromRow, int toRow) throws SQLException {
			DTOBook[] arr = null;
			
			try {
				pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM v_book WHERE m_uid = ? AND p_cancel IN (1, 2) ORDER BY p_uid DESC) T) WHERE RNUM >= ? AND RNUM < ?");
				pstmt.setInt(1, m_uid);
				pstmt.setInt(2, fromRow);
				pstmt.setInt(3, toRow);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			return arr;
		}
		
		public DTOBook[] selectPaging_stAdmin(int fromRow, int toRow) throws SQLException {
			DTOBook[] arr = null;
			
			try {
				pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM v_book WHERE p_cancel IN (1, 2) ORDER BY p_uid DESC) T) WHERE RNUM >= ? AND RNUM < ?");
				pstmt.setInt(1, fromRow);
				pstmt.setInt(2, toRow);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			return arr;
		}
		
		public DTOBook[] selectFromRow(int m_uid, int from, int rows) throws SQLException {
			DTOBook[] arr = null;
			
			try {
				pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM v_book WHERE m_uid = ? ORDER BY m_uid DESC) T) WHERE RNUM >= ? AND RNUM < ?");
				pstmt.setInt(1, m_uid);
				pstmt.setInt(2, from);
				pstmt.setInt(3, from+rows);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			return arr;
		}
		
		public DTOBook[] selectFromRow(int from, int rows) throws SQLException{
			DTOBook[] arr =null;
			
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM v_book ORDER BY p_uid DESC) T) WHERE RNUM >= ? AND RNUM < ?");
			pstmt.setInt(1, from);
			pstmt.setInt(2, from+rows);
			rs= pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
		

	
} // end class
