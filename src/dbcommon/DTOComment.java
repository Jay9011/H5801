package dbcommon;

public class DTOComment {
	private int sr_numUid;
	private int sr_group;
	private int sr_depth;
	private String sr_com;
	private String sr_date;
	private String sr_udate;
	private int sr_deleted;
	private int s_uid;
	private int m_uid;
	private int sr_numUidt;
	private String m_nick;
	public DTOComment() {
		super();
	}
	public DTOComment(int sr_numUid, int sr_group, int st_depth, String sr_com, String sr_date, String sr_udate,
			int sr_deleted, int s_uid, int m_uid, int sr_numUidt) {
		super();
		this.sr_numUid = sr_numUid;
		this.sr_group = sr_group;
		this.sr_depth = st_depth;
		this.sr_com = sr_com;
		this.sr_date = sr_date;
		this.sr_udate = sr_udate;
		this.sr_deleted = sr_deleted;
		this.s_uid = s_uid;
		this.m_uid = m_uid;
		this.sr_numUidt = sr_numUidt;
	}
	public int getSr_numUid() { return sr_numUid; }
	public void setSr_numUid(int sr_numUid) { this.sr_numUid = sr_numUid; }
	public int getSr_group() { return sr_group; }
	public void setSr_group(int sr_group) { this.sr_group = sr_group; }
	public int getSr_depth() { return sr_depth; }
	public void setSr_depth(int sr_depth) { this.sr_depth = sr_depth; }
	public String getSr_com() { return sr_com; }
	public void setSr_com(String sr_com) { this.sr_com = sr_com; }
	public String getSr_date() { return sr_date; }
	public void setSr_date(String sr_date) { this.sr_date = sr_date; }
	public String getSr_udate() { return sr_udate; }
	public void setSr_udate(String sr_udate) { this.sr_udate = sr_udate; }
	public int getSr_deleted() { return sr_deleted; }
	public void setSr_deleted(int sr_deleted) { this.sr_deleted = sr_deleted; }
	public int getS_uid() { return s_uid; }
	public void setS_uid(int s_uid) { this.s_uid = s_uid; }
	public int getM_uid() { return m_uid; }
	public void setM_uid(int m_uid) { this.m_uid = m_uid; }
	public int getSr_numUidt() { return sr_numUidt; }
	public void setSr_numUidt(int sr_numUidt) { this.sr_numUidt = sr_numUidt; }
	public String getM_nick() { return m_nick; }
	public void setM_nick(String m_nick) { this.m_nick = m_nick; }
}
