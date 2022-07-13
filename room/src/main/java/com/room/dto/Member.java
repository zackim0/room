package com.room.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {

	private String memberId;
	private String nickname;
	private String passwd;
	private String email;
	private String userType; 
	private int active;
	private Date regDate;
	private String region;
	private int pet;

	
}
