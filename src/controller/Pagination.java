package controller;

import java.sql.SQLException;

import dbcommon.DAOLoadBoard;

public class Pagination {
	private final static int pageCount = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int listCnt = 5;

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
    public void makeBlock(int curPage){
        int blockNum = 0;

        blockNum = (int)Math.floor((curPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;
        blockLastNum = blockStartNum + (pageCount-1);
    }

//    // 총 페이지의 마지막 번호
//    public void makeLastPageNum() {
//        DAOLoadBoard dao = new DAOLoadBoard();
//        int total = dao.getCount();
//
//        if( total % pageCount == 0 ) {
//            lastPageNum = (int)Math.floor(total/pageCount);
//        }
//        else {
//            lastPageNum = (int)Math.floor(total/pageCount) + 1;
//        }
//    }

    // 검색을 했을 때 총 페이지의 마지막 번호
    public void makeLastPageNum(int maxNum) {
//    	DAOLoadBoard dao = new DAOLoadBoard();
//		total = dao.getCount(kwd);
        int total = maxNum;
        
        if( total % listCnt == 0 ) {
            lastPageNum = (int)Math.floor(total/listCnt);
        }
        else {
            lastPageNum = (int)Math.floor(total/listCnt) + 1;
        }
    }
}
