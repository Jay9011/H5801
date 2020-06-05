package dbcommon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import dbcommon.Common;

public class DAOUser {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public DAOUser() {
		try {
			Class.forName(Common.DRIVER);
			conn = DriverManager.getConnection(Common.URL, Common.USERID, Common.USERPW);
			System.out.println("UserDAO 생성, 데이터 베이스 연결");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close();
	
public int insert(DTOUser dto) throws SQLException{
		String email = dto.getEmail();
		String pw = dto.getPw();
		String nick = dto.getNick();
		String name = dto.getName();
		String birth = dto.getBirth();
		String phoneNum = dto.getPhoneNum();
		String gender = dto.getGender();
		String addressA = dto.getAddressA();
		String addressB = dto.getAddressB();
		int smsOk = dto.getSmsOk();
		
		int cnt = this.insert(email, pw, nick, name, birth, phoneNum, gender, addressA, addressB, smsOk);
		return cnt;
	}
	
	// 회원가입
	public int insert(String email, String pw, String nick, String name, String birth, String phoneNum, String gender, String addressA, String addressB, int smsOk) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_USER_INSERT);
			pstmt.setString(1, name);
			pstmt.setString(2, nick);
			pstmt.setString(3, email);
			pstmt.setString(4, pw);
			pstmt.setString(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, phoneNum);
			pstmt.setInt(8, smsOk);
			pstmt.setString(9, addressA);
			pstmt.setString(10, addressB);
			
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public DTOUser[] createArray(ResultSet rs) throws SQLException{
		DTOUser [] arr = null;
		
		ArrayList<DTOUser> list = new ArrayList<DTOUser>();
		
		while(rs.next()) {
			String email = rs.getString("m_email");
			String pw = rs.getString("m_pw");
			String nick = rs.getString("m_nick");
			String name = rs.getString("m_name");
			Date birthday = rs.getDate("m_birth");
			String phoneNum = rs.getString("m_phoneNum");
			String gender = rs.getString("m_gender");
			String addressA = rs.getString("m_addressA");
			String addressB = rs.getString("m_addressB");
			int smsOk = rs.getInt("m_SMSOk");
			int grade = rs.getInt("m_grade");
			int uid = rs.getInt("m_uid");
			
			String birth = new SimpleDateFormat("yyyy-MM-dd").format(birthday);
			
			DTOUser udto = new DTOUser(uid, email, pw, nick, name, birth, phoneNum, gender, addressA, addressB, grade, smsOk);
			
			list.add(udto);
		}// end while
		int size = list.size();
		if(size == 0) return null;
		
		arr = new DTOUser[size];
		list.toArray(arr);
		return arr;
	}
	
	// 로그인 
	public int selectByUid(String email, String pw) throws SQLException{
		try {
			pstmt = conn.prepareStatement(Common.SQL_USER_SELECT);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			// 아이디 있는지 없는지 체크
			if(rs.next()) {
				 if(rs.getString("m_pw").equals(pw)) {
					 return 1;
				 }else{
					 return 0; // 비밀번호 틀림
				 }// end if 비밀번호 체크
			}
		} finally {
			close();
		}
		return -1;
	}
	
	
	public DTOUser[] selectByEmail(String email) throws SQLException{
		DTOUser [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_UEMAIL_SELECT2);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}

	public DTOUser login(String email) {
		DTOUser user = null;

		try {
			pstmt = conn.prepareStatement(Common.SQL_USER_SELECT);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				int uid = rs.getInt("m_uid");
				String pw = rs.getString("m_pw");
				String nick = rs.getString("m_nick");
				String name = rs.getString("m_name");
				String birth = rs.getString("m_birth");
				String phoneNum = rs.getString("m_phoneNum");
				String gender = rs.getString("m_gender");
				String addressA = rs.getString("m_addressA");
				String addressB = rs.getString("m_addressB");
				int smsOk = rs.getInt("m_SMSOk");
				int grade = rs.getInt("m_grade");

				user = new DTOUser(uid, email, pw, nick, name, birth, phoneNum, gender, addressA, addressB, grade, smsOk);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	// nick 실시간 유효성 체크
	public int check_nick(String nick) {
		int chk = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_UNICK_SELECT);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk = 1;
			}else {
				chk = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	// nick 실시간 유효성 체크
	public int check_email(String email) {
		int chk = 0;
		
		try {
			pstmt = conn.prepareStatement(Common.SQL_UEMAIL_SELECT);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	

}




















