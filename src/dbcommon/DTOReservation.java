package dbcommon;

public class DTOReservation {
	private int p_uid;
	private String p_startDay;
	private String p_startTime;
	private String p_endDay;
	private String p_endTime;
	private int t_uid;

	public DTOReservation() {
		super();
	}

	public DTOReservation(int p_uid, String p_startDay, String p_startTime, String p_endDay, String p_endTime,
			int t_uid) {
		super();
		this.p_uid = p_uid;
		this.p_startDay = p_startDay;
		this.p_startTime = p_startTime;
		this.p_endDay = p_endDay;
		this.p_endTime = p_endTime;
		this.t_uid = t_uid;
	}

	public int getP_uid() { return p_uid; }

	public String getP_startDay() { return p_startDay; }

	public String getP_startTime() { return p_startTime; }

	public String getP_endDay() { return p_endDay; }

	public String getP_endTime() { return p_endTime; }

	public int getT_uid() { return t_uid; }

	public void setP_uid(int p_uid) { this.p_uid = p_uid; }

	public void setP_startDay(String p_startDay) { this.p_startDay = p_startDay; }

	public void setP_startTime(String p_startTime) { this.p_startTime = p_startTime; }

	public void setP_endDay(String p_endDay) { this.p_endDay = p_endDay; }

	public void setP_endTime(String p_endTime) { this.p_endTime = p_endTime; }

	public void setT_uid(int t_uid) { this.t_uid = t_uid; }

}
