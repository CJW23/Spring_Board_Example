package org.zerock.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "org.zerock.mapper.BoardMapper";
	@Override
	public List<BoardVO> readBoardList() {
		return sqlSession.selectList(namespace+".selectBoardList");
	}

	@Override
	public BoardVO readBoard(int id) {
		return sqlSession.selectOne(namespace + ".selectBoard", id);
	}

	@Override
	public void createBoard(BoardVO boardVO) {
		sqlSession.insert(namespace+".insertBoard", boardVO);
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		sqlSession.update(namespace+".updateBoard", boardVO);
		
	}

	@Override
	public void deleteBoard(int id) {
		sqlSession.delete(namespace+".deleteBoard", id);
		
	}
	
}
