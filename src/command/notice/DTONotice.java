package command.notice;

public class DTONotice{
	private int n_uid;
	private String n_title;
	private String n_content;	
	private int n_viewCnt;
	private String n_date;
	private int m_uid;
	
	public DTONotice() {
		super();
	}
	
	public DTONotice(int n_uid, String n_title, String n_content, int n_viewCnt, String n_date, int m_uid) {
		super();
		this.n_uid = n_uid;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_viewCnt = n_viewCnt;
		this.n_date = n_date;
		this.m_uid = m_uid;
	}
	
	public int getN_uid() {return n_uid;}
	public void setN_uid(int n_uid) {this.n_uid = n_uid;}
	public String getN_title() {return n_title;}
	public void setN_title(String n_title) {this.n_title = n_title;}
	public String getN_content() {return n_content;}
	public void setN_content(String n_content) {this.n_content = n_content;}
	public int getN_viewCnt() {return n_viewCnt;}
	public void setN_viewCnt(int n_viewCnt) {this.n_viewCnt = n_viewCnt;}
	public String getN_date() {return n_date;}
	public void setN_date(String n_date) {this.n_date = n_date;}
	public int getM_uid() {return m_uid;}
	public void setM_uid(int m_uid) {this.m_uid = m_uid;
	}
}
