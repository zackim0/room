package com.room.dto;

import lombok.Data;

@Data
public class MateBoardAttach {
	
	
	private int attachNo;
	private int boardNo;
	private String userFileName;
	private String savedFileName;
	private int downloadCount;

}
