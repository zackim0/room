package com.room.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.room.dto.MateBoard;
	
public interface MateBoardService {


	void writeBoard(MateBoard board);

	List<MateBoard> findAll();

	MateBoard findByBoardNo(int boardNo);

	List<MateBoard> find3();

	void delete(int boardNo);

	void update(MateBoard board);

		
}


	

	

	
	




