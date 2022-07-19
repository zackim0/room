package com.room.dto;

import java.util.Date;

import lombok.Data;
	
	@Data
public class Message {

	private int message_No;
	private String sender;
	private String receiver;
	private String message_content;
	private Date sendTime;
	private Date readTime;
	
}
