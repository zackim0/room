package com.room.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.room.dto.FBoard;
import com.room.dto.MateBoard;
import com.room.service.MateBoardService;
import com.room.service.MateBoardServiceImpl;

@Controller
@RequestMapping(path= {"/mate-board"})
public class MateBoardController {
	
	@Autowired
	@Qualifier("mateBoardService")
	private MateBoardService mateBoardService;

	@GetMapping(path = { "/","/list" })
	public String list(Model model) {
		
		List<MateBoard> mateBoardList = mateBoardService.findAll();
		model.addAttribute("mateBoardList", mateBoardList);
		
		return "mate-board/list";  // --> /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "mate-board/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String write(MateBoard board,
						HttpServletRequest req) {
		
		mateBoardService.writeBoard(board);			
		
		 return "redirect:/mate-board/list";
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo,
						Model model) {
		if(boardNo == -1) {
			return "redirect:list";
		}
		
		MateBoard board = mateBoardService.findByBoardNo(boardNo);
		if(board == null) { // 해당 번호의 게시글이 없는 경우
			System.out.println(boardNo);
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		
		return "mate-board/detail";
	}
	
	@GetMapping(path= {"/delete"})
	public String delete(
			@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo) {
		if (boardNo > 0) {
			mateBoardService.delete(boardNo);
		}
		return "redirect:list";
	}
	
	@GetMapping(path = {"/edit"})
	public String showEditForm(
			@RequestParam(name="boardNo", defaultValue = "-1")int boardNo,
			Model model){
			
			if(boardNo < 1) {
				return "redirect:list";
			}
			
			MateBoard board = mateBoardService.findByBoardNo(boardNo);
			if(board == null) { // 해당 번호의 게시글이 없는 경우
				 return "redirect:list";
			}
			
			model.addAttribute("board",board);
			
			return "mate-board/edit";
				
			}
	
	
	@PostMapping(path = {"/edit"})
	public String edit(MateBoard board) {
		
		mateBoardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d", board.getBoardNo());
		
	}

}





