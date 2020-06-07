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

	public void closeWithoutConn() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
	} // end closeWithoutConn()

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
			String s_date = s_date_day + " " + s_date_time;

			String u_date_day = "";
			String u_date_time = "";
			if(u_day != null) {
				u_date_day = new SimpleDateFormat("yyyy-MM-dd").format(u_day);
				u_date_time = new SimpleDateFormat("HH:mm:ss").format(u_time);
			} // end if
			String s_udate = u_date_day + " " + u_date_time;

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

			DTOStudyTable dto = new DTOStudyTable(s_uid, sc_name, s_title, s_content, s_date_day, s_date_time, m_nick, s_viewCnt, s_date, s_udate, sc_uid, m_uid);
			list.add(dto);
		} // end while

		int size = list.size();
		if(size == 0) return null;

		dtoStudyTables = new DTOStudyTable[size];
		list.toArray(dtoStudyTables);

		return dtoStudyTables;
	} // end createArray()

	public int countAll(String fromBlock, String whereBlock) throws SQLException {
		int cnt = 0;

		BasicBoardSQL sql = new BasicBoardSQL();
		sql.setFromBlock(fromBlock);
		sql.setWhereBlock(whereBlock);
		try {
			pstmt = conn.prepareStatement(sql.getCount_WHERE());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			closeWithoutConn();
		} // end try

		return cnt;
	} // end countAll(String fromBlock)

	public int maxCol(String col, String fromBlock) throws SQLException{
		int cnt = 0;

		BasicBoardSQL sql = new BasicBoardSQL();
		sql.setColName(col);
		sql.setFromBlock(fromBlock);
		try {
			pstmt = conn.prepareStatement(sql.getMAX_COL());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			closeWithoutConn();
		} // end try

		return cnt;
	} // end maxCol(String col, String fromBlock)

	public DTOStudyTable[] selectFromRow(int from, int rows, String fromBlock) throws SQLException {
		DTOStudyTable[] tables = null;

		BasicBoardSQL sql = new BasicBoardSQL();
		sql.setFromBlock(fromBlock);

		try {
			pstmt = conn.prepareStatement(sql.getPAGING_SELECT_FROM_ROW());
			pstmt.setInt(1, from);
			pstmt.setInt(2, from + rows);
			rs = pstmt.executeQuery();
			tables = createArray(rs);
		} finally {
			close();
		} // end try

		return tables;
	} // end selectFromRow(int from, int rows, String fromBlock)

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

	public DTOStudyTable[] viewPage(int s_uid, boolean isViewed) throws SQLException {
		DTOStudyTable[] dtoStudyTables = null;
		int cnt = 0;

		try {
			// 트랜잭션 처리
			// Auto0commit 비활성화
			conn.setAutoCommit(false);

			if(!isViewed) {
				pstmt = conn.prepareStatement(Common.SQL_INC_VIEWCNT_STABLE);
				pstmt.setInt(1, s_uid);
				cnt = pstmt.executeUpdate();
				pstmt.close();
			} // end if

			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_WHERE_S_UID);
			pstmt.setInt(1, s_uid);
			rs = pstmt.executeQuery();
			dtoStudyTables = createArray(rs);
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}

		return dtoStudyTables;
	}

	public DTOStudyTable[] selectByUid(int s_uid) throws SQLException {
		DTOStudyTable[] dtoStudyTables = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_WHERE_S_UID);
			pstmt.setInt(1, s_uid);
			rs = pstmt.executeQuery();
			dtoStudyTables = createArray(rs);
		} finally {
			close();
		}

		return dtoStudyTables;
	}

	public int insert(int m_uid, String subject, String content, int sc_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(Common.SQL_INSERT_STABLE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, sc_uid);
			pstmt.setInt(4, m_uid);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end insert()

	public int update(int uid, String subject, String content) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(Common.SQL_UPDATE_STABLE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, uid);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end update()

	public DTOComment[] createArrayComment(ResultSet resultSet) throws SQLException {
		DTOComment[] comments = null;

		ArrayList<DTOComment> list = new ArrayList<DTOComment>();
		while(resultSet.next()) {
			int sr_numUid = resultSet.getInt("sr_numUid");
			int sr_group = resultSet.getInt("sr_group");
			int sr_depth = resultSet.getInt("sr_depth");
			String sr_com = resultSet.getString("sr_com");
			Date day = resultSet.getDate("sr_date");
			Time time = resultSet.getTime("sr_date");
			Date uday = resultSet.getDate("sr_udate");
			Time utime = resultSet.getTime("sr_udate");
			int sr_deleted = resultSet.getInt("sr_deleted");
			int s_uid = resultSet.getInt("s_uid");
			int m_uid = resultSet.getInt("m_uid");
			String m_nick = resultSet.getString("m_nick");

			String reg_date = "";
			if(day != null){
				reg_date = new SimpleDateFormat("yyyy-MM-dd").format(day) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(time);
			}
			String up_date = "";
			if(uday != null){
				up_date = new SimpleDateFormat("yyyy-MM-dd").format(uday) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(utime);
			}

			DTOComment comment = new DTOComment(sr_numUid, sr_group, sr_depth, sr_com, reg_date, up_date, sr_deleted, s_uid, m_uid, sr_group);
			comment.setM_nick(m_nick);

			list.add(comment);
		}
		int size = list.size();
		if(size == 0) return null;

		comments = new DTOComment[size];
		list.toArray(comments);

		return comments;
	} // end createArrayComment()

	public DTOComment[] selectCommentBySuid(int s_uid) throws SQLException {
		DTOComment[] dtoComments = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_SRCOMMENT_WHERE_S_UID);
			pstmt.setInt(1, s_uid);
			rs = pstmt.executeQuery();
			dtoComments = createArrayComment(rs);
		} finally {
			close();
		}

		return dtoComments;
	} // end selectCommentBySuid()

	public DTOComment[] selectCommentBySRuid(int sr_uid) throws SQLException {
		DTOComment[] dtoComments = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_SRCOMMENT_WHERE_SR_UID);
			pstmt.setInt(1, sr_uid);
			rs = pstmt.executeQuery();
			dtoComments = createArrayComment(rs);
		} finally {
			close();
		}

		return dtoComments;
	} // end selectCommentBySuid()

	public DTOComment[] insertComment(String s_uid, String m_uid, String content, String parent_uid) throws SQLException {
		DTOComment[] dtoComments = null;
		int cnt = 0;
		int study_uid = 0;
		int member_uid = 0;
		int parent = 0;
		try {
			study_uid = Integer.parseInt(s_uid);
			member_uid = Integer.parseInt(m_uid);
			if(!parent_uid.equals("") && parent_uid != null) {
				parent = Integer.parseInt(parent_uid);
			}
		} catch (Exception e) {
		}

		try {
			if(s_uid != null) {
				String[] generatedCols = {"sr_numuid"};
				if(parent == 0) {
					pstmt = conn.prepareStatement(Common.SQL_INSERT_SRCOMMENT_ORIGIN, generatedCols);
					pstmt.setString(1, content); // 내용
					pstmt.setInt(2, study_uid);	// 게시판번호
					pstmt.setInt(3, member_uid);// 회원번호
				} // end if
				if(parent != 0) {
					pstmt = conn.prepareStatement(Common.SQL_SELECT_ALL_SRCOMMENT_WHERE_SR_UID_ORIGIN);
					pstmt.setInt(1, parent);
					rs = pstmt.executeQuery();
					int p_uid = 0;
					int p_group = 0;
					int p_depth = 0;
					if(rs.next()) {
						p_uid = rs.getInt("sr_numuid");
						p_group = rs.getInt("sr_group");
						p_depth = rs.getInt("sr_depth");
					}
					pstmt = conn.prepareStatement(Common.SQL_INSERT_SRCOMMENT, generatedCols);
					pstmt.setInt(1, p_group);	// 그룹
					pstmt.setInt(2, p_depth + 1);	// 댓글 깊이
					pstmt.setString(3, content); // 내용
					pstmt.setInt(4, study_uid);	// 게시판번호
					pstmt.setInt(5, member_uid);// 회원번호
					pstmt.setInt(6, parent);// 회원번호
				} // end if
				cnt = pstmt.executeUpdate();
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					dtoComments = selectCommentBySRuid(rs.getInt(1));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dtoComments;
	} // end insertComment()

	public int updateComment(String sr_com, int sr_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(Common.SQL_UPDATE_SRCOMMENT);
			pstmt.setString(1, sr_com);
			pstmt.setInt(2, sr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	public int deleteComment(int sr_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(Common.SQL_DELETE_SRCOMMENT);
			pstmt.setInt(1, sr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	public int deleteByUid(int s_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(Common.SQL_DELETE_SRCOMMENT_WHERE_S_UID);
			pstmt.setInt(1, s_uid);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(Common.SQL_DELETE_SFAVOR_WHERE_S_UID);
			pstmt.setInt(1, s_uid);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(Common.SQL_DELETE_STABLE);
			pstmt.setInt(1, s_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	public int selectFavor(int s_uid, int m_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_SFAVOR);
			pstmt.setInt(1, m_uid);
			pstmt.setInt(2, s_uid);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			close();
		}

		return cnt;
	}

	public int[] favorClick(int s_uid, int m_uid) throws SQLException {
		int chk = 0;
		int cnt = 0;
		int[] resultSet = new int[2];

		try {
			pstmt = conn.prepareStatement(Common.SQL_SELECT_SFAVOR);
			pstmt.setInt(1, m_uid);
			pstmt.setInt(2, s_uid);
			rs = pstmt.executeQuery();
			rs.next();
			chk = rs.getInt(1);
			pstmt.close();
			if(chk > 0) {
				// 만약 기존에 좋아요를 눌렀다면
				pstmt = conn.prepareStatement(Common.SQL_DELETE_SFAVOR);
				pstmt.setInt(1, m_uid);
				pstmt.setInt(2, s_uid);
				cnt = pstmt.executeUpdate();
				resultSet[0] = cnt;
				resultSet[1] = 0;
			} else {
				// 좋아요를 새로 누른다면
				pstmt = conn.prepareStatement(Common.SQL_INSERT_SFAVOR);
				pstmt.setInt(1, m_uid);
				pstmt.setInt(2, s_uid);
				cnt = pstmt.executeUpdate();
				resultSet[0] = cnt;
				resultSet[1] = 1;
			}
		} finally {
			close();
		}

		return resultSet;
	}

} // end Class
