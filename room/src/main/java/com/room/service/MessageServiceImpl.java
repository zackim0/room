package com.room.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.room.dto.Member;
import com.room.dto.Message;
import com.room.mapper.MessageMapper;

import lombok.Setter;


public class MessageServiceImpl implements MessageService {
	@Setter
	private MessageMapper messageMapper;
	
	
	@Override
	public List<Message> findAll() {

		List<Message> messageList = messageMapper.selectAll();
		
		return messageList;
		
	}
	
	@Override
	public List<Message> findAll2() {
		
		List<Message> messageList2 = messageMapper.selectAll2();
		
		return messageList2;
	}


	@Override
	public int findMessageCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int findMessageCount2() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Member> findMemberList() {
		List<Member> memberList = messageMapper.selectMemberId();
		return memberList;
	}


	@Override
	public void writeMessage(Message message) {
		messageMapper.insertMessage(message);
	}


	@Override
	public void reciver(Member member) {
		messageMapper.receiver(member);
		
	}


	@Override
	public Message findByMessageNo(int message_No) {
		Message message = messageMapper.selectByMessageNo(message_No);
		return message;
	}

	


	

}
