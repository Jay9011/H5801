package dbcommon;

// 작성자: 낙경
// 2020-06-01  23:00 수정

public class DTOPassword {
	private int uid; // m_uid
	private String email; // m_email
	private String pw; // m_pw
	private String nick; // m_nick
	private String name; // m_name
	
	// 기본 생성자
	public DTOPassword() {
		super();
	}
	
	// 매개변수 생성자
	public DTOPassword(int uid, String email, String pw, String nick, String name) {
		super();
		this.uid = uid;
		this.email = email;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
	}
	
	// getter & setter
	
	public int getUid() {
		System.out.println("getUid() invoke");
		return uid;
	}
	
	public void setUid(int uid) {
		System.out.println("setUid() invoke");
		this.uid = uid;
	}
	
	public String getEmail() {
		System.out.println("getEamil() invoke");
		return email;
	}


	public void setEmail(String email) {
		System.out.println("setEamil() invoke");
		this.email = email;
	}

	public String getPw() {
		System.out.println("getPW() invoke");
		return pw;
	}

	public void setPw(String pw) {
		System.out.println("setPW() invoke");
		this.pw = pw;
	}

	public String getNick() {
		System.out.println("getNick() invoke");
		return nick;
	}

	public void setNick(String nick) {
		System.out.println("setNcik() invoke");
		this.nick = nick;
	}

	public String getName() {
		System.out.println("getName() invoke");
		return name;
	}

	public void setName(String name) {
		System.out.println("setName() invoke");
		this.name = name;
	}
	
	
	
}

