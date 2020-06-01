package dbcommon;

public class DTOUser {
	private int uid; // m_uid
	private String email; // m_email
	private String pw; // m_pw
	private String nick; //m_nick
	private String name; // m_name
	private String birth; //m_birth
	private String phoneNum; // m_phoneNum
	private String gender; // m_gender
	private String addressA; //m_addressA
	private String addressB; //m_addressB
	private int grade;	 // m_grade
	private int smsOk; // m_smsOk
	private String profile; //m_profile  프로필 사진 
	private String link; //m_link 프로필 주소?... 왜 굳이..
	
	public DTOUser() {
		super();
		System.out.println("UserDTO()객체 생성");
	}
	
	

	public DTOUser(int uid, String email, String pw, String nick, String name, String birth, String phoneNum,
			String gender, String addressA, String addressB, int grade, int smsOk, String profile, String link) {
		super();
		this.uid = uid;
		this.email = email;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
		this.birth = birth;
		this.phoneNum = phoneNum;
		this.gender = gender;
		this.addressA = addressA;
		this.addressB = addressB;
		this.grade = grade;
		this.smsOk = smsOk;
		this.profile = profile;
		this.link = link;
		System.out.println("UserDTO(모든 매개변수)객체 생성");
	}



	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddressA() {
		return addressA;
	}

	public void setAddressA(String addressA) {
		this.addressA = addressA;
	}

	public String getAddressB() {
		return addressB;
	}

	public void setAddressB(String addressB) {
		this.addressB = addressB;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getSmsOk() {
		return smsOk;
	}

	public void setSmsOk(int smsOk) {
		this.smsOk = smsOk;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
	
	
	
}
