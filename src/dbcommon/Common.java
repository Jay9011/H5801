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
	public static final String SQL_INSERT_SRCOMMENT_ORIGIN = "INSERT INTO sr_comment (sr_numUid, sr_group, sr_depth, sr_com, s_uid, m_uid) "
															+ "VALUES (SEQ_sr_comment_sr_numUid.NEXTVAL, SEQ_sr_comment_sr_numUid.CURRVAL, 0, ?, ?, ?)";

//	내가 쓴 게시글 찾기
	public static final String SQL_SELECT_ALL_BOARD = "SELECT s_uid, s_title, s_content, s_date FROM s_table WHERE m_uid = ?";
//	내가 댓글 닷 게시글 찾기
	public static final String SQL_SELECT_ALL_CMTBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_table s, sr_comment sc WHERE s.s_uid = sc.s_uid AND sc.m_uid = ?";
//	내가 찜한 게시글 찾기기
	public static final String SQL_SELECT_ALL_LIKEBOARD = "SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_favor sf, s_table s WHERE sf.s_uid = s.s_uid AND sf.m_uid = ?";
	
	//==== 내가 쓴 게시판 받아오는 쿼리들
		// 쿼리: 받아온 게시판의 내가 쓴 글 갯수
		public static final	String SQL_COUNT_Board = "SELECT COUNT(*) FROM s_table WHERE m_uid = ?";
		// 쿼리: fromRow 부터 pageRows 만큼 SELECT
		public static final	String SQL_SELECT_FROM_ROW = "SELECT * FROM " + 
					"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM s_table WHERE m_uid = ? ORDER BY s_uid DESC) T) " + 
					"WHERE RNUM >= ? AND RNUM < ?";
		
		//==== 내가 쓴 댓글에 게시판 받아오는 쿼리들
			// 쿼리: 받아온 게시판의 내가 쓴 글 갯수
			public static final	String SQL_COUNT_CMTBOARD = "SELECT COUNT(*) FROM sr_comment WHERE m_uid = ?";
			// 쿼리: fromRow 부터 pageRows 만큼 SELECT
			public static final	String SQL_SELECT_FROM_CMT = "SELECT * FROM " + 
						"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_table s, sr_comment sc WHERE s.s_uid = sc.s_uid AND sc.m_uid = ? ORDER BY s_uid DESC) T) " + 
						"WHERE RNUM >= ? AND RNUM < ?";
		
		
			//==== 내가 좋아요 한 게시판 받아오는 쿼리들
			// 쿼리: 받아온 게시판의 내가 쓴 글 갯수
			public static final	String SQL_COUNT_LIKEBOARD = "SELECT COUNT(*) FROM s_favor WHERE m_uid = ?";
			// 쿼리: fromRow 부터 pageRows 만큼 SELECT
			public static final	String SQL_SELECT_FROM_LIKE = "SELECT * FROM " + 
						"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT s.s_uid, s.s_title, s.s_content, s.s_date FROM s_favor sf, s_table s WHERE sf.s_uid = s.s_uid AND sf.m_uid = ? ORDER BY s_uid DESC) T) " + 
						"WHERE RNUM >= ? AND RNUM < ?";
	
	//USER (로그인,회원가입)
	// 1. 유저 등록하기
		 public static final String SQL_USER_INSERT ="INSERT INTO M_USER "
		 		+ "(m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA, m_addressB)" + 
		 		"	VALUES (SEQ_m_user_m_uid.NEXTVAL, ?, ?, ?, ?, to_date(?, 'yyyy-mm-dd'), ?, ?, ?, ?, ?)";
		 
		// 2. user 로그인
		 public static final String SQL_USER_SELECT = "SELECT * FROM M_USER WHERE m_email = ?";
		 	
		// 3. userNick중복검사		 
		 public static final String SQL_UNICK_SELECT = "SELECT m_nick FROM m_user WHERE m_nick = ?";
		 
		 
		 // 4. userEmail 중복검사		 
		 public static final String SQL_UEMAIL_SELECT = "SELECT m_email FROM m_user WHERE m_email = ?";
}
