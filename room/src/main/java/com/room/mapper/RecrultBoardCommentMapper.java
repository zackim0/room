package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.room.dto.RecrultBoard;
import com.room.dto.RecrultBoardAttach;
import com.room.dto.RecrultBoardComment;

@Mapper
public interface RecrultBoardCommentMapper {

	void insertBoardComment(RecrultBoardComment comment);
	
	List<RecrultBoardComment> selectByBoardNo(int boardNo);
	
	void delete(int commentNo);
	
	void update(RecrultBoardComment comment);
	
	

}