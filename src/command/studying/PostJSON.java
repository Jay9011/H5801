package command.studying;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import command.JSONBase;
import dbcommon.DTOStudyTable;

public class PostJSON extends JSONBase{
	@JsonProperty("data")
	List<DTOStudyTable> list;

	int page;		// 현재 페이지
	int totalPage;	// 총 페이지
	int totalCnt;	// 총 글 수
	int writePages;	// 페이징 페이지 수
	int pageRows;	// 한 페이지의 글 수
	int blockStartNum = 0; // 그 블럭의 첫번쨰 page 번호
    int blockLastNum = 0; // 그 블럭의 마지막 page 번호

	public List<DTOStudyTable> getList() { return list; }
	public void setList(List<DTOStudyTable> list) { this.list = list; }
	public int getPage() { return page; }
	public void setPage(int page) { this.page = page; }
	public int getTotalPage() { return totalPage; }
	public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
	public int getTotalCnt() { return totalCnt; }
	public void setTotalCnt(int totalCnt) { this.totalCnt = totalCnt; }
	public int getWritePages() { return writePages; }
	public void setWritePages(int writePages) { this.writePages = writePages; }
	public int getPageRows() { return pageRows; }
	public void setPageRows(int pageRows) { this.pageRows = pageRows; }
	public int getBlockStartNum() { return blockStartNum; }
	public int getBlockLastNum() { return blockLastNum; }
	public void setBlockStartNum(int blockStartNum) { this.blockStartNum = blockStartNum; }
	public void setBlockLastNum(int blockLastNum) { this.blockLastNum = blockLastNum; }

	public void makeBlock() {
		int blockNum = 0;

		blockNum = (int)Math.floor((page - 1)/writePages);
		blockStartNum = (writePages * blockNum) + 1;
		blockLastNum = blockStartNum + (writePages - 1);
	}


}
