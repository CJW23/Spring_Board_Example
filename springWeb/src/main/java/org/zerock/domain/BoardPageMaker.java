package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BoardPageMaker {
	private CriteriaVO cri;		//현재 페이지, 한 페이지당 보여줄 게시글 수
	private int totalCnt;		//전체 게시글 수
	private int startPage;		//시작 페이지 번호
	private int endPage;		//끝 페이지 번호
	private boolean prev;		//이전 페이지
	private boolean next;		//다음 페이지
	
	private int displayPageNum = 10;	//보여줄 페이지번호 개수
	public BoardPageMaker(CriteriaVO cri) {
		this.cri = cri;
	}
	
	public CriteriaVO getCri() {
		return cri;
	}
	
	private void calData() {
		endPage = (int) (Math.ceil(cri.getCurPage()/(double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tmpEndPage = (int) (Math.ceil(totalCnt/(double) displayPageNum));
		if(endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCnt ? false : true;
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
	public void setCri(CriteriaVO cri) {
		this.cri = cri;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
		calData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	@Override
	public String toString() {
		return totalCnt + " " + startPage + " " + endPage + " " + prev + " " + next;
	}

}
