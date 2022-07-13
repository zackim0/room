package com.room.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.room.dto.FBoard;
import com.room.dto.MateBoard;
import com.room.service.FBoardService;
import com.room.service.MateBoardService;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
public class HomeController {
	
	@Autowired
	@Qualifier("fBoardService")
	private FBoardService fBoardService;

	@Autowired
	@Qualifier("mateBoardService")
	private MateBoardService mateBoardService;

	@RequestMapping(path = { "/", "/home" }) // "/" 또는 "/home" 요청을 처리하는 메서드로 등록
	public String home(Model model) {
		
		List<FBoard> fboardRecentList = fBoardService.find3();		
		model.addAttribute("fboardRecentList", fboardRecentList);

		List<MateBoard> mateBoardRecentList = mateBoardService.find3();		
		model.addAttribute("mateBoardRecentList", mateBoardRecentList);

		return "home"; // /WEB-INF/views/ + home + .jsp -> /WEB-INF/views/home.jsp
	}

}
