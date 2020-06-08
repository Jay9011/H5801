package command.faq;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbcommon.Common;
import dbcommon.DTOStudyTable;

public class DAOFaq{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public DAOFaq() {
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
	
	// 검증
	
	public DTOFaq[] createArray(ResultSet resultSet) throws SQLException{
		DTOFaq[] dtoFaqs = null;
		
		ArrayList<DTOFaq> list = new ArrayList<DTOFaq>();
		
		while (resultSet.next()) {
			int f_uid = resultSet.getInt("f_uid");
			String f_title = resultSet.getString("f_title");
			String f_content = resultSet.getString("f_content");
			
			DTOFaq fdto = new DTOFaq(f_uid,f_title,f_content);
			list.add(fdto);
		}
		
		int size = list.size();
		if(size == 0) return null;
		
		dtoFaqs = new DTOFaq[size];
		list.toArray(dtoFaqs);
		
		return dtoFaqs;
	}

	public DTOFaq[] selectALL() throws SQLException {
		DTOFaq[] dtoFaqs = null;
		
		try {
			pstmt = conn.prepareStatement(FaqCommon.SQL_SELECT_ALL_FAQ);
			rs = pstmt.executeQuery();
			dtoFaqs = createArray(rs);
		} finally {
			close();
		}
		return dtoFaqs;
	}

	public int insert(String subject, String content) throws SQLException {
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(FaqCommon.SQL_INSERT_FAQ);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return result;
	}

	public int deleteByUid(int f_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(FaqCommon.SQL_DELETE_FTABLE);
			pstmt.setInt(1, f_uid);
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return cnt;
	}

	public DTOFaq[] selectByUid(int f_uid) throws SQLException {
		DTOFaq[] dtoFaq = null;

		try {
			pstmt = conn.prepareStatement(FaqCommon.SQL_SELECT_F_UID);
			pstmt.setInt(1, f_uid);
			rs = pstmt.executeQuery();
			dtoFaq = createArray(rs);
		} finally {
			close();
		}

		return dtoFaq;
	}

	public int update(int f_uid, String subject, String content) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(FaqCommon.SQL_UPDATE_FAQ);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, f_uid);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	
	
	
	
	
}




