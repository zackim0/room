package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.MateBoard;
import com.room.dto.MateBoardAttach;

@Mapper
public interface MateBoardMapper {

	void insertBoard(MateBoard board);

	List<MateBoard> selectAll();

	List<MateBoard> select3();

	List<MateBoard> selectByRange(HashMap<String, Object> params);

	MateBoard selectByBoardNo(int boardNo);
	
	void delete(int boardNo);

	void update(MateBoard board);
	
	int selectBoardCount(String category);

	void updateBoardReadCount(int boardNo);

	void insertBoardAttach(MateBoardAttach file);

	List<MateBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	MateBoardAttach selectBoardAttachByAttachNo(int attachNo);
	
	
}
