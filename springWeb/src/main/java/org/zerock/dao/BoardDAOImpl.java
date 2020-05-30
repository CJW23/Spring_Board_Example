package org.zerock.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;

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

	@Override
	public List<BoardVO> listPage(CriteriaVO cri) {
		return sqlSession.selectList(namespace + ".selectPageBoardList", cri);
	}

	@Override
	public int totalBoardNum() {
		return sqlSession.selectOne(namespace+".totalNum");
	}

	@Override
	public List<BoardVO> searchBoardList(CriteriaVO cri) throws Exception {
		return sqlSession.selectList(namespace+".searchList", cri);
	}

	@Override
	public int searchBoardNum(CriteriaVO cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".searchListNum", cri);
	}
	
}
