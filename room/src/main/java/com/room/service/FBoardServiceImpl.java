package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.dto.FBoard;
import com.room.dto.FBoardAttach;
import com.room.dto.FBoardComment;
import com.room.mapper.FashionBoardCommentMapper;
import com.room.mapper.FashionBoardMapper;

import lombok.Setter;

public class FBoardServiceImpl implements FBoardService {
	
	@Setter
	private FashionBoardMapper fBoardMapper;
	

	@Override
	public void writeBoard(FBoard board) {
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 boardNo : 없음
		// boardDao.insertBoard(board); // c1., c2. 를 반영해서 insertBoard에서 boardNo 조회하도록 구현 
		fBoardMapper.insertBoard(board);
		// c2. 이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )
		
		// 첨부파일 데이터를 DB에 저장
		if(board.getFiles() != null) {
			for (FBoardAttach file : board.getFiles()	) {
				file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 boardNo 사용
				fBoardMapper.insertBoardAttach(file);
			}
		}
	}
	
	@Override
	public List<FBoard> findAll(){
		
		List<FBoard> fboardList = fBoardMapper.selectAll();
		return fboardList;
	}
	
	@Override
	public FBoard findByBoardNo(int boardNo) {
		
		FBoard board = fBoardMapper.selectByBoardNo(boardNo); // 게시물 데이터 조회
		
		List<FBoardAttach> files = fBoardMapper.selectBoardAttachByBoardNo(boardNo); // 첨부 파일 데이터 조회
		
		board.setFiles(files);
		
		return board;

		
	}

	@Override
	public void delete(int boardNo) {
		
		fBoardMapper.delete(boardNo);
	}

	@Override
	public List<FBoard> find3() {
		
		List<FBoard> fboardRecentList = fBoardMapper.select3();
		return fboardRecentList;
	}
	
	@Override
	public void update(FBoard board) {
		
		fBoardMapper.update(board);
		
	}

	@Override
	public List<FBoard> findByPage(int pageNo, int pageSize) {
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String,Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<FBoard> fboardList = fBoardMapper.selectByRange(params);
		
		return fboardList;
	}

	@Override
	public int findBoardCount() {
		int count = fBoardMapper.selectBoardCount();
		return count;
	}

	
	@Override
	public FBoardAttach findBoardAttachByAttachNo(int attachNo) {
		FBoardAttach attach = fBoardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}

	@Setter
	private FashionBoardCommentMapper boardCommentMapper;


	@Override
	public void writeBoardComment(FBoardComment comment) {
		
		boardCommentMapper.insertBoardComment(comment);
		
	}
	
	
	

	

}
