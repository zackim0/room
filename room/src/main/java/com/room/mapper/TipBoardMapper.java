package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.TipBoard;
import com.room.dto.TipBoardAttach;

@Mapper
public interface TipBoardMapper {

	void insertBoard(TipBoard board);

	List<TipBoard> selectAll();

	List<TipBoard> select3();

	List<TipBoard> selectByRange(HashMap<String, Object> params);

	TipBoard selectByBoardNo(int boardNo);
	
	void delete(int boardNo);

	void update(TipBoard board);
	
	int selectBoardCount(String category);

	void updateBoardReadCount(int boardNo);

	void insertBoardAttach(TipBoardAttach file);

	List<TipBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	TipBoardAttach selectBoardAttachByAttachNo(int attachNo);
	
	
}
