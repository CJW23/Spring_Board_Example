package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;

public interface BoardService {
	public void regist(BoardVO boardVO) throws Exception;
	public BoardVO read(int id) throws Exception;
	public void modify(BoardVO boardVO) throws Exception;
	public void remove(int id) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listPage(CriteriaVO cri) throws Exception; 
	public int totalNum() throws Exception;
}
