package org.zerock.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "org.zerock.mapper.PointMapper";
	
	@Override
	public void updatePoint(String uid, int point) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("point", point);
		session.update(namespace+".updatePoint", param);
	}

}
