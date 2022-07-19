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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.room.common.Util;
import com.room.dto.TipBoard;
import com.room.dto.TipBoardAttach;
import com.room.dto.TipBoardComment;
import com.room.service.TipBoardService;
import com.room.ui.ThePager;
import com.room.view.TipDownloadView;

@Controller
@RequestMapping(path= {"/tip-board"})
public class TipBoardController {
	
	@Autowired
	@Qualifier("tipBoardService")
	private TipBoardService tipBoardService;

	@GetMapping(path = { "/list" })
	public String list(@RequestParam(defaultValue = "1")int pageNo,
			Model model) {
		
		int pageSize = 10;
		int pagerSize = 5;
		int count = 0;
		
		List<TipBoard> tipBoardList = tipBoardService.findByPage(pageNo, pageSize);
		count = tipBoardService.findBoardCount("tip");
		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");
		
		model.addAttribute("tipBoardList", tipBoardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		
		return "tip-board/list";  // --> /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "tip-board/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String write(TipBoard board,
						MultipartFile[] attach,
						HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<TipBoardAttach> files = new ArrayList<>();
		for (MultipartFile file : attach) {
			String userFileName = file.getOriginalFilename();
			if (userFileName != null && userFileName.length() > 0) {
				TipBoardAttach f = new TipBoardAttach();
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
		tipBoardService.writeBoard(board);			
		
		 return "redirect:list";
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo,
						@RequestParam(name="pageNo", defaultValue = "-1")int pageNo,
						Model model) {
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:list";
		}
		
		TipBoard board = tipBoardService.findByBoardNo(boardNo);
		if(board == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:list";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo);
		
		return "tip-board/detail";
	}
	
	@GetMapping(path= {"/delete"})
	public String delete(
			@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo,
			@RequestParam(defaultValue = "-1")int pageNo) {
		
		if (boardNo > 0 && pageNo > 0) {
			tipBoardService.delete(boardNo);
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
			
			TipBoard board = tipBoardService.findByBoardNo(boardNo);
			if(board == null) { // 해당 번호의 게시글이 없는 경우
				 return "redirect:list";
			}
			
			model.addAttribute("board",board);
			model.addAttribute("pageNo", pageNo);
			
			return "tip-board/edit";
				
	}
	
	@PostMapping(path = {"/edit"})
	public String edit(TipBoard board,
						@RequestParam(defaultValue = "-1")int pageNo) {
		
		if (pageNo < 1) {
			return "redirect:list";
		}
		tipBoardService.update(board);
		
		return String.format("redirect:detail?boardno=%d&pageNo=%d",
				board.getBoardNo(), pageNo);
		
	}
	
	@GetMapping(path = { "/download" }) 
	public View download(
			@RequestParam(name = "attachNo", defaultValue = "-1") int attachNo,
			Model model) {
		
		if (attachNo < 1) {
			return new RedirectView("list");
		}
		
		TipBoardAttach boardAttach = tipBoardService.findBoardAttachByAttachNo(attachNo);
		
		model.addAttribute("uploadDir", "/resources/upload-files/");
		model.addAttribute("tipBoardAttach", boardAttach);
		
		TipDownloadView downloadView = new TipDownloadView();		
		return downloadView;
	}
	
	@PostMapping(path = { "/comment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String writeComment(TipBoardComment boardComment) {
		
		tipBoardService.writeBoardComment(boardComment);
		
		return "success";
		
	}
	
	@PostMapping(path = { "/recomment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String writeReComment(TipBoardComment boardComment) {
		
		tipBoardService.writeBoardReComment(boardComment);
		
		return "success";
		
	}
	
	@GetMapping(path = { "/comment-list" })
	public String listComment(@RequestParam(name="boardNo") int boardNo, Model model) {
		
		List<TipBoardComment> comments = tipBoardService.findCommentsByBoardNo(boardNo);
		
		model.addAttribute("comments", comments);
		
		return "tip-board/comments";
		
	}
	
	@GetMapping(path = { "/comment-delete" }, produces = { "text/plain; charset=utf-8" })
	@ResponseBody
	public String deleteComment(@RequestParam(name = "commentNo") int commentNo) {
	
		tipBoardService.deleteComment(commentNo);
		
		return "success";
	}
	
	@PostMapping(path = { "/comment-update" }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateComment(TipBoardComment boardComment) {
		
		tipBoardService.updateBoardComment(boardComment);
		
		return "success";
		
	}
	

}





