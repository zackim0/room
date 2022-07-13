package com.room.service;

import java.util.List;

import com.room.dto.CKBoard;
import com.room.mapper.CookBoardMapper;

import lombok.Setter;

public class CKBoardServiceImpl implements CKBoardService {
	
	@Setter
	private CookBoardMapper cookBoardMapper;
	
	
	@Override
	public List<CKBoard> findAll(){
		
		List<CKBoard> ckboardList = cookBoardMapper.selectAll();
		
		return ckboardList;
	}

	@Override
	public CKBoard findByBoardNo(int board_no) {
		
		CKBoard ckboard = cookBoardMapper.selectByBoardNo(board_no);
		
		return ckboard;
	}
	@Override
	public void writeBoard(CKBoard ckboard) {
		cookBoardMapper.insertBoard(ckboard);
		
	}
	
	
}
