package command.intro;

public class DTOIntro{
	private int t_uid;
	private String t_name;
	private int t_pay;
	private int t_maxnum;
	
	public DTOIntro() {
		super();
	}
	
	public DTOIntro(int t_uid, String t_name, int t_pay, int t_maxnum) {
		super();
		this.t_uid = t_uid;
		this.t_name = t_name;
		this.t_pay = t_pay;
		this.t_maxnum = t_maxnum;
	}

	public int getT_uid() {return t_uid;}
	public void setT_uid(int t_uid) {this.t_uid = t_uid;}
	public String getT_name() {return t_name;}
	public void setT_name(String t_name) {this.t_name = t_name;}
	public int getT_pay() {return t_pay;}
	public void setT_pay(int t_pay) {this.t_pay = t_pay;}
	public int getT_maxnum() {return t_maxnum;}
	public void setT_maxnum(int t_maxnum) {this.t_maxnum = t_maxnum;}
}
