package com.room.service;

import java.util.List;

import com.room.dto.PetBoard;
import com.room.mapper.PetBoardMapper;

import lombok.Setter;

public class PetBoardServiceImpl implements PetBoardService {
	
	@Setter
	private PetBoardMapper petBoardMapper;
	
	@Override
	public List<PetBoard> findAll() {
		List<PetBoard> petBoardList = petBoardMapper.selectAll();
		return petBoardList;
	}
	
	@Override
	public void writeBoard(PetBoard board) {
		petBoardMapper.insertBoard(board);
	}
	
	@Override
	public PetBoard findByBoardNo(int boardNo) {
	  PetBoard board = petBoardMapper.selectByBoardNo(boardNo);
	  
	  return board;
	}
	
	@Override
	public void delete(int boardNo) {

		petBoardMapper.delete(boardNo);
	}
	
	@Override
	public void update(PetBoard board) {
		petBoardMapper.update(board);
	}


}
