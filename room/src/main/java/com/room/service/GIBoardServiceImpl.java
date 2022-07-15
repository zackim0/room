package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.service.GIBoardService;
import com.room.dto.GIBoard;
import com.room.dto.GIBoardAttach;
import com.room.dto.GIBoardComment;
import com.room.mapper.GameIntroduceBoardCommentMapper;
import com.room.mapper.GameIntroduceBoardMapper;

import lombok.Setter;

public class GIBoardServiceImpl implements GIBoardService {
	
	@Setter
	private GameIntroduceBoardMapper gIboardMapper;

	@Override
	public void writeBoard(GIBoard board) {

		gIboardMapper.insertBoard(board);
		
		// 첨부파일 데이터를 DB에 저장
				if(board.getFiles() != null) {
					for (GIBoardAttach file : board.getFiles()	) {
						file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 boardNo 사용
						gIboardMapper.insertBoardAttach(file);
					}
				}
	}

	@Override
	public List<GIBoard> findAll() {

		List<GIBoard> boardList = gIboardMapper.selectAll();
		
		return boardList;
		
	}

	@Override
	public List<GIBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<GIBoard> boardList = gIboardMapper.selectByRange(params);
		
		return boardList;
		
	}
	

	@Override
	public GIBoard findByBoardNo(int boardNo) {

		GIBoard board= gIboardMapper.selectByBoardNo(boardNo);
		//첨부 파일 조회가 빠졌음
		
		List<GIBoardAttach> files = gIboardMapper.selectBoardAttachByBoardNo(boardNo); // 첨부 파일 데이터 조회
		board.setFiles(files);
		
		gIboardMapper.updateBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
		
	}

	@Override
	public void delete(int boardNo) {

		gIboardMapper.delete(boardNo);
		
	}

	@Override
	public void update(GIBoard board) {

		gIboardMapper.update(board);
		
	}

	@Override
	public int findBoardCount(String category) {
		
		int count = gIboardMapper.selectBoardCount(category);
		
		return count;
	}
	
	@Override
	public GIBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		GIBoardAttach attach = gIboardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}
	
	// private BoardCommentDao boardCommentDao = new BoardCommentDao();
	@Setter
	private GameIntroduceBoardCommentMapper gIboardCommentMapper;
	
	@Override
	public void writeBoardComment(GIBoardComment comment) {
		
		gIboardCommentMapper.insertBoardComment(comment);
		
	}

	@Override
	public List<GIBoardComment> findCommentsByBoardNo(int boardNo) {
		List<GIBoardComment> comments = gIboardCommentMapper.selectByBoardNo(boardNo);
		return comments;
	}

	@Override
	public void deleteComment(int commentNo) {
		gIboardCommentMapper.delete(commentNo);
	}

	@Override
	public void updateBoardComment(GIBoardComment comment) {
		gIboardCommentMapper.update(comment);
		
	}
	
	
}