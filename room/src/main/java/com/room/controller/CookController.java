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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;


import com.room.common.Util;
import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;
import com.room.dto.CKBoardComment;
import com.room.service.CKBoardService;
import com.room.ui.ThePager;
import com.room.view.CKDownloadView;

@Controller
@RequestMapping(path = { "/board" })
public class CookController {

	@Autowired
	@Qualifier("ckBoardService")
	private CKBoardService ckBoardService;
	
	@GetMapping(path = { "/cooklist" })
	public String list(@RequestParam(defaultValue = "1")int pageNo, 
			   Model model) {

		int pageSize = 10; 
		int pagerSize = 5; 
		int count = 0; 
		
		// List<Board> boardList = boardService.findAll();
		List<CKBoard> cookboardList = ckBoardService.findByPage(pageNo, pageSize);		
		count = ckBoardService.findBoardCount("recipe"); 
		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "cooklist");		
		
		
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
	
	@GetMapping(path = { "/download" })
	public View download(
			@RequestParam(name = "attachNo", defaultValue = "-1")int attachNo,
			Model model) {
		
		if (attachNo < 1) {		
			return new RedirectView("cooklist");
		}
		
		CKBoardAttach boardAttach = ckBoardService.findBoardAttachByAttachNo(attachNo);
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("boardAttach", boardAttach);
		
		CKDownloadView downloadView = new CKDownloadView();		
		return downloadView;
	}
	
	@PostMapping(path = { "/edit" })
	public String edit(CKBoard Board, @RequestParam(defaultValue = "-1")int pageNo) {
		
		if(pageNo < 1 ) {
			return "redirect:cooklist";
		}
		ckBoardService.update(Board);
		
		return String.format("redirect:detail?boardNo%d&pageNo=%d", Board.getBoardNo(), pageNo);
	}
	///////////////////////////
	
	// @ResponseBody  : return 값이 viewname이 아니고 응답 컨텐츠임을 알려주는 설정
	@PostMapping(path = { "/comment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String writeComment(CKBoardComment boardComment) {
		
		ckBoardService.writeBoardComment(boardComment);
		
		return "success"; // WEB-INF/views/success.jsp
		
	}
	
	@PostMapping(path = { "/recomment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String writeReComment(CKBoardComment boardComment) {
		
	
		ckBoardService.writeBoardReComment(boardComment);
		
		return "success";
	
	}
	
	@GetMapping(path = { "/comment-list" })
	public String listComment(@RequestParam(name="boardNo") int boardNo, Model model) {
		
		List<CKBoardComment> comments = ckBoardService.findCommentsByBoardNo(boardNo);
		
		model.addAttribute("comments", comments);
		
		return "board/comments";
		
	}
	
	@GetMapping(path = { "/comment-delete" }, produces = { "text/plain; charset=utf-8" })
	@ResponseBody
	public String deleteComment(@RequestParam(name = "commentNo") int commentNo) {
	
		ckBoardService.deleteComment(commentNo);
		
		return "success";
	}
	
	@PostMapping(path = { "/comment-update" }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateComment(CKBoardComment boardComment) {
		
		ckBoardService.updateBoardComment(boardComment);
		
		return "success";
		
	}
}
