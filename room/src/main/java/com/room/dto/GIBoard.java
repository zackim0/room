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
	private int readCount;
	private boolean deleted;
	private String writer;
}
