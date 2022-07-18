package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;

@Mapper
public interface CookBoardMapper {

	void insertBoard(CKBoard board);
	
    List<CKBoard> selectAll();
      
	CKBoard selectByBoardNo(int boardNo);

	void delete(int boardNo);

	List<CKBoard> selcet3();

	void insertBoardAttach(CKBoardAttach BoardAttach);

	List<CKBoardAttach> selectBoardAttachByBoardNo(int boardNo);

	void updateBoardReadCount(int boardNo);

	List<CKBoard> selectByRange(HashMap<String, Object> params);

	CKBoardAttach selectBoardAttachByAttachNo(int attachNo);

	int selectBoardCount(String category);

	void update(CKBoard board);

}
