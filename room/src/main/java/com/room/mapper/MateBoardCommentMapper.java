package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.room.dto.MateBoardComment;

@Mapper
public interface MateBoardCommentMapper {

	void insertBoardComment(MateBoardComment comment);

	List<MateBoardComment> selectByBoardNo(int boardNo);

	void delete(int commentNo);

	void update(MateBoardComment comment);

	MateBoardComment selectByCommentNo(int commentNo);
		
	void insertBoardReComment(MateBoardComment boardComment);
	
	void updateGroupNo(MateBoardComment boardComment);
	
	void updateStep(@Param("groupNo") int groupNo, @Param("step") int step);

}
