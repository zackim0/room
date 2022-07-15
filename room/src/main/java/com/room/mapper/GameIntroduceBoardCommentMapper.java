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

	void insertBoardComment(GIBoardComment boardComment);
	List<GIBoardComment> selectByBoardNo(int boardNo);
	List<GIBoardComment> selectRangeByBoardNo(@Param("boardNo")int boardNo, @Param("from")int from, @Param("count")int count);
	int selectCommentCount();
	void delete(int commentNo);
	void update(GIBoardComment boardComment);
	
	

}