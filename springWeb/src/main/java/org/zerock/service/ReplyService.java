package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReplysVO;

public interface ReplyService {
	public List<ReplysVO> listReply(int bid);
	public void addReply(ReplysVO reply);
	public void modifyReply(ReplysVO reply);
	public void removeReply(int id);
}
