package com.room.mapper;
import org.apache.ibatis.annotations.Mapper;
import com.room.dto.Member;

@Mapper
public interface MemberMapper {

	void insertMember(Member member);
	Member selectMemberByIdAndPasswd(Member member);
	void delete(Member memberId);
	void update(Member member);
}