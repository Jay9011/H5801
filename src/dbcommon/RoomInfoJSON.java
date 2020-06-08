package dbcommon;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import command.JSONBase;

public class RoomInfoJSON extends JSONBase{
	@JsonProperty("data")
	private List<DTORoomInfo> list;

	public List<DTORoomInfo> getList() { return list; }
	public void setList(List<DTORoomInfo> list) { this.list = list; }
}
