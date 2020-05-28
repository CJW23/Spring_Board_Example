package org.zerock.dao;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.dao.MemberDAO;
import org.zerock.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberDAOTest {
	@Inject
	private MemberDAO dao;
	
	@Test
	public void test()throws Exception{
		MemberVO tmp = dao.readWithPW("ad", "asd");
		System.out.println(tmp.toString());
	}
	
	
	public void testInsert()throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setUserid("user1");
		memberVO.setUserpw("123");
		memberVO.setUsername("user");
		memberVO.setEmail("zxc");
		
		dao.insertMember(memberVO);
	}
	
}
