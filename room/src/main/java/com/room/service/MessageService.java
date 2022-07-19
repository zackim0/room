package com.room.service;

import java.util.List;

import com.room.dto.Member;
import com.room.dto.Message;

public interface MessageService {

	List<Message> findAll();

	int findMessageCount();

	List<Member> findMemberList();

	void writeMessage(Message message);
	
	void reciver(Member member);

	Message findByMessageNo(int message_No);

}
