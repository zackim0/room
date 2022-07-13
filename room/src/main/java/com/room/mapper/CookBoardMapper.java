package com.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.CKBoard;

@Mapper
public interface CookBoardMapper {

	void insertBoard(CKBoard ckboard);
	
    List<CKBoard> selectAll();
      
	CKBoard selectByBoardNo(int board_no);

}
