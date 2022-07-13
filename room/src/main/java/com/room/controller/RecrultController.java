package com.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
@RequestMapping(path = { "/Recrult" }) // "/Recrult/list" 요청을 처리하는 메서드로 등록
public class RecrultController {

	public String Recrult() {
		
		return "/Recrult/list"; // /WEB-INF/views/ + Recrult/list + .jsp -> /WEB-INF/views/gameIntroduce.jsp
	}
	

}
