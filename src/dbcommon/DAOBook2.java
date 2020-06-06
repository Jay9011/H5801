package dbcommon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DAOBook2 {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAOBook2() {
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
	} // end close()

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
					int p_uid = rs.getInt("p_uid");
					Date b_sdate = rs.getDate("b_sdate");
					Time b_stime = rs.getTime("b_stime");
					Time b_etime = rs.getTime("b_etime");
					int b_term = rs.getInt("b_term");
					int b_duration = rs.getInt("b_duration");
					int b_refund = rs.getInt("b_refund");
					float total_amount = rs.getFloat("total_amount");
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
					DTOBook dto = new DTOBook(p_uid
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
	
	// 쿼리: 페이지네이션 구현
	public int getCount(int m_uid) throws SQLException {
		int count = 0;

		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM v_book WHERE m_uid = ?");
			pstmt.setInt(1, m_uid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} finally {
			close();
		}
		return count;
	}
	// BOARD의 페이징
	public DTOBook[] selectPaging_st(int m_uid, int fromRow, int toRow) throws SQLException {
		DTOBook[] arr = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM v_book WHERE m_uid = ? ORDER BY m_uid DESC) T) WHERE RNUM >= ? AND RNUM < ?");
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
	
//	// 쿼리: cmt 페이징
//	public DTOBook[] selectPaging_cmt(int m_uid, int fromRow, int toRow) throws SQLException {
//		DTOBook[] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(Common.SQL_SELECT_FROM_CMT);
//			pstmt.setInt(1, m_uid);
//			pstmt.setInt(2, fromRow);
//			pstmt.setInt(3, toRow);
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		}
//		return arr;
//	}
	
//	// 쿼리: like 페이징
//		public DTOBook[] selectPaging_like(int m_uid, int fromRow, int toRow) throws SQLException {
//			DTOStudyTable[] stables = null;
//			
//			try {
//				pstmt = conn.prepareStatement(Common.SQL_SELECT_FROM_LIKE);
//				pstmt.setInt(1, m_uid);
//				pstmt.setInt(2, fromRow);
//				pstmt.setInt(3, toRow);
//				rs = pstmt.executeQuery();
//				stables = createArray(rs);
//			} finally {
//				close();
//			}
//			return stables;
//		}
}
