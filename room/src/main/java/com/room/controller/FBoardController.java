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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.room.common.Util;
import com.room.dto.FBoard;
import com.room.dto.FBoardAttach;
import com.room.service.FBoardService;
import com.room.service.FBoardServiceImpl;
import com.room.ui.ThePager;
import com.room.view.FDownloadView;

@Controller
@RequestMapping(path= {"/fashion-board"})
public class FBoardController {
	
	@Autowired
	@Qualifier("fBoardService")
	private FBoardService fBoardService;

	@GetMapping(path = { "/","/list" })
	public String list(@RequestParam(defaultValue = "1")int pageNo,
						Model model) {
		
		int pageSize = 3; // 한 페이지에 표시할 데이터 개수
		int pagerSize = 3; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
		int count = 0; // 전체 데이터 개수	
//		
		//List<FBoard> fboardList = fBoardService.findAll();
		List<FBoard> fboardList = fBoardService.findByPage(pageNo, pageSize);		
		count = fBoardService.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회	
//		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");		
//		
//		// Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
		model.addAttribute("fboardList", fboardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
//		
		return "fashion-board/list";  // --> /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "fashion-board/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String write(FBoard board,
						MultipartFile[] attach,
						HttpServletRequest req) {
		//getRealPath : 웹경로 -> 컴퓨터 경로
		//				http:// ..... /a/b/c ---> C:\......\a\b\c
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<FBoardAttach> files = new ArrayList<>();
		for(MultipartFile file : attach) {
			String userFileName = file.getOriginalFilename();
			if (userFileName !=null && userFileName.length() > 0) {
				FBoardAttach f = new FBoardAttach();
				String savedFileName = Util.makeUniqueFileName(userFileName);
				f.setUserFileName(userFileName);
				f.setSavedFileName(savedFileName);
				try {
					File path = new File(uploadDir,savedFileName);
					file.transferTo(path); // 파일 저장
					files.add(f);
				}catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
			 
		board.setFiles(files);
		fBoardService.writeBoard(board);			
//		
		// return "redirect:/fashion-board/list";
		return "redirect:list"; // 
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo" , defaultValue = "-1")int boardNo,
						 @RequestParam(name="pageNo",defaultValue = "-1")int pageNo,
						Model model) {
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:list";
		}
		
		FBoard board = fBoardService.findByBoardNo(boardNo);
		if(board == null) { // 해당 번호의 게시글이 없는 경우
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		model.addAttribute("pageNo",pageNo);
		
		return "fashion-board/detail";
	}
	
	//download?attachNo=1
	@GetMapping(path= {"/download"})
	public View download(
			@RequestParam(name="attachNo",defaultValue = "-1")int attachNo,
			Model model) {
		
		if (attachNo < 1) {
			
			return new RedirectView("list");
		}
		
		FBoardAttach boardAttach = fBoardService.findBoardAttachByAttachNo(attachNo);
		
		model.addAttribute("uploadDir","/resources/upload-files/");
		model.addAttribute("boardAttach",boardAttach);
		
		FDownloadView downloadView = new FDownloadView();
		return downloadView;
	}
	
	
	@GetMapping(path = {"/delete"})
	public String delete(
			@RequestParam(name="boardNo",defaultValue = "-1")int boardNo) {
		if(boardNo > 0) {
			fBoardService.delete(boardNo);
		}
		return "redirect:list";
		
	}
	
	@GetMapping(path= {"/edit"})
	public String showEditForm(
			@RequestParam(name="boardNo",defaultValue = "-1")int boardNo,
			Model model){
			
			if(boardNo < 1) {
				return "redirect:list";
			}
			
			FBoard board = fBoardService.findByBoardNo(boardNo);
			if(board == null) { // 해당 번호의 게시글이 없는 경우
				 return "redirect:list";
			}
			
			model.addAttribute("board",board);
			
			return "fashion-board/edit";
				
			}
	
	@PostMapping(path= {"/edit"})
	public String edit(FBoard board) {
		
		fBoardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d",
									board.getBoardNo());
		
	}
			


}

