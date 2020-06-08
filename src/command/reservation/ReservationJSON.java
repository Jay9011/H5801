package command.reservation;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import command.JSONBase;
import dbcommon.DTOReservation;

public class ReservationJSON extends JSONBase{
	@JsonProperty("data")
	private List<DTOReservation> list;

	public List<DTOReservation> getList() { return list; }
	public void setList(List<DTOReservation> list) { this.list = list; }

}
