package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardServiceTest {
	@Inject
	BoardService boardService;
	
	@Test
	public void registTest() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("qqqqq");
		board.setDes("yyyyyy");
		board.setWriter(3);
		boardService.regist(board);
	}
	
	@Test
	public void readTest() throws Exception{
		System.out.println(boardService.read(3).toString());
	}
	
	@Test
	public void modifyTest() throws Exception{
		BoardVO tmp = new BoardVO();
		tmp.setTitle("qqqqq");
		tmp.setDes("hhhhhh");
		tmp.setWriter(3);
	}
	
	@Test
	public void removeTest() throws Exception{
		boardService.remove(5);
	}
	
	@Test
	public void listAllTest() throws Exception{
		List<BoardVO> boards = boardService.listAll();
		for (BoardVO board : boards) {
			System.out.println(board.toString());
		}
	}
}
