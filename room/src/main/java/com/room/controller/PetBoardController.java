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

import com.room.dto.FBoard;
import com.room.dto.MateBoard;
import com.room.dto.PetBoard;
import com.room.service.MateBoardService;
import com.room.service.PetBoardService;
import com.room.service.PetBoardServiceImpl;
import com.room.ui.ThePager;

@Controller
@RequestMapping(path = { "/petboard" })
public class PetBoardController {

	
	@Autowired
	@Qualifier("petBoardService")
	private PetBoardService petBoardService;
	
	@GetMapping(path = { "/list" })
	public String list(@RequestParam(defaultValue = "1")int pageNo,
			Model model) {
		
		int pageSize = 10;
		int pagerSize = 5;
		int count = 0;
		
		List<PetBoard> petboardList = petBoardService.findByPage(pageNo,pageSize);
		count = petBoardService.findBoardCount("pet");
		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");
		
		model.addAttribute("petBoardList", petboardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
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
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo,
						 @RequestParam(defaultValue = "-1")int pageNo,
						 Model model) {
			if(boardNo == -1 || pageNo == -1) {
			return "redirect:list";
			}
			
			PetBoard board = petBoardService.findByBoardNo(boardNo);
			if(board == null) { 
				return "redirect:list";
			}
			
			model.addAttribute("board",board);
			model.addAttribute("pageNo",pageNo);
			
		return "petboard/detail";
		
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo,
						 @RequestParam(defaultValue = "-1")int pageNo) {
		
		if (boardNo > 0 && pageNo > 0) {
			petBoardService.delete(boardNo);
			return "redirect:list?pageNo=" + pageNo;
		}
		
		return "redirect:list";	
	}
	
	@GetMapping(path = { "/edit" })
	public String editForm(
			@RequestParam(name="boardNo", defaultValue = "-1")int boardNo,
			@RequestParam(defaultValue = "-1")int pageNo,
			Model model){
			
			if(boardNo < 1 && pageNo < 1) {
				return "redirect:list";
			}
			
			PetBoard board = petBoardService.findByBoardNo(boardNo);
			if(board == null) { // 해당 번호의 게시글이 없는 경우
				 return "redirect:list";
			}
			
			model.addAttribute("board",board);
			model.addAttribute("pageNo", pageNo);
			
			return "mate-board/edit";
				
			}
	
	
	@PostMapping(path = { "/edit" })
	public String edit(PetBoard board, @RequestParam(defaultValue = "-1")int pageNo) {
		
		if(pageNo < 1) {
			return "redirect:list";
		}
		
		petBoardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d&pageNo=%d", board.getBoardNo(), pageNo);
		
	}
	
	
}
