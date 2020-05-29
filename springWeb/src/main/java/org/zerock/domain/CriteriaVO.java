package org.zerock.domain;

public class CriteriaVO {
	private int curPage;
	private int perPageNum;
	public CriteriaVO() {
		this.curPage = 1;
		this.perPageNum = 10;
	}
	public int getCurPage() {
		return curPage;
	}
	public int getPageStart() {
		return (this.curPage - 1) * this.perPageNum;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	@Override
	public String toString() {
		return curPage + " " + perPageNum;
	}
}
