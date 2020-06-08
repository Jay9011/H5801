package command.faq;

public class FaqCommon{
	public static final String SQL_SELECT_ALL_FAQ = "SELECT * FROM FAQ";
	public static final String SQL_INSERT_FAQ = "INSERT INTO FAQ(f_uid ,f_title, f_content) VALUES(SEQ_faq_f_uid.nextval,?,?)";
	public static final String SQL_DELETE_FTABLE = "DELETE FROM FAQ WHERE f_uid = ?";
	public static final String SQL_SELECT_F_UID = "SELECT * FROM FAQ WHERE f_uid = ?";
	public static final String SQL_UPDATE_FAQ = "UPDATE FAQ SET f_title = ?, f_content = ? WHERE f_uid = ?";
}