package com.room.service;

import java.util.List;

import com.room.dto.GIBoard;
import com.room.dto.GIBoardAttach;
// import com.room.dto.GIBoardComment;

public interface GIBoardService {

	void writeBoard(GIBoard board);
	List<GIBoard> findAll();
//	List<GIBoard> findByPage(int pageNo, int pageSize);
	GIBoard findByBoardNo(int boardNo);
	void delete(int boardNo);
	void update(GIBoard board);
//	int findBoardCount();
//	BoardAttach findBoardAttachByAttachNo(int attachNo);
	

//	void writeBoardComment(BoardComment comment);
//	List<BoardComment> findCommentsByBoardNo(int boardNo);
//	void deleteComment(int commentNo);
//	void updateBoardComment(BoardComment comment);
	
}
