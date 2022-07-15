package com.room.dto;

import java.util.Date;

import lombok.Data;

	@Data

	public class MateBoardComment {
	 
	private int commentNo;
	private int boardNo;
	private String writer;
	private String content;
	private Date regDate;
	private boolean deleted;
	
	private int groupNo;
	private int step;
	private int depth;
	
}
