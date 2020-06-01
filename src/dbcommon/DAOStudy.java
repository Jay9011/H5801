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

public class DAOStudy {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAOStudy() {
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
		DTOStudyTable[] dtoStudyTables = null;

		ArrayList<DTOStudyTable> list = new ArrayList<DTOStudyTable>();

		while (resultSet.next()) {
			int s_uid = resultSet.getInt("s_uid");
			String s_title = resultSet.getString("s_title");
			String s_content = resultSet.getString("s_content");
			int s_viewCnt = resultSet.getInt("s_viewCnt");
			int sc_uid = resultSet.getInt("sc_uid");
			int m_uid = resultSet.getInt("m_uid");
			Date day = resultSet.getDate("s_date");
			Time time = resultSet.getTime("s_date");
			Date u_day = resultSet.getDate("s_udate");
			Time u_time = resultSet.getTime("s_udate");

			String s_date_day = "";
			String s_date_time = "";
			if(day != null) {
				s_date_day = new SimpleDateFormat("yyyy-MM-dd").format(day);
				s_date_time = new SimpleDateFormat("HH:mm:ss").format(time);
			} // end if

			String u_date_day = "";
			String u_date_time = "";
			if(u_day != null) {
				u_date_day = new SimpleDateFormat("yyyy-MM-dd").format(u_day);
				u_date_time = new SimpleDateFormat("HH:mm:ss").format(u_time);
			} // end if

			String m_nick = "";
			String sc_name = "";
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null;
			try {
				if(m_uid != 0) {
					pstmt2 = conn.prepareStatement(Common.SQL_SELECT_USER_WHERE_M_UID);
					pstmt2.setInt(1, m_uid);
					rs2 = pstmt2.executeQuery();
					rs2.next();
					m_nick = rs2.getString("m_nick");

					pstmt2.close();
					rs2.close();
				}
				if(sc_uid != 0) {
					pstmt2 = conn.prepareStatement(Common.SQL_SELECT_CATEGORY_WHERE_SC_UID);
					pstmt2.setInt(1, sc_uid);
					rs2 = pstmt2.executeQuery();
					rs2.next();
					sc_name = rs2.getString("sc_name");

					pstmt2.close();
					rs2.close();
				}
			} finally {
				if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
			}

			DTOStudyTable dto = new DTOStudyTable(s_uid, sc_name, s_title, s_content, s_date_day, s_date_time, m_nick, s_viewCnt);

			list.add(dto);
		} // end while

		int size = list.size();
		if(size == 0) return null;

		dtoStudyTables = new DTOStudyTable[size];
		list.toArray(dtoStudyTables);

		return dtoStudyTables;
	} // end createArray()

	public DTOStudyTable[] selectAll() throws SQLException {
		DTOStudyTable[] dtoStudyTables = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_DESC);
			rs = pstmt.executeQuery();
			dtoStudyTables = createArray(rs);
		} finally {
			close();
		}
		return dtoStudyTables;
	} // end selectAll()

	public int insert(String m_uid, String subject, String content) throws SQLException {
		int cnt = 0;
		int member_uid = Integer.parseInt(m_uid);
		System.out.println(member_uid);

		try {
			pstmt = conn.prepareStatement(Common.SQL_INSERT_STABLE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, member_uid);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end insert()

} // end Class
