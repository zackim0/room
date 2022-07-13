package com.room.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.room.dto.CKBoard;
import com.room.service.CKBoardService;

@Controller
@RequestMapping(path = { "/board" })
public class CookController {

	@Autowired
	@Qualifier("ckBoardService")
	private CKBoardService ckBoardService;
	
	@GetMapping(path = { "/cooklist" })
	public String list(Model model) {
		
		List<CKBoard> ckboardList = ckBoardService.findAll(); 
		
		model.addAttribute("ckboardList", ckboardList);
		return "board/cooklist";
	}
	
	@GetMapping(path = { "/write" })
	public String showWrite() {
		return "board/write";
	}
	
	@PostMapping(path = { "/write" })
	public String write(CKBoard ckboard, HttpServletRequest req) {
		ckBoardService.writeBoard(ckboard);
		
		return "redirect:/board/cooklist";
	}
}
