package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.service.GIBoardService;
import com.room.dto.GIBoard;
import com.room.dto.GIBoardAttach;
import com.room.dto.GIBoardComment;
import com.room.dto.RecrultBoard;
import com.room.dto.RecrultBoardAttach;
import com.room.dto.RecrultBoardComment;
import com.room.mapper.GameIntroduceBoardCommentMapper;
import com.room.mapper.GameIntroduceBoardMapper;
import com.room.mapper.RecrultBoardCommentMapper;
import com.room.mapper.RecrultBoardMapper;

import lombok.Setter;

public class RecrultBoardServiceImpl implements RecrultBoardService {
	
	@Setter
	private RecrultBoardMapper recrultboardMapper;

	@Override
	public void writeBoard(RecrultBoard board) {

		recrultboardMapper.insertBoard(board);
		
		// 첨부파일 데이터를 DB에 저장
				if(board.getFiles() != null) {
					for (RecrultBoardAttach file : board.getFiles()	) {
						file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 boardNo 사용
						recrultboardMapper.insertBoardAttach(file);
					}
				}
	}

	@Override
	public List<RecrultBoard> findAll() {

		List<RecrultBoard> boardList = recrultboardMapper.selectAll();
		
		return boardList;
		
	}

	@Override
	public List<RecrultBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<RecrultBoard> boardList = recrultboardMapper.selectByRange(params);
		
		return boardList;
		
	}
	

	@Override
	public RecrultBoard findByBoardNo(int boardNo) {

		RecrultBoard board= recrultboardMapper.selectByBoardNo(boardNo);
		//첨부 파일 조회가 빠졌음
		
		List<RecrultBoardAttach> files = recrultboardMapper.selectBoardAttachByBoardNo(boardNo); // 첨부 파일 데이터 조회
		board.setFiles(files);
		
		recrultboardMapper.updateBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
		
	}

	@Override
	public void delete(int boardNo) {

		recrultboardMapper.delete(boardNo);
		
	}

	@Override
	public void update(RecrultBoard board) {

		recrultboardMapper.update(board);
		
	}

	@Override
	public int findBoardCount(String category) {
		
		int count = recrultboardMapper.selectBoardCount(category);
		
		return count;
	}
	
	@Override
	public RecrultBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		RecrultBoardAttach attach = recrultboardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}
	
	// private BoardCommentDao boardCommentDao = new BoardCommentDao();
	@Setter
	private RecrultBoardCommentMapper recrultboardCommentMapper;
	
	@Override
	public void writeBoardComment(RecrultBoardComment comment) {
		
		recrultboardCommentMapper.insertBoardComment(comment);
		
	}

	@Override
	public List<RecrultBoardComment> findCommentsByBoardNo(int boardNo) {
		List<RecrultBoardComment> comments = recrultboardCommentMapper.selectByBoardNo(boardNo);
		return comments;
	}

	@Override
	public void deleteComment(int commentNo) {
		recrultboardCommentMapper.delete(commentNo);
	}

	@Override
	public void updateBoardComment(RecrultBoardComment comment) {
		recrultboardCommentMapper.update(comment);
		
	}

	@Override
	public List<RecrultBoard> find3() {
		
		List<RecrultBoard> RecrultboardRecentList = recrultboardMapper.select3();
		
		return RecrultboardRecentList;
	}
	
	
}