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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.room.common.Util;
import com.room.dto.MateBoardAttach;
import com.room.dto.PetBoard;
import com.room.dto.PetBoardAttach;
import com.room.service.PetBoardService;
import com.room.service.PetBoardServiceImpl;
import com.room.ui.ThePager;
import com.room.ui.ThePager2;
import com.room.view.MateDownloadView;
import com.room.view.PetDownloadView;

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
		
		ThePager2 pager = new ThePager2(count, pageNo, pageSize, pagerSize, "list");
		
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
	public String  writeForm(PetBoard board, 
							 HttpServletRequest req,
							 MultipartFile[] attach) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<PetBoardAttach> files = new ArrayList<>();
		for(MultipartFile file : attach) {
			String userFileName = file.getOriginalFilename();
			if(userFileName != null && userFileName.length() > 0 ) {
				PetBoardAttach f = new PetBoardAttach();
				String savedFileName = Util.makeUniqueFileName(userFileName);
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File path = new File(uploadDir, savedFileName);
					file.transferTo(path);
					files.add(f);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		
		board.setFiles(files);
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
			
			return "petboard/edit";
				
			}
	
	
	@PostMapping(path = { "/edit" })
	public String edit(PetBoard board, @RequestParam(defaultValue = "-1")int pageNo) {
		
		if(pageNo < 1) {
			return "redirect:list";
		}
		
		petBoardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d&pageNo=%d", board.getBoardNo(), pageNo);
		
	}
	@GetMapping(path = { "/download" })
	public View download(
			@RequestParam(name = "attachNo", defaultValue = "-1")
			int attachNo, Model model) {
		
		if(attachNo < 1) {
			return new RedirectView("list");
		}
		PetBoardAttach boardAttach = petBoardService.findBoardAttachByAttachNo(attachNo);
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("petBoardAttach", boardAttach);
		
		PetDownloadView downloadView = new PetDownloadView();		
		return downloadView;
	}
	
	
	
}
