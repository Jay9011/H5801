package command.pagenotice;


import java.sql.SQLException;

import dbcommon.DAOLoadBoard;

public class NoticePageing {
	private final static int pageCount = 5; //몇 개의 페이지네이션
	//block 은  1~5 page 가 속해있는 그룹
    private int blockStartNum = 0; // 그 블럭의 첫번쨰 page 번호
    private int blockLastNum = 0; // 그 블럭의 마지막 page 번호
    private int lastPageNum = 0; // 전체 page의 마지막 번호
    private int listCnt = 10; // 보여지는 게시판의 갯수

    public int getBlockStartNum() {
        return blockStartNum;
    }
    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }
    public int getBlockLastNum() {
        return blockLastNum;
    }
    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }
    public int getLastPageNum() {
        return lastPageNum;
    }
    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }
    public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	// block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(int curPage){		//curPage = 현재페이지
        int blockNum = 0;

        blockNum = (int)Math.floor((curPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;
        blockLastNum = blockStartNum + (pageCount-1);
    }

    public void makeLastPageNum(int maxNum) {
        int total = maxNum;
        
        if( total % listCnt == 0 ) {
            lastPageNum = (int)Math.floor(total/listCnt);
        }
        else {
            lastPageNum = (int)Math.floor(total/listCnt) + 1;
        }
    }
}
