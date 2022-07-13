package com.room.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CKBoard {

	private int board_no;
	private String member_id;
	private String category;
	private String title;
	private String content;
	private Date regdate;
	private int readcount;
	private boolean deleted;
}
	
	
