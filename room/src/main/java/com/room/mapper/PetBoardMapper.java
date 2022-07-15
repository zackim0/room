package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.MateBoardAttach;
import com.room.dto.PetBoard;
import com.room.dto.PetBoardAttach;

@Mapper
public interface PetBoardMapper {

	List<PetBoard> selectAll();

	void insertBoard(PetBoard board);

	
	PetBoard selectByBoardNo(int boardNo); 
	
	void delete(int boardNo);
	
	void update(PetBoard board);

	void updateBoardReadCount(int boardNo);

	List<PetBoard> selectByRange(HashMap<String, Object> params);

	int selectBoardCount(String category);

	void insertBoardAttach(PetBoardAttach file);

	List<PetBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	PetBoardAttach selectBoardAttachByAttachNo(int attachNo);

}
