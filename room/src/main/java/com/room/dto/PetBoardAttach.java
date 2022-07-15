package com.room.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PetBoardAttach {
	
	private int attachNo;
	private int boardNo;
	private String userFileName;
	private String savedFileName;
	private int downloadCount;


}