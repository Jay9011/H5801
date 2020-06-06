package command.studying;

import command.JSONBase;

public class FavorJSON extends JSONBase{
	private int isClicked;

	public FavorJSON() {
		super();
	}

	public int getIsClicked() { return isClicked; }
	public void setIsClicked(int isClicked) { this.isClicked = isClicked; }
}
