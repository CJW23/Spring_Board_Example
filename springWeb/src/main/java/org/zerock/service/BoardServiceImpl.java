package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.zerock.dao.BoardDAO;
import org.zerock.domain.BoardVO;

public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO boardDAO;
	
	@Override
	public void regist(BoardVO boardVO) throws Exception {
		boardDAO.createBoard(boardVO);
	}

	@Override
	public BoardVO read(int id) throws Exception {
		return boardDAO.readBoard(id);
	}

	@Override
	public void modify(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
	}

	@Override
	public void remove(int id) throws Exception {
		boardDAO.deleteBoard(id);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardDAO.readBoardList();
	}

}
