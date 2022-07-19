package com.room.dto;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class Member implements Serializable{
	
	@NotBlank(message = "아이디를 입력하세요")
	//@Length(min=8, max=20, message = "아이디는 8~20문자 범위입니다.")
	@Pattern(regexp = "[A-Za-z0-9]{8,20}", message = "아이디는 8~20개의 영문자/숫자 조합입니다.")
	private String memberId;
	
	private String nickname;
	
	@NotBlank(message = "패스워드를 입력하세요")
	@Pattern(regexp = "[A-Za-z0-9@#$]{8,20}", message = "패스워드 형식 오류")
	private String passwd;
	
	@NotBlank(message = "이메일을 입력하세요")
	@Email(message = "이메일 형식이 아닙니다")
	private String email;
	
	private String userType; 
	private int active;
	private Date regDate;
	
	@NotBlank(message = "지역을 입력하세요")
	private String region;
	
	private int pet;

	
}
