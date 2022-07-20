package com.room.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FBoard {
	// Board 테이블과 BoardAttach 테이블 사이의 1 : Many 관계를 구현한 필드 
	
	private List<FBoardAttach> attachments;
	
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	private String category;
	
		
	
	
	
	
}
