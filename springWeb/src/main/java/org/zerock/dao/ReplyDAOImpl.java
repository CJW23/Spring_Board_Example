package org.zerock.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.CriteriaVO;
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


	@Override
	public int totalReply(int bid) {
		return sqlSession.selectOne(namespace+".selectTotalReply", bid);
	}


	@Override
	public List<ReplysVO> listPageReply(int bid, CriteriaVO cri) {
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("cri", cri);
		mp.put("bid", bid);
		return sqlSession.selectList(namespace+".selectPageReplyList", mp);
	}


	@Override
	public void addReplyCount(int id) {
		sqlSession.update(namespace+".addReplyCount", id);
	}


	@Override
	public void minusReplyCount(int id) {
		sqlSession.update(namespace+".minusReplyCount", id);
		
	}
	
	
}
