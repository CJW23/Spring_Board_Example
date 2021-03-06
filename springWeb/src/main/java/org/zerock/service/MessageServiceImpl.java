package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.dao.MessageDAO;
import org.zerock.dao.PointDAO;
import org.zerock.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	@Inject
	MessageDAO messageDAO;
	
	@Inject
	PointDAO pointDAO;
	
	@Override
	@Transactional
	public void addMessage(MessageVO msg) throws Exception {
		messageDAO.create(msg);						//메시지 저장
		pointDAO.updatePoint(msg.getSender(), 10);	//메시지를 쓴 유저 포인트 적용
	}

	@Override
	public MessageVO readMessage(String uid, int mno) throws Exception {
		messageDAO.updateState(mno);			//메시지를 읽은 시간 업데이트
		pointDAO.updatePoint(uid, 5);			//메시지를 릭었으므로 포인트 적용
		return messageDAO.readMessage(mno);		//메시지 내용
	}

}
