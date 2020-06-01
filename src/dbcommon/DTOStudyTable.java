package dbcommon;

public class DTOStudyTable {
	private int s_uid;
	private String sc_name;
	private String s_title;
	private String s_content;
	private String s_date_day;
	private String s_date_time;
	private String m_nick;
	private int s_viewCnt;
	private String s_date;
	private String s_udate;
	private int sc_uid;
	private int m_uid;

	public DTOStudyTable() {
		super();
	}

	public DTOStudyTable(int s_uid, String sc_name, String s_title, String s_content, String s_date_day,
			String s_date_time, String m_nick, int s_viewCnt) {
		super();
		this.s_uid = s_uid;
		this.sc_name = sc_name;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date_day = s_date_day;
		this.s_date_time = s_date_time;
		this.m_nick = m_nick;
		this.s_viewCnt = s_viewCnt;
	}

	public int getS_uid() { return s_uid; }
	public void setS_uid(int s_uid) { this.s_uid = s_uid; }
	public String getS_title() { return s_title; }
	public void setS_title(String s_title) { this.s_title = s_title; }
	public String getS_content() { return s_content; }
	public void setS_content(String s_content) { this.s_content = s_content; }
	public String getS_date() { return s_date; }
	public void setS_date(String s_date) { this.s_date = s_date; }
	public String getS_udate() { return s_udate; }
	public void setS_udate(String s_udate) { this.s_udate = s_udate; }
	public int getS_viewCnt() { return s_viewCnt; }
	public void setS_viewCnt(int s_viewCnt) { this.s_viewCnt = s_viewCnt; }
	public int getSc_uid() { return sc_uid; }
	public void setSc_uid(int sc_uid) { this.sc_uid = sc_uid; }
	public int getM_uid() { return m_uid; }
	public void setM_uid(int m_uid) { this.m_uid = m_uid; }
	public String getSc_name() { return sc_name; }
	public void setSc_name(String sc_name) { this.sc_name = sc_name; }
	public String getS_date_day() { return s_date_day; }
	public void setS_date_day(String s_date_day) { this.s_date_day = s_date_day; }
	public String getS_date_time() { return s_date_time; }
	public void setS_date_time(String s_date_time) { this.s_date_time = s_date_time; }
	public String getM_nick() { return m_nick; }
	public void setM_nick(String m_nick) { this.m_nick = m_nick; }

	@Override
	public String toString() {
		return s_uid + " | " + s_title + " | " + s_content + " | " + s_date + " | " + s_viewCnt + " | " + sc_uid + " | " + m_uid;
	}
}
