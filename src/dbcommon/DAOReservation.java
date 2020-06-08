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

public class DAOReservation {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAOReservation() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end Class()

	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	} // end close()

	public void closeWithoutConn() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
	} // end closeWithoutConn()

	public DTOReservation[] createArray(ResultSet resultSet) throws SQLException {
		DTOReservation[] reservations = null;

		ArrayList<DTOReservation> list = new ArrayList<>();

		while(resultSet.next()) {
			int p_uid = resultSet.getInt("p_uid");
			int t_uid = resultSet.getInt("t_uid");
			String p_startDay = "";
			String p_startTime = "";
			String p_endDay = "";
			String p_endTime = "";
			if(resultSet.getDate("p_startTime") != null) {
				p_startDay = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getDate("p_startTime"));
				p_startTime = new SimpleDateFormat("HH:mm:ss").format(resultSet.getTime("p_startTime"));
			}
			if(resultSet.getDate("p_endTime") != null) {
				p_endDay = new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getDate("p_endTime"));
				p_endTime = new SimpleDateFormat("HH:mm:ss").format(resultSet.getTime("p_endTime"));
			}

			DTOReservation dto = new DTOReservation(p_uid, p_startDay, p_startTime, p_endDay, p_endTime, t_uid);
			list.add(dto);
		} // end while

		int size = list.size();
		if(size == 0) return null;

		reservations = new DTOReservation[size];
		list.toArray(reservations);

		return reservations;
	}

	public DTOReservation[] selectFromDate(String pickedDate) throws SQLException {
		DTOReservation[] reservations = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_RESERV_BY_DATE);
			pstmt.setString(1, pickedDate);
			rs = pstmt.executeQuery();
			reservations = createArray(rs);
		} finally {
			close();
		}

		return reservations;
	}

	private DTORoomInfo[] createRoomInfo(ResultSet resultSet) throws SQLException {
		DTORoomInfo[] rooms = null;

		ArrayList<DTORoomInfo> list = new ArrayList<>();

		while(resultSet.next()) {
			int t_uid = resultSet.getInt("t_uid");
			String t_name = resultSet.getString("t_name");
			int t_pay = resultSet.getInt("t_pay");
			int t_maxnum = resultSet.getInt("t_maxnum");

			DTORoomInfo dto = new DTORoomInfo(t_uid, t_name, t_pay, t_maxnum);
			list.add(dto);
		} // end while

		int size = list.size();
		if(size == 0) return null;

		rooms = new DTORoomInfo[size];
		list.toArray(rooms);

		return rooms;
	}

	public DTORoomInfo[] selectRoomInfo() throws SQLException {
		DTORoomInfo[] rooms = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ROOM_INFO);
			rs = pstmt.executeQuery();
			rooms = createRoomInfo(rs);
		} finally {
			close();
		}

		return rooms;
	}

}
