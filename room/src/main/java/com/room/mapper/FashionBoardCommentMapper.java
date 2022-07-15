package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.FBoardComment;

@Mapper
public interface FashionBoardCommentMapper {

	void insertBoardComment(FBoardComment comment);

	List<FBoardComment> selectByBoardNo(int boardNo);

	 void delete(int commentNo);

	void update(FBoardComment comment);
		



}
