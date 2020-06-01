package dbcommon;

public class Common {

	/** FIXME
	 *	DB 접속 정보
	 */
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "scott5801";
	public static final String USERPW = "tiger5801";

	/**
	 *  Query
	 */
	public static final String SQL_SELECT_MEMBER_WHERE_EMAIL = "SELECT * FROM m_user WHERE m_email = ?";

	public static final String SQL_SELECT_ALL_ASC = "SELECT * FROM s_table ORDER BY s_uid ASC";
	public static final String SQL_SELECT_ALL_DESC = "SELECT * FROM s_table ORDER BY s_uid DESC";
	public static final String SQL_SELECT_ALL_WHERE_S_UID = "SELECT * FROM s_table WHERE s_uid = ?";
	public static final String SQL_SELECT_USER_WHERE_M_UID = "SELECT * FROM m_user WHERE m_uid = ?";
	public static final String SQL_SELECT_CATEGORY_WHERE_SC_UID = "SELECT * FROM s_category WHERE sc_uid = ?";
	public static final String SQL_INSERT_STABLE = "INSERT INTO s_table (s_uid, s_title, s_content, sc_uid, m_uid) VALUES (SEQ_s_table_s_uid.NEXTVAL, ?, ?, ?, ?)";
	
//	내가 쓴 게시글 찾기
	public static final String SQL_SELECT_ALL_BOARD = "SELECT s_uid, s_title, s_content, s_date FROM s_table WHERE m_uid = ?";
//	내가 댓글 닷 게시글 찾기
	public static final String SQL_SELECT_ALL_CMTBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_table s, sr_comment sc WHERE s.s_uid = sc.s_uid AND sc.m_uid = ?";
//	내가 찜한 게시글 찾기기
	public static final String SQL_SELECT_ALL_LIKEBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_favor sf, s_table s WHERE sf.s_uid = s.s_uid AND sf.m_uid = ?";
}
