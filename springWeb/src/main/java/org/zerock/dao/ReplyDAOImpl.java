package org.zerock.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.ReplysVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "org.zerock.mapper.replyMapper";
	
	@Override
	public List<ReplysVO> listReply(int bid) {
		return sqlSession.selectList(namespace+".selectReplyList", bid);
	}


	@Override
	public void deleteReply(int id) {
		sqlSession.delete(namespace+".deleteReply", id);
	}


	@Override
	public void createReply(ReplysVO reply) {
		sqlSession.insert(namespace+".insertReply", reply);
		
	}

	@Override
	public void updteReply(ReplysVO reply) {
		sqlSession.update(namespace+".updateReply", reply);
	}

}
