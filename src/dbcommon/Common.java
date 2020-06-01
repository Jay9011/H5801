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
	public static final String SQL_SELECT_USER_WHERE_M_UID = "SELECT * FROM m_user WHERE m_uid = ?";
	public static final String SQL_SELECT_CATEGORY_WHERE_SC_UID = "SELECT * FROM s_category WHERE sc_uid = ?";
	public static final String SQL_SELECT_ALL_WHERE_DESC = "SELECT * FROM ? WHERE ? ORDER BY ? DESC";
	public static final String SQL_INSERT_STABLE = "INSERT INTO s_table (s_uid, s_title, s_content, sc_uid, m_uid) VALUES (SEQ_s_table_s_uid.NEXTVAL, ?, ?, ?, ?)";
	public static final String SQL_UPDATE = "UPDATE ? SET ? WHERE ?";
	public static final String SQL_DELETE_WHERE = "DELETE FROM ? WHERE ?";

}
