package org.zerock.dao;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardDAO {
	public List<BoardVO> readBoardList();
	public BoardVO readBoard(int id);
	public void createBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public void deleteBoard(int id);
}
