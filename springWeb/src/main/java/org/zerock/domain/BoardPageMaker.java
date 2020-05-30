package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BoardPageMaker {
	private CriteriaVO cri;		//���� ������, �� �������� ������ �Խñ� ��
	private int totalCnt;		//��ü �Խñ� ��
	private int startPage;		//���� ������ ��ȣ
	private int endPage;		//�� ������ ��ȣ
	private boolean prev;		//���� ������
	private boolean next;		//���� ������
	
	private int displayPageNum = 10;	//������ ��������ȣ ����
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
