package com.room.dto;

import lombok.Data;

@Data
public class GIBoard {
	private int board_no;
	private String member_id;
	private String nickname;
	private String category;
	private String title;
	private String content;
	private String regdate;
	private int readcount;
	private boolean deleted;
	private String writer;
	
}
