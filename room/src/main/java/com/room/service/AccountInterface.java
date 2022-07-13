package com.room.service;

import com.room.dto.Member;
import com.room.mapper.MemberMapper;

public interface AccountInterface {

	void setMemberMapper(MemberMapper memberMapper);

	void registerMember(Member member);

	Member findMemberByIdAndPasswd(Member member);
	
	void  delete(Member memberId);
	void update(Member member);

}