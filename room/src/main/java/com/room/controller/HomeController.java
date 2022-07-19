package com.room.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.room.dto.CKBoard;
import com.room.dto.FBoard;
import com.room.dto.GIBoard;
import com.room.dto.MateBoard;
import com.room.dto.PetBoard;
import com.room.dto.TipBoard;
import com.room.service.CKBoardService;
import com.room.service.FBoardService;
import com.room.service.GIBoardService;
import com.room.service.MateBoardService;
import com.room.service.PetBoardService;
import com.room.service.TipBoardService;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
public class HomeController {
	
	@Autowired
	@Qualifier("fBoardService")
	private FBoardService fBoardService;

	@Autowired
	@Qualifier("mateBoardService")
	private MateBoardService mateBoardService;
	
	@Autowired
	@Qualifier("ckBoardService")
	private CKBoardService ckBoardService;
	
	@Autowired
	@Qualifier("gIboardService")
	private GIBoardService gIboardService;
	
	@Autowired
	@Qualifier("petBoardService")
	private PetBoardService petBoardService;
	
	@Autowired
	@Qualifier("tipBoardService")
	private TipBoardService tipBoardService;

	@RequestMapping(path = { "/", "/home" }) // "/" 또는 "/home" 요청을 처리하는 메서드로 등록
	public String home(Model model) {
		
		List<FBoard> fboardRecentList = fBoardService.find3();		
		model.addAttribute("fboardRecentList", fboardRecentList);

		List<MateBoard> mateBoardRecentList = mateBoardService.find3();		
		model.addAttribute("mateBoardRecentList", mateBoardRecentList);
		
		List<CKBoard> ckboardRecentList = ckBoardService.find3();
		model.addAttribute("ckboardRecentList", ckboardRecentList);
		
		List<GIBoard> gIboardRecentList = gIboardService.find3();
		model.addAttribute("gIboardRecentList", gIboardRecentList);
		
		List<PetBoard> petBoardList = petBoardService.findAll();
		model.addAttribute("petBoardList", petBoardList);
		
		List<TipBoard> tipBoardRecentList = tipBoardService.find3();		
		model.addAttribute("tipBoardRecentList", tipBoardRecentList);

		return "home"; // /WEB-INF/views/ + home + .jsp -> /WEB-INF/views/home.jsp
	}

}
