package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.MateBoardComment;

@Mapper
public interface MateBoardCommentMapper {

	void insertBoardComment(MateBoardComment comment);

	List<MateBoardComment> selectByBoardNo(int boardNo);

	void delete(int commentNo);

	void update(MateBoardComment comment);

}
