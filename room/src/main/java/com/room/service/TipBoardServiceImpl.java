package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.dto.TipBoard;
import com.room.dto.TipBoardAttach;
import com.room.dto.TipBoardComment;
import com.room.mapper.TipBoardCommentMapper;
import com.room.mapper.TipBoardMapper;

import lombok.Setter;

public class TipBoardServiceImpl implements TipBoardService {
	
	@Setter
	private TipBoardMapper tipBoardMapper;
	
	@Override
	public void writeBoard(TipBoard board) {
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 boardNo : 없음
		// boardDao.insertBoard(board); // c1., c2. 를 반영해서 insertBoard에서 boardNo 조회하도록 구현 
		tipBoardMapper.insertBoard(board);
		// c2. 이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )
		
		if (board.getFiles() != null) {
			for (TipBoardAttach file : board.getFiles()) {
				file.setBoardNo(board.getBoardNo());
				tipBoardMapper.insertBoardAttach(file);
			}
		}
		
	}
	
	@Override
	public List<TipBoard> findAll(){
		
		List<TipBoard> tipBoardList = tipBoardMapper.selectAll();
		
		return tipBoardList;
	}
	
	@Override
	public TipBoard findByBoardNo(int boardNo) {
		
		TipBoard board = tipBoardMapper.selectByBoardNo(boardNo); // 게시물 데이터 조회
		
		List<TipBoardAttach> files = tipBoardMapper.selectBoardAttachByBoardNo(boardNo);
		board.setFiles(files);
		
		tipBoardMapper.updateBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
		
	}

	@Override
	public void delete(int boardNo) {
		
		tipBoardMapper.delete(boardNo);
	}

	@Override
	public List<TipBoard> find3() {
		
		List<TipBoard> tipBoardRecentList = tipBoardMapper.select3();
		
		return tipBoardRecentList;
	}

	@Override
	public void update(TipBoard board) {

		tipBoardMapper.update(board);
		
	}

	@Override
	public List<TipBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String,Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<TipBoard> tipBoardList = tipBoardMapper.selectByRange(params);
		
		return tipBoardList;
	}

	@Override
	public int findBoardCount(String category) {
		
		int count = tipBoardMapper.selectBoardCount(category);
		
		return count;
	}

	@Override
	public TipBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		TipBoardAttach attach = tipBoardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
		
	}

	@Setter
	private TipBoardCommentMapper tipBoardCommentMapper;
	
	@Override
	public void writeBoardComment(TipBoardComment comment) {
		
		tipBoardCommentMapper.insertBoardComment(comment);
		comment.setGroupNo(comment.getCommentNo()); // 생성된 댓글 번호를 그룹 번호로 사용
		tipBoardCommentMapper.updateGroupNo(comment);
		
	}

	@Override
	public List<TipBoardComment> findCommentsByBoardNo(int boardNo) {
		List<TipBoardComment> comments = tipBoardCommentMapper.selectByBoardNo(boardNo);
		return comments;
	}

	@Override
	public void deleteComment(int commentNo) {
		tipBoardCommentMapper.delete(commentNo);
	}

	@Override
	public void updateBoardComment(TipBoardComment comment) {
		tipBoardCommentMapper.update(comment);
		
	}

	@Override
	public void writeBoardReComment(TipBoardComment boardComment) {
		// 댓글의 대상글 정보 조회
		TipBoardComment parentComment =
			tipBoardCommentMapper.selectByCommentNo(boardComment.getCommentNo());
		boardComment.setGroupNo(parentComment.getGroupNo());
		boardComment.setDepth(parentComment.getDepth() + 1);
		boardComment.setStep(parentComment.getStep() + 1);
		tipBoardCommentMapper.insertBoardReComment(boardComment);
		
	}

}
