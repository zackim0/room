package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.Member;
import com.room.dto.Message;

@Mapper
public interface MessageMapper {

	List<Message> selectAll();
	
	List<Message> selectAll2();

	List<Member> selectMemberId();

	void insertMessage(Message message);

	void receiver(Member member);

	Message selectByMessageNo(int message_No);

	

}
