package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
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
	public void addMessage(MessageVO msg) throws Exception {
		messageDAO.create(msg);						//�޽��� ����
		pointDAO.updatePoint(msg.getSender(), 10);	//�޽����� �� ���� ����Ʈ ����
	}

	@Override
	public MessageVO readMessage(String uid, int mno) throws Exception {
		messageDAO.updateState(mno);			//�޽����� ���� �ð� ������Ʈ
		pointDAO.updatePoint(uid, 5);			//�޽����� �������Ƿ� ����Ʈ ����
		return messageDAO.readMessage(mno);		//�޽��� ����
	}

}
