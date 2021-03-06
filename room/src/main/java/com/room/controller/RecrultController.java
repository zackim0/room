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

import com.room.dto.RecrultBoardComment;
import com.room.common.Util;
import com.room.dto.RecrultBoard;
import com.room.dto.RecrultBoardAttach;
import com.room.service.RecrultBoardService;
import com.room.ui.ThePager;
import com.room.view.RecrultDownloadView;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
@RequestMapping(path = { "/playground/recrult" }) // "/gameIntroduce" 요청을 처리하는 메서드로 등록
public class RecrultController {
	
	@Autowired
	@Qualifier("recrultboardService")
	private RecrultBoardService recrultboardService;
	
	@GetMapping(path = { "/list" })
	public String list(@RequestParam(defaultValue = "1")int pageNo, Model model) {
		
		int pageSize = 6; // 한 페이지에 표시할 데이터 개수
		int pagerSize = 3; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
		int count = 0; // 전체 데이터 개수	
		
		List<RecrultBoard> recrultboardList = recrultboardService.findByPage(pageNo, pageSize);		
		count = recrultboardService.findBoardCount("recrult"); // 데이터베이스에 전체 개시물 개수 조회	
		
		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");		
		
		// Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
		model.addAttribute("recrultboardList", recrultboardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "/playground/recrult/list";  // --> /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "playground/recrult/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String write(RecrultBoard board,
						MultipartFile[] attach,
						HttpServletRequest req) {
		
		// getRealPath : 웹경로 -> 컴퓨터 경로
		//               http:// ..... /a/b/c ---> C:\......\a\b\c
		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		
		ArrayList<RecrultBoardAttach> files = new ArrayList<>();
		for (MultipartFile file : attach) {
			String userFileName = file.getOriginalFilename();
			if (userFileName != null && userFileName.length() > 0) {
				RecrultBoardAttach f = new RecrultBoardAttach();
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
		recrultboardService.writeBoard(board);		
		
		// return "redirect:/board/list";
		return "redirect:list"; // 
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo,
						 @RequestParam(name="pageNo", defaultValue = "-1") int pageNo,
						 Model model) {
		if(boardNo == -1 || pageNo == -1) {
			return "redirect:list";
		}
		
		RecrultBoard board = recrultboardService.findByBoardNo(boardNo);
		if(board == null) {
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		model.addAttribute("pageNo",pageNo);
		
		return "/playground/recrult/detail";
		
	}
	
	@GetMapping(path = {"/delete"})
	public String delete(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo,
						 @RequestParam(defaultValue = "-1") int pageNo ) {
		
		if(boardNo > 0  && pageNo > 0 ) {
			recrultboardService.delete(boardNo);
//			return "redirect:list?pageNo=" + pageNo;
		}
		
		return "redirect:list?pageNo=" + pageNo;
	}
	
	@GetMapping(path = {"/edit"})
	public String showEditForm(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo,
							   @RequestParam(defaultValue = "-1") int pageNo,
							   Model model) {
		
		if(boardNo < 1 && pageNo < 1) {
			return "redirect:list";
		}
		
		RecrultBoard board = recrultboardService.findByBoardNo(boardNo);
		if(board == null) {
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		model.addAttribute("pageNo", pageNo);
		
		return "/playground/recrult/edit";
	}
	
	@PostMapping(path = {"/edit"})
	public String edit(RecrultBoard board, @RequestParam(defaultValue = "-1") int pageNo) {
		
		if (pageNo < 1) {
			return "redirect:list";
		}
		
		recrultboardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d",board.getBoardNo(),pageNo);
	}
	
	@GetMapping(path = {"/download"})
	public View download(@RequestParam(name="attachNo",defaultValue = "-1")int attachNo,
						Model model) {
		
		if(attachNo < 1) {
			return new RedirectView("list");
		}
		
		RecrultBoardAttach boardAttach = recrultboardService.findBoardAttachByAttachNo(attachNo);
		
		model.addAttribute("uploadDir","/resources/upload-files/");
		model.addAttribute("boardAttach",boardAttach);
		
		RecrultDownloadView downloadView = new RecrultDownloadView();
		return downloadView;
	}
	
/////////////////////////////////////////////////////////
	
	@PostMapping(path = { "/comment-write" }, produces = { "text/plain;charset=utf-8" })
	@ResponseBody // return값이 viewname이 아니고 응답 컨텐츠임을 알려준느 설정.
	public String writeComment(RecrultBoardComment boardComment) {
	
		recrultboardService.writeBoardComment(boardComment);
		
		return "success"; // jspfile이 아닌, 그 자체로 응답이 됌.
	
	}
	
	@GetMapping(path = { "/comment-list" })
	public String listComment(@RequestParam(name="boardNo") int boardNo, Model model) {
	
		List<RecrultBoardComment> comments = recrultboardService.findCommentsByBoardNo(boardNo);
		
		model.addAttribute("comments", comments);
		
		return "board/comments";
	
	}
	
	@GetMapping(path = { "/comment-delete" }, produces = { "text/plain; charset=utf-8" })
	@ResponseBody
	public String deleteComment(@RequestParam(name = "commentNo") int commentNo) {
	
		recrultboardService.deleteComment(commentNo);
		
		return "success";
	}
	
	@PostMapping(path = { "/comment-update" }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateComment(RecrultBoardComment boardComment) {
	
		recrultboardService.updateBoardComment(boardComment);
		
		return "sucess";
	
	}
	
}

