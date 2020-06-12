package org.zerock.dao;

import java.util.List;

import org.zerock.domain.CriteriaVO;
import org.zerock.domain.ReplysVO;

public interface ReplyDAO {
	public List<ReplysVO> listReply(int bid);
	public void createReply(ReplysVO reply);
	public void deleteReply(int id);
	public void updteReply(ReplysVO reply);
	public int totalReply(int bid);
	public List<ReplysVO> listPageReply(int bid, CriteriaVO cri);
	public void addReplyCount(int id);
	public void minusReplyCount(int id);
}
