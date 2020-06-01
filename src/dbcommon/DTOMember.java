package dbcommon;

public class DTOMember {
	private int m_uid;
	private String m_email;
	private String m_pw;
	private String m_nick;
	private String m_name;
	private String m_birth;
	private String m_phoneNum;
	private String m_gender;
	private String m_addressA;
	private String m_addressB;
	private int m_SMSOk;
	private int m_grade;
	public DTOMember() {
		super();
	}
	public DTOMember(int m_uid, String m_email, String m_pw, String m_nick, String m_name, String m_birth, String m_phoneNum,
			String m_gender, String m_addressA, String m_addressB, int m_SMSOk, int m_grade) {
		super();
		this.m_uid = m_uid;
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.m_nick = m_nick;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_phoneNum = m_phoneNum;
		this.m_gender = m_gender;
		this.m_addressA = m_addressA;
		this.m_addressB = m_addressB;
		this.m_SMSOk = m_SMSOk;
		this.m_grade = m_grade;
	}
	public int getM_uid() { return m_uid; }
	public void setM_uid(int m_uid) { this.m_uid = m_uid; }
	public String getM_email() { return m_email; }
	public void setM_email(String m_email) { this.m_email = m_email; }
	public String getM_pw() { return m_pw; }
	public void setM_pw(String m_pw) { this.m_pw = m_pw; }
	public String getM_nick() { return m_nick; }
	public void setM_nick(String m_nick) { this.m_nick = m_nick; }
	public String getM_name() { return m_name; }
	public void setM_name(String m_name) { this.m_name = m_name; }
	public String getM_birth() { return m_birth; }
	public void setM_birth(String m_birth) { this.m_birth = m_birth; }
	public String getM_phoneNum() { return m_phoneNum; }
	public void setM_phoneNum(String m_phoneNum) { this.m_phoneNum = m_phoneNum; }
	public String getM_gender() { return m_gender; }
	public void setM_gender(String m_gender) { this.m_gender = m_gender; }
	public String getM_addressA() { return m_addressA; }
	public void setM_addressA(String m_addressA) { this.m_addressA = m_addressA; }
	public String getM_addressB() { return m_addressB; }
	public void setM_addressB(String m_addressB) { this.m_addressB = m_addressB; }
	public int getM_SMSOk() { return m_SMSOk; }
	public void setM_SMSOk(int m_SMSOk) { this.m_SMSOk = m_SMSOk; }
	public int getM_grade() { return m_grade; }
	public void setM_grade(int m_grade) { this.m_grade = m_grade; }

}
