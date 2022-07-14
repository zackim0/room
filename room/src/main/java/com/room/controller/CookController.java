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

import com.room.common.Util;
import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;
import com.room.service.CKBoardService;
import com.room.ui.ThePager;

@Controller
@RequestMapping(path = { "/board" })
public class CookController {

	@Autowired
	@Qualifier("ckBoardService")
	private CKBoardService ckBoardService;
	
	@GetMapping(path = { "/cooklist" })
	public String list(@RequestParam(defaultValue = "1")int pageNo, 
			   Model model) {

		int pageSize = 10; // 한 페이지에 표시할 데이터 개수
		int pagerSize = 5; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
		int count = 0; // 전체 데이터 개수	
		
		// List<Board> boardList = boardService.findAll();
		List<CKBoard> cookboardList = ckBoardService.findByPage(pageNo, pageSize);		
		count = ckBoardService.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회	
		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "cooklist");		
		
		// Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
		model.addAttribute("cookboardList", cookboardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		return "board/cooklist";
	}
	
	@GetMapping(path = { "/write" })
	public String showWrite() {
		return "board/write";
	}
	
	@PostMapping(path = { "/write" })
	public String write(CKBoard board, MultipartFile[] attach, HttpServletRequest req) {
		
	String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
			
			ArrayList<CKBoardAttach> files = new ArrayList<>();
			for (MultipartFile file : attach) {			
				String userFileName = file.getOriginalFilename();
				if (userFileName != null && userFileName.length() > 0) {
					CKBoardAttach f = new CKBoardAttach();			
					String savedFileName = Util.makeUniqueFileName(userFileName); 
					f.setUserFileName(userFileName);
					f.setSavedFileName(savedFileName);
					try {
						File path = new File(uploadDir, savedFileName);
						file.transferTo(path); // 파일 저장
						files.add(f);
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
			
			board.setFiles(files);
		ckBoardService.writeBoard(board);
		
		return "redirect:/board/cooklist";
	}
	
	@GetMapping(path = { "/detail" })
	public String detail(@RequestParam(name="boardNo", defaultValue = "-1")int boardNo,
						@RequestParam(name="pageNo", defaultValue = "-1")int pageNo, Model model) {
		
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:cooklist";
		}
		CKBoard board = ckBoardService.findByBoardNo(boardNo);
		if(board == null) {
			return "redirect:cooklist";
		}
		model.addAttribute("board" ,board);
		model.addAttribute("pageNo", pageNo);
		return "board/detail";
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(
			@RequestParam(name = "boardNo", defaultValue = "-1") int boardNo,
			@RequestParam(defaultValue = "-1") int pageNo) {
		
		if (boardNo > 0 && pageNo > 0) {
			ckBoardService.delete(boardNo);
		}
		
		return "redirect:cooklist?pageNo=" + pageNo;
	}
	
	@GetMapping(path = { "/edit" })
	public String showEdit(@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo,
							@RequestParam(defaultValue = "-1")int pageNo, Model model) {
		if(boardNo < 1 && pageNo <1) {
			return "redirect:cooklist";
		}
		CKBoard board = ckBoardService.findByBoardNo(boardNo);
		if(board == null) {
			return "redirect:cooklist";
		}
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo);
		
		return "board/edit";
	}
	
	@PostMapping(path = { "/edit" })
	public String edit(CKBoard Board, @RequestParam(defaultValue = "-1")int pageNo) {
		if(pageNo < 1 ) {
			return "redirect:cooklist";
		}
		ckBoardService.update(Board);
		
		return String.format("redirect:detail?boardNo%d&pageNo=%d", Board.getBoardNo(), pageNo);
	}
}
