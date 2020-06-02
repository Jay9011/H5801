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
			int m_uid = resultSet.getInt("m_uid");
			
			
			String s_date_day = "";
			String s_date_time = "";
			if(day != null) {
				s_date_day = new SimpleDateFormat("yyyy-MM-dd").format(day);
				s_date_time = new SimpleDateFormat("HH:mm:ss").format(time);
			} // end if
			String s_date = s_date_day + " " + s_date_time;
			

//			DTOStudyTable dto = new DTOStudyTable(s_uid, sc_name, s_title, s_content, s_date_day, s_date_time, m_nick, s_viewCnt);
			DTOStudyTable dto = new DTOStudyTable(s_uid, s_title, s_content, s_date_day, s_date_time, s_date, m_uid);
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
	
	
}
