package org.zerock.service;

import org.zerock.domain.MessageVO;

public interface MessageService {
	public void addMessage(MessageVO msg) throws Exception;
	public MessageVO readMessage(String uid, int mno) throws Exception;
}
