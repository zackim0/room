package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.FBoard;

@Mapper
public interface FashionBoardMapper {

	void insertBoard(FBoard board);

	List<FBoard> selectAll();

	FBoard selectByBoardNo(int boardNo);

	void delete(int boardNo);

	List<FBoard> select3();

	void update(FBoard board);
	
}
