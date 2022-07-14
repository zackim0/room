package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.dto.MateBoard;
import com.room.mapper.MateBoardMapper;

import lombok.Setter;

public class MateBoardServiceImpl implements MateBoardService {
	
	@Setter
	private MateBoardMapper mateBoardMapper;
	
	@Override
	public void writeBoard(MateBoard board) {
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 boardNo : 없음
		// boardDao.insertBoard(board); // c1., c2. 를 반영해서 insertBoard에서 boardNo 조회하도록 구현 
		mateBoardMapper.insertBoard(board);
		// c2. 이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )
		
	}
	
	@Override
	public List<MateBoard> findAll(){
		
		List<MateBoard> mateBoardList = mateBoardMapper.selectAll();
		
		return mateBoardList;
	}
	
	@Override
	public MateBoard findByBoardNo(int boardNo) {
		
		MateBoard board = mateBoardMapper.selectByBoardNo(boardNo); // 게시물 데이터 조회
		
		mateBoardMapper.updateBoardReadCount(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
		
	}

	@Override
	public void delete(int boardNo) {
		
		mateBoardMapper.delete(boardNo);
	}

	@Override
	public List<MateBoard> find3() {
		
		List<MateBoard> mateBoardRecentList = mateBoardMapper.select3();
		
		return mateBoardRecentList;
	}

	@Override
	public void update(MateBoard board) {

		mateBoardMapper.update(board);
		
	}

	@Override
	public List<MateBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String,Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<MateBoard> mateBoardList = mateBoardMapper.selectByRange(params);
		
		return mateBoardList;
	}

	@Override
	public int findBoardCount(String category) {
		
		int count = mateBoardMapper.selectBoardCount(category);
		
		return count;
	}

	

}
