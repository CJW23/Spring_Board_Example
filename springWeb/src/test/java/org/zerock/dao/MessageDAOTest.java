package org.zerock.dao;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MessageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MessageDAOTest {
	@Inject
	MessageDAO dao;
	
	@Test
	public void createTest() throws Exception {
		MessageVO vo = new MessageVO();
		vo.setTargetid("user0");
		vo.setSender("user1");
		vo.setMessage("awdwad");
		dao.create(vo);
	}
	
	@Test
	public void readMessageTest() throws Exception{
		System.out.println(dao.readMessage(1).getMessage());
	}
	
	@Test
	public void updateMessageTest() throws Exception{
		dao.updateState(1);
	}
}
