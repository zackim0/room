package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.room.dto.TipBoardComment;

@Mapper
public interface TipBoardCommentMapper {

	void insertBoardComment(TipBoardComment comment);

	List<TipBoardComment> selectByBoardNo(int boardNo);

	void delete(int commentNo);

	void update(TipBoardComment comment);

	TipBoardComment selectByCommentNo(int commentNo);
		
	void insertBoardReComment(TipBoardComment boardComment);
	
	void updateGroupNo(TipBoardComment boardComment);
	
	void updateStep(@Param("groupNo") int groupNo, @Param("step") int step);

}
