package command.studying;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import command.JSONBase;
import dbcommon.DTOComment;

public class CommentJSON extends JSONBase{
	@JsonProperty("data")
	private List<DTOComment> list;

	public List<DTOComment> getList() { return list; }
	public void setList(List<DTOComment> list) { this.list = list; }
}
