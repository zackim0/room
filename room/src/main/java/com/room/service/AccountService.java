package com.room.service;

import com.room.common.Util;
import com.room.dto.Member;
import com.room.mapper.MemberMapper;

import lombok.Setter;

public class AccountService implements AccountInterface {

	@Setter
	private MemberMapper memberMapper;
	
	@Override
	public void registerMember(Member member) {
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256");
		member.setPasswd(passwd);
		
		memberMapper.insertMember(member);

	}
	
	@Override
	public Member findMemberByIdAndPasswd(Member member) {		
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256");
		member.setPasswd(passwd);
		
		Member member2 = memberMapper.selectMemberByIdAndPasswd(member);	
		return member2;
	}


	public void delete(Member memberId) {

		memberMapper.delete(memberId);
		
	}

	public void update(Member member) {
		memberMapper.update(member);
		
	}



}
