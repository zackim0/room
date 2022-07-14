package com.room.dto;

import java.util.List;

import lombok.Data;

@Data
public class GIBoard {
	private int boardNo;
	private String nickname;
	private String category;
	private String title;
	private String content;
	private String regDate;
	private int readcount;
	private boolean deleted;
	private String writer;
	
	// Board 테이블과 BoardAttach 테이블 사이의 1 : Many 관계를 구현한 필드
//	private List<FBoardAttach> files;
	
}
