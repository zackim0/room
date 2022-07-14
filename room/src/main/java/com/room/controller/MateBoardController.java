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
import com.room.service.MateBoardService;
import com.room.ui.JinPager;

@Controller
@RequestMapping(path= {"/mate-board"})
public class MateBoardController {
	
	@Autowired
	@Qualifier("mateBoardService")
	private MateBoardService mateBoardService;

	@GetMapping(path = { "/list" })
	public String list(@RequestParam(defaultValue = "1")int pageNo,
			Model model) {
		
		int pageSize = 3;
		int pagerSize = 3;
		int count = 0;
		
		List<MateBoard> mateBoardList = mateBoardService.findByPage(pageNo, pageSize);
		count = mateBoardService.findBoardCount("roommate");
		
		JinPager pager = new JinPager(count, pageNo, pageSize, pagerSize, "list");
		
		model.addAttribute("mateBoardList", mateBoardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		
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
		
		 return "redirect:list";
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo,
						@RequestParam(name="pageNo", defaultValue = "-1")int pageNo,
						Model model) {
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:list";
		}
		
		MateBoard board = mateBoardService.findByBoardNo(boardNo);
		if(board == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:list";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo);
		
		return "mate-board/detail";
	}
	
	@GetMapping(path= {"/delete"})
	public String delete(
			@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo,
			@RequestParam(defaultValue = "-1")int pageNo) {
		
		if (boardNo > 0 && pageNo > 0) {
			mateBoardService.delete(boardNo);
			return "redirect:list?pageNo=" + pageNo;
		}
		return "redirect:list";
	}
	
	@GetMapping(path = {"/edit"})
	public String showEditForm(
			@RequestParam(name="boardNo", defaultValue = "-1")int boardNo,
			@RequestParam(defaultValue = "-1")int pageNo,
			Model model) {
			
			if(boardNo < 1 && pageNo < 1) {
				return "redirect:list";
			}
			
			MateBoard board = mateBoardService.findByBoardNo(boardNo);
			if(board == null) { // 해당 번호의 게시글이 없는 경우
				 return "redirect:list";
			}
			
			model.addAttribute("board",board);
			model.addAttribute("pageNo", pageNo);
			
			return "mate-board/edit";
				
			}
	
	
	@PostMapping(path = {"/edit"})
	public String edit(MateBoard board,
						@RequestParam(defaultValue = "-1")int pageNo) {
		
		if (pageNo < 1) {
			return "redirect:list";
		}
		
		mateBoardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d", board.getBoardNo(), pageNo);
		
	}

}





