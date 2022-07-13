package com.room.dto;

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
	
}
