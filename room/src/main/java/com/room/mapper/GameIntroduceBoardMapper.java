package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.GIBoard;

@Mapper
public interface GameIntroduceBoardMapper {
	
	void insertBoard(GIBoard board);
	
	List<GIBoard> selectAll();
	
	GIBoard selectByBoardNo(int boardNo);
	
	void delete(int boardNo);
	
}
