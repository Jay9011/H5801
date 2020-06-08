package command.notice;

public class NoticeCommon{
	public static final String SQL_SELECT_ALL_NOTICE =
			"SELECT * FROM N_TABLE";
	public static final String SQL_SELECT_NOTICE_UID =
			"SELECT * FROM N_TABLE WHERE n_uid=?";
	public static final String SQL_SELECT_INC_VIEWCNT =
			"UPDATE n_table SET n_viewCnt = n_viewCnt + 1 WHERE n_uid = ?";
	public static final String SQL_SELECT_PAGEING_ALL = 
			"SELECT count(*) FROM N_TABLE";
	public static final String SQL_SELECT_PAGEING_FROM_ROW = 
			"SELECT * FROM " + 
			"(SELECT ROWNUM AS RNUM, N.* FROM (SELECT * FROM N_TABLE ORDER BY N_UID DESC) T) " + 
			"WHERE RNUM >= ? AND RNUM < ?";
	public static final String SQL_COUNT_SELECT_NTABLE = 
			"SELECT COUNT(*) FROM N_TABLE";
	
	public static final	String SQL_SELECT_FROM_ROW = "SELECT * FROM " + 
			"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM n_table ORDER BY n_uid DESC) T) " + 
			"WHERE RNUM >= ? AND RNUM < ?";
	
	public static final String SQL_INSERT_NOTICE = "INSERT INTO n_table(n_uid ,n_title, n_content, m_uid) VALUES(SEQ_n_table_n_uid.nextval,?,?,?)";
	public static final String SQL_DELETE_NTABLE = "DELETE FROM N_TABLE WHERE n_uid = ?";
	public static final String SQL_SELECT_N_UID = "SELECT * FROM N_TABLE WHERE n_uid = ?";
	public static final String SQL_UPDATE_NOTICE = "UPDATE N_TABLE SET n_title = ?, n_content = ? WHERE n_uid = ?";
	
	
}
