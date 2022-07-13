package com.room.service;

import java.util.List;



import com.room.dto.CKBoard;


public interface CKBoardService {

	List<CKBoard> findAll();

	CKBoard findByBoardNo(int board_no);

	void writeBoard(CKBoard ckboard);

}
