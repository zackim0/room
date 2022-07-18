package com.room.service;

import java.util.List;

import com.room.dto.RecrultBoard;
import com.room.dto.RecrultBoardComment;
import com.room.dto.RecrultBoardAttach;

public interface RecrultBoardService {

	void writeBoard(RecrultBoard board);
	
	List<RecrultBoard> findAll();
	
	List<RecrultBoard> find3();
	
	List<RecrultBoard> findByPage(int pageNo, int pageSize);
	
	RecrultBoard findByBoardNo(int boardNo);
	
	void delete(int boardNo);
	
	void update(RecrultBoard board);
	
	int findBoardCount(String category);
	
	RecrultBoardAttach findBoardAttachByAttachNo(int attachNo);
	
	

	void writeBoardComment(RecrultBoardComment comment);
	
	List<RecrultBoardComment> findCommentsByBoardNo(int boardNo);
	
	void deleteComment(int commentNo);
	
	void updateBoardComment(RecrultBoardComment comment);
	
}
