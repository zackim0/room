package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.Member;
import com.room.dto.Message;

@Mapper
public interface MessageMapper {

	List<Message> selectAll();

	List<Member> selectMemberId();

	void insertMessage(Message message);

}
