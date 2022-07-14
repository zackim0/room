package com.room.service;

import java.util.List;



import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;
import com.room.dto.CKBoardComment;


public interface CKBoardService {

	List<CKBoard> findAll();

	CKBoard findByBoardNo(int boardNo);

	void writeBoard(CKBoard board);

	void delete(int boardNo);

	List<CKBoard> find3();

	List<CKBoard> findByPage(int pageNo, int pageSize);

	
	int findBoardCount();

	CKBoardAttach findBoardAttachByAttachNo(int attachNo);

	void update(CKBoard board);

	void writeBoardComment(CKBoardComment comment);
	List<CKBoardComment> findCommentsByBoardNo(int boardNo);
	void deleteComment(int commentNo);
	void updateBoardComment(CKBoardComment comment);
}
