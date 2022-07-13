package com.room.service;

import java.util.List;

import com.room.dto.FBoard;
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
		
	}
	
	@Override
	public List<FBoard> findAll(){
		
		List<FBoard> fboardList = fBoardMapper.selectAll();
		return fboardList;
	}
	
	@Override
	public FBoard findByBoardNo(int boardNo) {
		
		FBoard board = fBoardMapper.selectByBoardNo(boardNo); // 게시물 데이터 조회
		
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
		
	public void update(FBoard board) {
		
		fBoardMapper.update(board);
		
	}

	
	

	

}
