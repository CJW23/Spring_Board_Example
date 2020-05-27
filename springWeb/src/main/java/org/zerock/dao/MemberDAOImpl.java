package org.zerock.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "org.zerock.mapper.MemberMapper";
	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace+".getTime");	//XML의 getTime id를 가진 query 실
	}
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(namespace+".insertMember", vo);
		
	}
	@Override
	public MemberVO readMember(String userid) throws Exception {
		return sqlSession.selectOne(namespace+".readMember", userid);
	}
	@Override
	public MemberVO readWithPW(String userid, String userpw) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("userpw", userpw);
		return sqlSession.selectOne(namespace+".readWithPW", paramMap);
	}
	
}
