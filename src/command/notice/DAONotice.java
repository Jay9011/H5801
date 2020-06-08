package command.notice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.faq.DTOFaq;
import command.faq.FaqCommon;
import dbcommon.Common;

public class DAONotice{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public DAONotice() {
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
	}
	
	public DTONotice[] createArray(ResultSet resultSet) throws SQLException{
		DTONotice[] dtoNotice = null;
		
		ArrayList<DTONotice> list = new ArrayList<DTONotice>();
		
		while(resultSet.next()) {
			int n_uid = resultSet.getInt("n_uid");
			String n_title = resultSet.getString("n_title");
			String n_content = resultSet.getString("n_content");	
			int n_viewCnt = resultSet.getInt("n_viewCnt");
			Date n_day = resultSet.getDate("n_date");
			Time n_time = resultSet.getTime("n_date");
			int m_uid = resultSet.getInt("m_uid");
			String n_date_time = "";
			String n_date_day = "";
			
			if(n_day != null) {
				n_date_day = new SimpleDateFormat("yyyy-MM-dd").format(n_day);
				n_date_time = new SimpleDateFormat("HH:mm:ss").format(n_time);
			} // end if
			String n_date = n_date_day + " " + n_date_time;
			
			DTONotice ndto = new DTONotice(n_uid, n_title, n_content, n_viewCnt, n_date, m_uid);
			list.add(ndto);
		}
		
		int size = list.size();
		if(size == 0) return null;
		
		dtoNotice = new DTONotice[size];
		list.toArray(dtoNotice);
		
		return dtoNotice;
	}
	
	public DTONotice[] selectAll() throws SQLException{
		DTONotice[] dtoNotices = null;
		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_SELECT_ALL_NOTICE);
			rs = pstmt.executeQuery();	// TABLE
			dtoNotices = createArray(rs);
		} finally {
			close();
		}
		return dtoNotices;
	}
	
	public DTONotice[] selectUid(int n_uid) throws SQLException{
		DTONotice[] dtoNotices = null;
		int cnt = 0;
		
		try {
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(NoticeCommon.SQL_SELECT_INC_VIEWCNT);
			pstmt.setInt(1, n_uid);
			cnt = pstmt.executeUpdate(); // INT

			pstmt.close();
			
			pstmt = conn.prepareStatement(NoticeCommon.SQL_SELECT_NOTICE_UID);
			pstmt.setInt(1, n_uid);
			rs = pstmt.executeQuery();
			dtoNotices =  createArray(rs);
			
			conn.commit();
		}catch (Exception e) {
			conn.rollback();
			throw e;
		}finally {
			close();
		}
		return dtoNotices;
	}
	
	public int getNCount() throws SQLException{
		int nCount = 0;
		
		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_COUNT_SELECT_NTABLE);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				nCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nCount;
		
	}

	public DTONotice[] selectPaging_nt(int fromRow, int toRow) throws SQLException {
		DTONotice [] ndto = null;
		
		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_SELECT_FROM_ROW);
			pstmt.setInt(1, fromRow);
			pstmt.setInt(2, toRow);
			rs = pstmt.executeQuery();
			ndto = createArray(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		
		return ndto;
	}

	public int deleteByUid(int n_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_DELETE_NTABLE);
			pstmt.setInt(1, n_uid);
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return cnt;
	}
	
	public DTONotice[] selectByUid(int n_uid) throws SQLException {
		DTONotice[] dtoFaq = null;

		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_SELECT_N_UID);
			pstmt.setInt(1, n_uid);
			rs = pstmt.executeQuery();
			dtoFaq = createArray(rs);
		} finally {
			close();
		}

		return dtoFaq;
	}

	public int update(int n_uid, String subject, String content) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_UPDATE_NOTICE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, n_uid);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	public int insert(String subject, String content, Integer m_uid) throws SQLException {
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(NoticeCommon.SQL_INSERT_NOTICE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, m_uid);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return result;
	}
		
	
	
	
}