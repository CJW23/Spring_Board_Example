package org.zerock.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplysVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ReplyDAOTest {
	@Inject
	ReplyDAO replyDAO;
	
	//@Test
	public void insertReplyTest() {
		ReplysVO reply = new ReplysVO();
		reply.setBid(15);
		reply.setReplytext("awdadwad");
		reply.setReplyer("zzz");
		replyDAO.createReply(reply);
	}
	
	//@Test
	public void selectReplyListTest() {
		List<ReplysVO> list = replyDAO.listReply(15);
		for (ReplysVO replysVO : list) {
			System.out.println(replysVO.toString());
		}
	}
	
	//@Test
	public void updateReplyTest() {
		ReplysVO reply = new ReplysVO();
		reply.setId(2);
		reply.setReplytext("update");
		replyDAO.updteReply(reply);
	}
	@Test
	public void deleteReplyTest() {
		replyDAO.deleteReply(2);
	}
	
}
