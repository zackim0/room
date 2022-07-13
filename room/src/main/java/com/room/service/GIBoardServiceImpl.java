package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.service.GIBoardService;
import com.room.dto.GIBoard;
import com.room.mapper.GameIntroduceBoardMapper;
import com.room.dao.GIBoardDao;
import com.room.dto.GIBoard;

import lombok.Setter;

public class GIBoardServiceImpl implements GIBoardService {
	
	@Setter
	private GameIntroduceBoardMapper gIboardMapper;

	@Override
	public void writeBoard(GIBoard board) {


		gIboardMapper.insertBoard(board);
		
		
	}

	@Override
	public List<GIBoard> findAll() {

		List<GIBoard> boardList = gIboardMapper.selectAll();
		return boardList;
		
	}

//	@Override
//	public List<GIBoard> findByPage(int pageNo, int pageSize) {
//		int from = (pageNo - 1) * pageSize;
//		int count = pageSize;
//		
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("from", from);
//		params.put("count", count);
//		
//		// List<Board> boardList = boardDao.selectByRange(params);
//		List<GIBoard> boardList = GIboardMapper.selectByRange(params);
//		
//		return boardList;
//		
//		return null;
//	}

	@Override
	public GIBoard findByBoardNo(int boardNo) {

		GIBoard board= gIboardMapper.selectByBoardNo(boardNo);
		
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

//	@Override
//	public int findBoardCount() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
	
}