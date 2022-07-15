package com.room.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MateBoard {
	
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	private String category;
	
	private List<MateBoardAttach> files;
	

}