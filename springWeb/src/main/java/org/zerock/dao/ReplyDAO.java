package org.zerock.dao;

import java.util.List;

import org.zerock.domain.ReplysVO;

public interface ReplyDAO {
	public List<ReplysVO> listReply(int bid);
	public void createReply(ReplysVO reply);
	public void deleteReply(int id);
	public void updteReply(ReplysVO reply);
}
