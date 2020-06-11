package org.zerock.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.MessageMapper";
	
	@Override
	public void create(MessageVO msg) throws Exception {
		session.insert(namespace+".create", msg);
		
	}

	@Override
	public MessageVO readMessage(int mno) throws Exception {
		return session.selectOne(namespace+".readMessage", mno);
	}

	@Override
	public void updateState(int mno) throws Exception {
		session.update(namespace+".updateState", mno);
		
	}

}
