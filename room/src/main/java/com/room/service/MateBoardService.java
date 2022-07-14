package com.room.service;

import java.util.List;

import com.room.dto.MateBoard;
	
public interface MateBoardService {

	void writeBoard(MateBoard board);
	List<MateBoard> findAll();
	List<MateBoard> find3();
	List<MateBoard> findByPage(int pageNo, int pageSize);
	MateBoard findByBoardNo(int boardNo);
	void delete(int boardNo);
	void update(MateBoard board);
	int findBoardCount(String category);

		
}


	

	

	
	




