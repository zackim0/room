package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.room.dto.GIBoard;
import com.room.dto.GIBoardAttach;
import com.room.dto.GIBoardComment;

@Mapper
public interface GameIntroduceBoardCommentMapper {

	void insertBoardComment(GIBoardComment comment);
	
	List<GIBoardComment> selectByBoardNo(int boardNo);
	
	void delete(int commentNo);
	
	void update(GIBoardComment comment);
	
	

}