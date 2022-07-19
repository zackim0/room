package com.room.service;

import java.util.List;

import com.room.dto.MateBoard;
import com.room.dto.MateBoardAttach;
import com.room.dto.MateBoardComment;
	
public interface MateBoardService {

	void writeBoard(MateBoard board);
	List<MateBoard> findAll();
	List<MateBoard> find3();
	List<MateBoard> findByPage(int pageNo, int pageSize);
	MateBoard findByBoardNo(int boardNo);
	void delete(int boardNo);
	void update(MateBoard board);
	int findBoardCount(String category);
	MateBoardAttach findBoardAttachByAttachNo(int attachNo);
	
	
	void writeBoardComment(MateBoardComment comment);
	List<MateBoardComment> findCommentsByBoardNo(int boardNo);
	void deleteComment(int commentNo);
	void updateBoardComment(MateBoardComment comment);
	void writeBoardReComment(MateBoardComment boardComment);

		
}


	

	

	
	




