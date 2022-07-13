package com.room.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FBoard {
	
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	
	
	
}
