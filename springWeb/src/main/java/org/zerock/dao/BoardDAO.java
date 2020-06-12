package org.zerock.dao;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;

public interface BoardDAO {
	public List<BoardVO> readBoardList();
	public BoardVO readBoard(int id);
	public void createBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public void deleteBoard(int id);
	public List<BoardVO> listPage(CriteriaVO cri);
	public int totalBoardNum();
	public List<BoardVO> searchBoardList(CriteriaVO cri) throws Exception;
	public int searchBoardNum(CriteriaVO cri) throws Exception;
	public void addViewCount(int id);
}
