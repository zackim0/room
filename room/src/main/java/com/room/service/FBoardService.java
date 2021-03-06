package com.room.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.room.dto.FBoard;
import com.room.dto.FBoardAttach;
import com.room.dto.FBoardComment;
	
public interface FBoardService {


	void writeBoard(FBoard board);

	List<FBoard> findAll();

	FBoard findByBoardNo(int boardNo);

	void delete(int boardNo);

	List<FBoard> find3();

	void update(FBoard board);

	List<FBoard> findByPage(int pageNo, int pageSize);

	int findBoardCount(String category);

	FBoardAttach findBoardAttachByAttachNo(int attachNo);

	void writeBoardComment(FBoardComment comment);

	List<FBoardComment> findCommentsByBoardNo(int boardNo);

	void deleteComment(int commentNo);

	void updateBoardComment(FBoardComment boardComment);

}


	

	

	
	




