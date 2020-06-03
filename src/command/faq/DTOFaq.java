package command.faq;

public class DTOFaq{
	private int f_uid;
	private String f_title;
	private String f_content;
	
	public DTOFaq() {
		super();
	}

	public DTOFaq(int f_uid, String f_title, String f_content) {
		super();
		this.f_uid = f_uid;
		this.f_title = f_title;
		this.f_content = f_content;
	}

	public int getF_uid() {return f_uid;}

	public void setF_uid(int f_uid) {this.f_uid = f_uid;}

	public String getF_title() {return f_title;}

	public void setF_title(String f_title) {this.f_title = f_title;}

	public String getF_content() {return f_content;}

	public void setF_content(String f_content) {this.f_content = f_content;}
}


