package org.zerock.aop;

public interface MessageDAO {
	public void create(MessageVO msg) throws Exception;
	public MessageVO readMessage(int mno) throws Exception;
	public void updateState(int mno) throws Exception;
	
}
