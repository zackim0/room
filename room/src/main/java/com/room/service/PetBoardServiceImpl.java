package com.room.service;

import java.util.HashMap;
import java.util.List;

import com.room.dto.MateBoard;
import com.room.dto.MateBoardAttach;
import com.room.dto.PetBoard;
import com.room.dto.PetBoardAttach;
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
		
		if(board.getFiles() != null) {
			for(PetBoardAttach file : board.getFiles()) {
				file.setBoardNo(board.getBoardNo());
				petBoardMapper.insertBoardAttach(file);
			}
		}
	}
	
	@Override
	public PetBoard findByBoardNo(int boardNo) {
	  PetBoard board = petBoardMapper.selectByBoardNo(boardNo);
	  
	  List<PetBoardAttach> files = petBoardMapper.selectBoardAttachByBoardNo(boardNo);
	  board.setFiles(files);
	  
	  petBoardMapper.updateBoardReadCount(boardNo);
	  board.setReadCount(board.getReadCount() + 1);
	  
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
	
	@Override
	public List<PetBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		HashMap<String,Object> params = new HashMap<>();
		params.put("from", from);
		params.put("count", count);
		
		List<PetBoard> mateBoardList = petBoardMapper.selectByRange(params);
		
		return mateBoardList;
	}

	@Override
	public int findBoardCount(String category) {		
		int count = petBoardMapper.selectBoardCount(category);	
		return count;
	}
	
	@Override
	public PetBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		PetBoardAttach attach = petBoardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
		
	}

	@Override
	public List<PetBoard> find3() {
		List<PetBoard> petBoardRecentList = petBoardMapper.select3();
		
		return petBoardRecentList;
	}
	
	
	
	


}
