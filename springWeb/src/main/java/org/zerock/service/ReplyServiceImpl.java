package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.dao.ReplyDAO;
import org.zerock.domain.ReplysVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	ReplyDAO replyDAO;
	
	@Override
	public List<ReplysVO> listReply(int bid) {
		return replyDAO.listReply(bid);
	}

	@Override
	public void addReply(ReplysVO reply) {
		replyDAO.createReply(reply);
		
	}

	@Override
	public void modifyReply(ReplysVO reply) {
		replyDAO.updteReply(reply);
	}

	@Override
	public void removeReply(int id) {
		replyDAO.deleteReply(id);
	}

}
