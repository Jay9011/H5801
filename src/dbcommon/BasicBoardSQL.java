package dbcommon;

public class BasicBoardSQL {
	String fromBlock = "";
	String whereBlock = "";
	String colName = "";

	public String getFromBlock() { return fromBlock; }
	public void setFromBlock(String fromBlock) { this.fromBlock = fromBlock; }
	public String getWhereBlock() { return whereBlock; }
	public void setWhereBlock(String whereBlock) { this.whereBlock = whereBlock; }
	public String getColName() { return colName; }
	public void setColName(String colName) { this.colName = colName; }

	public String getCOUNT_ALL() {
		return "SELECT count(*) FROM " + fromBlock;
		}

	public String getCount_WHERE() {
		return "SELECT COUNT(*) FROM " + fromBlock + " WHERE " + whereBlock;
	}

	public String getMAX_COL() {
		return "SELECT count(" +  colName + ") FROM " + fromBlock;
		}

	public String getPAGING_SELECT_FROM_ROW() {
		return "SELECT * FROM "
				+ "(SELECT ROWNUM AS RNUM, T.* FROM (" + fromBlock + ") T) "
				+ "WHERE RNUM >= ? AND RNUM < ?";
		}
}
