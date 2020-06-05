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
	public static final String SQL_UPDATE_STABLE = "UPDATE s_table SET s_title = ?, s_content = ? WHERE s_uid = ?";
	public static final String SQL_INC_VIEWCNT_STABLE = "UPDATE s_table SET s_viewCnt = s_viewCnt + 1 WHERE s_uid = ?";
	public static final String SQL_DELETE_STABLE = "DELETE FROM s_table WHERE s_uid = ?";
	public static final String SQL_DELETE_SRCOMMENT = "DELETE FROM sr_comment WHERE sr_numuid = ?";
	public static final String SQL_DELETE_SRCOMMENT_WHERE_S_UID = "DELETE FROM sr_comment WHERE s_uid = ?";
	public static final String SQL_DELETE_SFAVOR_WHERE_S_UID = "DELETE FROM s_favor WHERE s_uid = ?";
	public static final String SQL_SELECT_SFAVOR = "SELECT COUNT(*) FROM S_FAVOR WHERE m_uid = ? AND s_uid = ?";
	public static final String SQL_INSERT_SFAVOR = "INSERT INTO s_favor (m_uid, s_uid) VALUES (?, ?)";
	public static final String SQL_DELETE_SFAVOR = "DELETE FROM s_favor WHERE m_uid = ? AND s_uid = ?";


	public static final String SQL_SELECT_ALL_SRCOMMENT_WHERE_S_UID =
			"SELECT c.*, u.M_NICK "
			+ "FROM sr_comment c, m_user u "
			+ "WHERE c.m_uid = u.m_uid AND s_uid = ? "
			+ "ORDER BY sr_group DESC, sr_depth, sr_numuid DESC";
//			"SELECT * FROM sr_comment WHERE s_uid = ? ORDER BY sr_group, sr_depth";
	public static final String SQL_SELECT_ALL_SRCOMMENT_WHERE_SR_UID_ORIGIN =
			"SELECT * "
			+ "FROM sr_comment "
			+ "WHERE SR_NUMUID = ? ";
	public static final String SQL_SELECT_ALL_SRCOMMENT_WHERE_SR_UID =
			"SELECT c.*, u.M_NICK "
			+ "FROM sr_comment c, m_user u "
			+ "WHERE c.m_uid = u.m_uid AND SR_NUMUID = ? ";
	public static final String SQL_INSERT_SRCOMMENT =
			"INSERT INTO sr_comment (sr_numUid, sr_group, sr_depth, sr_com, s_uid, m_uid, sr_numuidt) "
			+ "VALUES (SEQ_sr_comment_sr_numUid.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	public static final String SQL_INSERT_SRCOMMENT_ORIGIN =
			"INSERT INTO sr_comment (sr_numUid, sr_group, sr_depth, sr_com, s_uid, m_uid) "
			+ "VALUES (SEQ_sr_comment_sr_numUid.NEXTVAL, SEQ_sr_comment_sr_numUid.CURRVAL, 0, ?, ?, ?)";
	public static final String SQL_INSERT_SRCOMMENT_FROM_PARENT =
			"INSERT INTO sr_comment (sr_numUid, sr_group, sr_depth, sr_com, s_uid, m_uid, sr_numuidt) "
			+ " SELECT SEQ_sr_comment_sr_numUid.NEXTVAL, sr.SR_NUMUID ,sr.SR_DEPTH + 1 ,? ,? ,? ,sr.SR_NUMUID "
			+ " FROM SR_COMMENT sr "
			+ " WHERE sr.SR_NUMUID = ? ";
	public static final String SQL_UPDATE_SRCOMMENT = "UPDATE sr_comment SET sr_com = ?, sr_udate = SYSDATE WHERE sr_numuid = ?";

//	내가 쓴 게시글 찾기
	public static final String SQL_SELECT_ALL_BOARD = "SELECT s_uid, s_title, s_content, s_date FROM s_table WHERE m_uid = ?";
//	내가 댓글 닷 게시글 찾기
	public static final String SQL_SELECT_ALL_CMTBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_table s, sr_comment sc WHERE s.s_uid = sc.s_uid AND sc.m_uid = ?";
//	내가 찜한 게시글 찾기기
	public static final String SQL_SELECT_ALL_LIKEBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_favor sf, s_table s WHERE sf.s_uid = s.s_uid AND sf.m_uid = ?";
}
