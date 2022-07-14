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
import org.springframework.web.bind.annotation.RequestParam;

import com.room.dto.MateBoard;
import com.room.dto.PetBoard;
import com.room.service.MateBoardService;
import com.room.service.PetBoardService;
import com.room.service.PetBoardServiceImpl;

@Controller
@RequestMapping(path = { "/petboard" })
public class PetBoardController {

	
	@Autowired
	@Qualifier("petBoardService")
	private PetBoardService petBoardService;
	
	@GetMapping(path = { "/list" })
	public String list(Model model) {
			
		List<PetBoard> petboardList = petBoardService.findAll();		
		model.addAttribute("petBoardList", petboardList);
		
		return "petboard/list";
	}
	
	@GetMapping(path = { "/write" })
	public String write() {
		
		return "petboard/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String  writeForm(PetBoard board, HttpServletRequest req) {
		
		petBoardService.writeBoard(board);
		
		return "redirect:/petboard/list";
	}
	
	@GetMapping(path = { "/detail" })
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo, Model model) {
			if(boardNo == -1) {
			return "/list";
			}
			
			PetBoard board = petBoardService.findByBoardNo(boardNo);
			if(board == null) { 
			System.out.println(boardNo);
			return "redirect:list";
			}
			
			model.addAttribute("board",board);
		return "petboard/detail";
		
	}
	
}
