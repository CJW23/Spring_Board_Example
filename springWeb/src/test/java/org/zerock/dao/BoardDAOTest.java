package org.zerock.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDAOTest {
	@Inject
	private BoardDAO dao;

	// @Test
	public void insertBoard() throws Exception {
		BoardVO tmp = new BoardVO();
		tmp.setTitle("xxxxx");
		tmp.setDes("zzzzz");
		tmp.setWriter(1);
		dao.createBoard(tmp);
	}

	// @Test
	public void selectListBoardTest() throws Exception {
		List<BoardVO> boardVO = dao.readBoardList();
		for (BoardVO b : boardVO) {
			System.out.println(b.toString());
		}
	}

	//@Test
	public void selectBoardTest() throws Exception {
		BoardVO boardVO = dao.readBoard(3);
		System.out.println(boardVO.toString());
	}

	// @Test
	public void updateBoardTest() throws Exception {
		BoardVO board = new BoardVO();
		board.setId(3);
		board.setTitle("aaaaa");
		board.setDes("wwwwwww");
		dao.updateBoard(board);
	}

	// @Test
	public void deleteBoardTest() throws Exception {
		dao.deleteBoard(2);
	}
	
	//@Test
	public void searchListBoardTest() throws Exception {
		CriteriaVO cri = new CriteriaVO();
		cri.setKeyword("안드로이드");
		List<BoardVO> list = dao.searchBoardList(cri);
		for (BoardVO boardVO : list) {
			System.out.println(boardVO.toString());
		}
	}
	
	//@Test
	public void searchListBoardNumTest() throws Exception{
		CriteriaVO cri = new CriteriaVO();
		cri.setKeyword("안드로이드");
		System.out.println(dao.searchBoardNum(cri));
	}
	
}
