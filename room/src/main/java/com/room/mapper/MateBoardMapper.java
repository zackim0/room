package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.MateBoard;

@Mapper
public interface MateBoardMapper {

	void insertBoard(MateBoard board);

	List<MateBoard> selectAll();

	MateBoard selectByBoardNo(int boardNo);
	
	List<MateBoard> select3();

	void delete(int boardNo);
	
}
