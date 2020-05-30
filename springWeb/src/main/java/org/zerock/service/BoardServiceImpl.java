package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.dao.BoardDAO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;

@Service
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

	@Override
	public List<BoardVO> listPage(CriteriaVO cri) throws Exception {
		return boardDAO.listPage(cri);
	}

	@Override
	public int totalNum() throws Exception {
		return boardDAO.totalBoardNum();
	}

	@Override
	public List<BoardVO> searchListPage(CriteriaVO cri) throws Exception {
		return boardDAO.searchBoardList(cri);
	}

	@Override
	public int searchTotalNum(CriteriaVO cri) throws Exception {
		return boardDAO.searchBoardNum(cri);
	}
	
}
