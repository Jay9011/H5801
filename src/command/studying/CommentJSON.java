package command.studying;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import dbcommon.DTOComment;

public class CommentJSON {
	private int count;
	private String status;
	@JsonProperty("data")
	private List<DTOComment> list;

	public int getCount() { return count; }
	public void setCount(int count) { this.count = count; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public List<DTOComment> getList() { return list; }
	public void setList(List<DTOComment> list) { this.list = list; }
}
