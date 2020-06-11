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

public class DAOPay {
	Connection conn = null; // DB 연결을 위한 받기 객체
	Statement stmt = null; // SQL 문을 수행하고 그 결과를 리턴하기 위한 객체
	PreparedStatement pstmt = null; // 강화된 statement(precompiled SQL문, for multiple time)
	ResultSet rs = null;   // SELECT 결과, executeQuery() // 쿼리 수행결과를 테이블로 담는 객체 (행 단위로 커서 이동)

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public DAOPay() {

		try {
			Class.forName(Common.DRIVER);
			// DriverManager: JDBC 드라이버를 관리하기 위한 기본 서비스
			// getConnection: 해당 DB URL에 연결 시도
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
			System.out.println("DAOReady 생성, 데이터 베이스 연결!");
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

	// ResultSet --> DTO 배열로 리턴
		public DTOPay [] createArray(ResultSet rs) throws SQLException {
			DTOPay [] arr = null;  // DTO 배열

			ArrayList<DTOPay> list = new ArrayList<DTOPay>();

			// next(): 커서를 첫 행부터 다음 행으로 옮김
				// 리턴값: true - 다음 행이 있음, false - 다음 행이 없음
			while(rs.next()) {
				//getInt(), getString(), getDate(), getTime() : 현재 선택(cursor)된 행의 해당 컬럼(매개변수)에서 값을 검색하여 해당 Java 값(int, String, Date, Time)로 반환해 리턴
					// 매개변수: 컬럼 라벨
					// 리턴값: 해당 컬럼 값 (없으면 int -> 0, String, Date, Time -> null)

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
				DTOPay dto = new DTOPay( p_uid
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

			arr = new DTOPay[size];
			// toArray()
				// 매개변수: list의 elements를 담을 array
				// 리턴값: list의 elements를 순서대로 담은 array
			list.toArray(arr);  // List -> 배열
			return arr;
		} // end createArray()

		// 전체 SELECT
		public DTOPay [] selectByUid(int p_uid) throws SQLException {
			DTOPay [] arr = null;

			try {
				// "SELECT * FROM test_write ORDER BY wr_uid DESC"
				pstmt = conn.prepareStatement("SELECT * FROM v_book WHERE p_uid = ?");
				pstmt.setInt(1, p_uid);
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


		public int updateTidByPay(String tid, int p_cancel, int p_uid) throws SQLException {
			int cnt = 0;

			try {
				pstmt= conn.prepareStatement("UPDATE RESERVE SET tid = ?, p_cancel=? WHERE p_uid = ?");
				pstmt.setString(1, tid);
				pstmt.setInt(2, p_cancel);
				pstmt.setInt(3, p_uid);

				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}

			return cnt;
		} // end updateTid()

		public int updateTidbyRefund(String tid, int p_cancel, int p_uid) throws SQLException {
			int cnt = 0;

			try {
				pstmt= conn.prepareStatement("UPDATE RESERVE SET tid = ?, p_cancel=? WHERE p_uid = ?");
				pstmt.setString(1, tid);
				pstmt.setInt(2, p_cancel);
				pstmt.setInt(3, p_uid);

				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}

			return cnt;
		} // end updateTid()


		public int createOrder(String p_starttime, String p_endtime, String item_name, int total_amount, int m_uid, int t_uid) throws SQLException {
			int cnt = 0;
			int p_uid = 0;
			String[] generatedCols = {"p_uid"};

			try {
				pstmt = conn.prepareStatement(Common.SQL_INSERT_ORDER_RESERVE, generatedCols);
				pstmt.setString(1, p_starttime);
				pstmt.setString(2, p_endtime);
				pstmt.setString(3, item_name);
				pstmt.setInt(4, total_amount);
				pstmt.setInt(5, m_uid);
				pstmt.setInt(6, t_uid);

				cnt = pstmt.executeUpdate();
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					p_uid = rs.getInt(1);
					return p_uid;
				}
			} finally {
				close();
			}
			return cnt;
		} // end createOrder()
}
