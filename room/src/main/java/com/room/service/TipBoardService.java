package com.room.service;

import java.util.List;

import com.room.dto.TipBoard;
import com.room.dto.TipBoardAttach;
import com.room.dto.TipBoardComment;
	
public interface TipBoardService {

	void writeBoard(TipBoard board);
	List<TipBoard> findAll();
	List<TipBoard> find3();
	List<TipBoard> findByPage(int pageNo, int pageSize);
	TipBoard findByBoardNo(int boardNo);
	void delete(int boardNo);
	void update(TipBoard board);
	int findBoardCount(String category);
	TipBoardAttach findBoardAttachByAttachNo(int attachNo);
	
	
	void writeBoardComment(TipBoardComment comment);
	List<TipBoardComment> findCommentsByBoardNo(int boardNo);
	void deleteComment(int commentNo);
	void updateBoardComment(TipBoardComment comment);
	void writeBoardReComment(TipBoardComment boardComment);

		
}


	

	

	
	




