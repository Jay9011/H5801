// 작성자: 낙경
// 2020-06-02  22:00 수정

package dbcommon;

import java.sql.Date;
import java.sql.Time;

public class DTOBook {
	private int rnum;
	private int p_uid; // 테이블명: RESERVE 컬럼명: p_uid
	private String tid;
	private Date b_sdate;// 테이블명: v_book 컬럼명: TO_CHAR(a.p_startTime, 'YYYY-MM-DD') AS "b_sdate"
	private String b_stime;//	테이블명: v_book 컬럼명: TO_CHAR(a.p_startTime, 'HH24:MI:SS') AS "b_stime"
	private String b_etime;//	테이블명: v_book 컬럼명: TO_CHAR(a.p_endTime, 'HH24:MI:SS') AS "b_etime"
	private int b_term;//	테이블명: v_book 컬럼명:ROUND((a.p_endTime-a.p_startTime)*24) AS "b_term"
	private int b_duration;//	테이블명: v_book 컬럼명: ROUND((a.p_startTime-SYSDATE)*24) AS "b_duration"
	private int b_refund;// 테이블명: v_book 컬럼명: CASE WHEN ROUND((a.p_startTime-SYSDATE)*24) >= 2 THEN '1' ELSE '0' END AS "b_refund"
	private int total_amount; //	테이블명: RESERVE 컬럼명: total_amount
	private Date b_date;// 테이블명: RESERVE 컬럼명: TO_CHAR(a.pay_date, 'YYYY-MM-DD') AS "b_date"
	private int p_cancel;//	테이블명: RESERVE 컬럼명: p_cancel
	private int m_uid;//	테이블명: m_user 컬럼명: m_uid (p_uid)
	private String email;//	테이블명: m_user 컬럼명: m_email
	private String m_nick;// 테이블명: m_user 컬럼명: m_nick
	private String m_name;// 테이블명: m_user 컬럼명: m_name
	private int m_grade;//	테이블명: m_user 컬럼명: m_grade
	private String b_seatType;// 테이블명: t_detail 컬럼명: CASE WHEN SUBSTR(c.t_uid, 1, 1) = 1 THEN '스터디룸' ELSE '좌석' END AS "b_seatType"
	private int t_name; // 테이블명: t_detail 컬럼명: t_name
	private float t_pay;//	테이블명: t_detail 컬럼명: t_pay
	private int t_maxmun;//	테이블명: t_detail 컬럼명: t_maxnum 
	
	// 기본 생성자
	public DTOBook() {
		super();
	}
	
	// 매개변수 생성자
	public DTOBook(int rnum, int p_uid, String tid, Date b_sdate, String b_stime, String b_etime, int b_term, int b_duration, int b_refund,
			int total_amount, Date b_date, int p_cancel, int m_uid, String email, String m_nick, String m_name,
			int m_grade, String b_seatType, int t_name, float t_pay, int t_maxmun) {
		super();
		this.rnum = rnum;
		this.p_uid = p_uid;
		this.tid = tid;
		this.b_sdate = b_sdate;
		this.b_stime = b_stime;
		this.b_etime = b_etime;
		this.b_term = b_term;
		this.b_duration = b_duration;
		this.b_refund = b_refund;
		this.total_amount = total_amount;
		this.b_date = b_date;
		this.p_cancel = p_cancel;
		this.m_uid = m_uid;
		this.email = email;
		this.m_nick = m_nick;
		this.m_name = m_name;
		this.m_grade = m_grade;
		this.b_seatType = b_seatType;
		this.t_name = t_name;
		this.t_pay = t_pay;
		this.t_maxmun = t_maxmun;
	}
	
	// getter & setter
	
	
	public int getRnum() {
		return rnum;
	}
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public int getP_uid() {
		return p_uid;
	}


	public void setP_uid(int p_uid) {
		this.p_uid = p_uid;
	}

	public Date getB_sdate() {
		return b_sdate;
	}

	public void setB_sdate(Date b_sdate) {
		this.b_sdate = b_sdate;
	}

	public String getB_stime() {
		return b_stime;
	}

	public void setB_stime(String b_stime) {
		this.b_stime = b_stime;
	}

	public String getB_etime() {
		return b_etime;
	}

	public void setB_etime(String b_etime) {
		this.b_etime = b_etime;
	}

	public int getB_term() {
		return b_term;
	}

	public void setB_term(int b_term) {
		this.b_term = b_term;
	}

	public int getB_duration() {
		return b_duration;
	}

	public void setB_duration(int b_duration) {
		this.b_duration = b_duration;
	}

	public int getB_refund() {
		return b_refund;
	}

	public void setB_refund(int b_refund) {
		this.b_refund = b_refund;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getP_cancel() {
		return p_cancel;
	}

	public void setP_cancel(int p_cancel) {
		this.p_cancel = p_cancel;
	}

	public int getM_uid() {
		return m_uid;
	}

	public void setM_uid(int m_uid) {
		this.m_uid = m_uid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	public String getB_seatType() {
		return b_seatType;
	}

	public void setB_seatType(String b_seatType) {
		this.b_seatType = b_seatType;
	}

	public int getT_name() {
		return t_name;
	}

	public void setT_name(int t_name) {
		this.t_name = t_name;
	}

	public float getT_pay() {
		return t_pay;
	}

	public void setT_pay(float t_pay) {
		this.t_pay = t_pay;
	}

	public int getT_maxmun() {
		return t_maxmun;
	}

	public void setT_maxmun(int t_maxmun) {
		this.t_maxmun = t_maxmun;
	}
	
	
	
	
	
	
	
} // end class