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

public class DAOLoadBoard {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAOLoadBoard() {
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

	public DTOStudyTable[] createArray(ResultSet resultSet) throws SQLException {
		DTOStudyTable[] stables = null;

		ArrayList<DTOStudyTable> list = new ArrayList<DTOStudyTable>();

		while (resultSet.next()) {
			int s_uid = resultSet.getInt("s_uid");
			String s_title = resultSet.getString("s_title");
			String s_content = resultSet.getString("s_content");
			Date day = resultSet.getDate("s_date");
			Time time = resultSet.getTime("s_date");
//			int m_uid = resultSet.getInt("m_uid");
			
			String s_date_day = "";
			String s_date_time = "";
			if(day != null) {
				s_date_day = new SimpleDateFormat("yyyy-MM-dd").format(day);
				s_date_time = new SimpleDateFormat("HH:mm:ss").format(time);
			} // end if
			String s_date = s_date_day + " " + s_date_time;
			
//			DTOStudyTable dto = new DTOStudyTable(s_uid, sc_name, s_title, s_content, s_date_day, s_date_time, m_nick, s_viewCnt);
			DTOStudyTable dto = new DTOStudyTable(s_uid, s_title, s_content, s_date_day, s_date_time, s_date);
			list.add(dto);
		} // end while

		int size = list.size();
		if(size == 0) return null;

		stables = new DTOStudyTable[size];
		list.toArray(stables);

		return stables;
	} // end createArray()

	public DTOStudyTable[] selectBoard(int m_uid) throws SQLException {
		DTOStudyTable[] stables = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_BOARD);
			pstmt.setInt(1, m_uid);
			rs = pstmt.executeQuery();
			stables = createArray(rs);
		} finally {
			close();
		}
		return stables;
	}
	
	public DTOStudyTable[] selectCMTBoard(int m_uid) throws SQLException {
		DTOStudyTable[] stables = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_CMTBOARD);
			pstmt.setInt(1, m_uid);
			rs = pstmt.executeQuery();
			stables = createArray(rs);
		} finally {
			close();
		}
		return stables;
	}
	
	public DTOStudyTable[] selectLikeBoard(int m_uid) throws SQLException {
		DTOStudyTable[] stables = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_LIKEBOARD);
			pstmt.setInt(1, m_uid);
			rs = pstmt.executeQuery();
			stables = createArray(rs);
		} finally {
			close();
		}
		return stables;
	}
	
	
	// 쿼리: 페이지네이션 구현
	public int getCount(int m_uid, String table) throws SQLException {
		int count = 0;

		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM " + table + " WHERE m_uid = ?");
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
	public DTOStudyTable[] selectPaging_st(int m_uid, int fromRow, int toRow) throws SQLException {
		DTOStudyTable[] stables = null;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_FROM_ROW);
			pstmt.setInt(1, m_uid);
			pstmt.setInt(2, fromRow);
			pstmt.setInt(3, toRow);
			rs = pstmt.executeQuery();
			stables = createArray(rs);
		} finally {
			close();
		}
		return stables;
	}
	
	// 쿼리: cmt 페이징
	public DTOStudyTable[] selectPaging_cmt(int m_uid, int fromRow, int toRow) throws SQLException {
		DTOStudyTable[] stables = null;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_FROM_CMT);
			pstmt.setInt(1, m_uid);
			pstmt.setInt(2, fromRow);
			pstmt.setInt(3, toRow);
			rs = pstmt.executeQuery();
			stables = createArray(rs);
		} finally {
			close();
		}
		return stables;
	}
	
	// 쿼리: like 페이징
		public DTOStudyTable[] selectPaging_like(int m_uid, int fromRow, int toRow) throws SQLException {
			DTOStudyTable[] stables = null;
			
			try {
				pstmt = conn.prepareStatement(Common.SQL_SELECT_FROM_LIKE);
				pstmt.setInt(1, m_uid);
				pstmt.setInt(2, fromRow);
				pstmt.setInt(3, toRow);
				rs = pstmt.executeQuery();
				stables = createArray(rs);
			} finally {
				close();
			}
			return stables;
		}
}
