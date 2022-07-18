package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.RecrultBoard;
import com.room.dto.RecrultBoardAttach;

@Mapper
public interface RecrultBoardMapper {
	
	void insertBoard(RecrultBoard board);
	
	List<RecrultBoard> selectAll();
	
	RecrultBoard selectByBoardNo(int boardNo);
	
	List<RecrultBoard> selectByRange(HashMap<String, Object> params);
	
	void delete(int boardNo);
	
	void update(RecrultBoard board);

	void updateBoardReadCount(int boardNo);

	int selectBoardCount(String category);
	
	List<RecrultBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	void insertBoardAttach(RecrultBoardAttach file);

	RecrultBoardAttach selectBoardAttachByAttachNo(int attachNo);

	List<RecrultBoard> select3();
	
}
