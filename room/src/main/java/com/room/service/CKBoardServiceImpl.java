package com.room.service;

import java.util.HashMap;
import java.util.List;


import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;
import com.room.dto.CKBoardComment;
import com.room.mapper.CookBoardCommentMapper;
import com.room.mapper.CookBoardMapper;

import lombok.Setter;

public class CKBoardServiceImpl implements CKBoardService {
	
	@Setter
	private CookBoardMapper cookBoardMapper;
	
	
	@Override
	public List<CKBoard> findAll(){
		
		List<CKBoard> cookboardList = cookBoardMapper.selectAll();
		
		
		return cookboardList;
	}
	
	@Override
	public List<CKBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		
		List<CKBoard> cookboardList = cookBoardMapper.selectByRange(params);
		
		return cookboardList;
	}

	@Override
	public CKBoard findByBoardNo(int boardNo) {
		
		
		CKBoard board = cookBoardMapper.selectByBoardNo(boardNo); // 게시물 데이터 조회
		
		
		List<CKBoardAttach> files = cookBoardMapper.selectBoardAttachByBoardNo(boardNo);	// 첨부 파일 데이터 조회
		board.setFiles(files);
		
		// boardDao.updateBoardReadCount(boardNo);
		cookBoardMapper.updateBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
	}
	@Override
	public void writeBoard(CKBoard board) {
		cookBoardMapper.insertBoard(board);
		
		if (board.getFiles() != null) {
			for (CKBoardAttach file : board.getFiles()) {
				file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 boardNo 사용
				// boardDao.insertBoardAttach(file);
				cookBoardMapper.insertBoardAttach(file);
			}
		}
		
	}
	@Override
	public CKBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		CKBoardAttach attach = cookBoardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}
	
	@Override
	public void delete(int boardNo) {
		
	
		cookBoardMapper.delete(boardNo);
		
	}
	@Override
	public void update(CKBoard board) {

		
		cookBoardMapper.update(board);
		
	}
	@Override
	public List<CKBoard> find3(){
		List<CKBoard> ckboardRecentList = cookBoardMapper.selcet3();
		return ckboardRecentList;
	}
	
	@Override
	public int findBoardCount(String category) {
		
		int count = cookBoardMapper.selectBoardCount(category);
		return count;
	}
	
	@Setter
	private CookBoardCommentMapper cookBoardCommentMapper;
	
	@Override
	public void writeBoardComment(CKBoardComment comment) {
		
		cookBoardCommentMapper.insertBoardComment(comment);
		
	}

	@Override
	public List<CKBoardComment> findCommentsByBoardNo(int boardNo) {
		List<CKBoardComment> comments = cookBoardCommentMapper.selectByBoardNo(boardNo);
		return comments;
	}

	@Override
	public void deleteComment(int commentNo) {
		cookBoardCommentMapper.delete(commentNo);
	}

	@Override
	public void updateBoardComment(CKBoardComment comment) {
		cookBoardCommentMapper.update(comment);
		
	}
	
}
