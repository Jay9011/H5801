package dbcommon;

import java.util.List;

public class AjaxBook extends AjaxBookResult {
	private List<DTOBook> list;
	
	private int page; // 현재 페이지 #
	
	private int totalPage; // 총 몇 '페이지' 분량?
	
	private int totalCnt; // 데이터(글)은 총 몇개?
	
	private int writePages;  // 한[페이징]에 몇개의 '페이지'를 표현할 것인가
	
	private int pageRows; // 한 '페이지' 에 몇개의 글을 리스트 할것인가

	public List<DTOBook> getList() {
		return list;
	}

	public void setList(List<DTOBook> list) {
		this.list = list;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getWritePages() {
		return writePages;
	}

	public void setWritePages(int writePages) {
		this.writePages = writePages;
	}

	public int getPageRows() {
		return pageRows;
	}

	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}
	
	
	
}
