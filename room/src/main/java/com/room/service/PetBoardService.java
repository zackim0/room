package com.room.service;

import java.util.List;

import com.room.dto.MateBoard;
import com.room.dto.PetBoard;
import com.room.dto.PetBoardAttach;

public interface PetBoardService {

	List<PetBoard> findAll();

	void writeBoard(PetBoard board);

	PetBoard findByBoardNo(int boardNo);

	void delete(int boardNo);

	void update(PetBoard board);

	List<PetBoard> findByPage(int pageNo, int pageSize);

	int findBoardCount(String string);

	PetBoardAttach findBoardAttachByAttachNo(int attachNo);

}