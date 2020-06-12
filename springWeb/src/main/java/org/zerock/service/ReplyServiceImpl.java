package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.dao.ReplyDAO;
import org.zerock.domain.CriteriaVO;
import org.zerock.domain.ReplysVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	ReplyDAO replyDAO;
	
	@Override
	public List<ReplysVO> listReply(int bid) {
		return replyDAO.listReply(bid);
	}

	@Transactional
	@Override
	public void addReply(ReplysVO reply) {
		replyDAO.createReply(reply);
		replyDAO.addReplyCount(reply.getBid());
	}

	@Override
	public void modifyReply(ReplysVO reply) {
		replyDAO.updteReply(reply);
	}
	
	@Transactional
	@Override
	public void removeReply(int id) {
		replyDAO.minusReplyCount(id);
		replyDAO.deleteReply(id);
	}

	@Override
	public int totalReply(int bid) {
		return replyDAO.totalReply(bid);
	}

	@Override
	public List<ReplysVO> listPageReply(int bid, CriteriaVO cri) {
		return replyDAO.listPageReply(bid, cri);
	}

}
