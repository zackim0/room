package com.room.service;

import java.util.List;

import com.room.dto.MateBoard;
import com.room.dto.PetBoard;

public interface PetBoardService {

	List<PetBoard> findAll();

	void writeBoard(PetBoard board);

	PetBoard findByBoardNo(int boardNo);

	void delete(int boardNo);

	void update(PetBoard board);

}