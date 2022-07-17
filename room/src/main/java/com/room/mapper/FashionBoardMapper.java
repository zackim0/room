package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.FBoard;
import com.room.dto.FBoardAttach;
import com.room.dto.FBoardComment;

@Mapper
public interface FashionBoardMapper {

	void insertBoard(FBoard board);

	List<FBoard> selectAll();

	FBoard selectByBoardNo(int boardNo);

	void delete(int boardNo);

	List<FBoard> select3();

	void update(FBoard board);

	List<FBoard> selectByRange(HashMap<String, Object> params);

	int selectBoardCount(String category);

	List<FBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	void insertBoardAttach(FBoardAttach file);

	FBoardAttach selectBoardAttachByAttachNo(int attachNo);

	
	
}
