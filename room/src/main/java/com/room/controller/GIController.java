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

import com.room.dto.GIBoard;
import com.room.service.GIBoardService;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
@RequestMapping(path = { "/playground/gameintroduce" }) // "/gameIntroduce" 요청을 처리하는 메서드로 등록
public class GIController {
	
	@Autowired
	@Qualifier("gIboardService")
	private GIBoardService gIboardService;
	
	@GetMapping(path = { "/","/list" })
	public String list(Model model) {
		
//		int pageSize = 6; // 한 페이지에 표시할 데이터 개수
//		int pagerSize = 3; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
//		int count = 0; // 전체 데이터 개수	
		
 		List<GIBoard> gIboardList = gIboardService.findAll();
//		List<GIBoard> gIboardList = gIboardService.findByPage(pageNo, pageSize);		
//		count = gIboardService.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회	
		
//		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");		
		
		// Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
		model.addAttribute("gIboardList", gIboardList);
//		model.addAttribute("pager", pager);
//		model.addAttribute("pageNo", pageNo);
		
		return "/playground/gameintroduce/list";  // --> /WEB-INF/views/ + board/list + .jsp
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() {
		
		return "playground/gameintroduce/write"; // --> /WEB-INF/views/ + board/write + .jsp
	}
	
	@PostMapping(path = { "/write" })
	public String write(GIBoard board,
						HttpServletRequest req) {
		
		// getRealPath : 웹경로 -> 컴퓨터 경로
		//               http:// ..... /a/b/c ---> C:\......\a\b\c
//		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
//		
//		ArrayList<BoardAttach> files = new ArrayList<>();
//		for (MultipartFile file : attach) 
//			String userFileName = file.getOriginalFilename();
//			if (userFileName != null && userFileName.length() > 0) {
//				BoardAttach f = new BoardAttach();
//				String savedFileName = Util.makeUniqueFileName(userFileName); 
//				f.setUserFileName(userFileName);
//				f.setSavedFileName(savedFileName);
//				try {
//					File path = new File(uploadDir, savedFileName);
//					file.transferTo(path); // 파일 저장
//					files.add(f);
//				} catch (Exception ex) {
//					ex.printStackTrace();
//				}
//			}
//		}
//		
//		board.setFiles(files);
		gIboardService.writeBoard(board);		
		
		// return "redirect:/board/list";
		return "redirect:list"; // 
	}
	
	@GetMapping(path = {"/detail"})
	public String detail(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo,
						Model model) {
		if(boardNo == -1) {
			return "redirect:list";
		}
		
		GIBoard board = gIboardService.findByBoardNo(boardNo);
		if(board == null) {
			System.out.println(boardNo);
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		
		return "/playground/gameintroduce/detail";
		
	}
	
	@GetMapping(path = {"/delete"})
	public String delete(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo
						/* @RequestParam(defaultValue = "-1") int pageNo */) {
		
		if(boardNo > 0 /* && pageNo > 0 */) {
			gIboardService.delete(boardNo);
//			return "redirect:list?pageNo=" + pageNo;
		}
		
		return "redirect:list";
	}
	
	@GetMapping(path = {"/edit"})
	public String showEditForm(@RequestParam(name="boardNo", defaultValue = "-1") int boardNo,
			Model model) {
		
		if(boardNo < 1) {
			return "redirect:list";
		}
		
		GIBoard board = gIboardService.findByBoardNo(boardNo);
		if(board == null) {
			return "redirect:list";
		}
		
		model.addAttribute("board",board);
		
		return "/playground/gameintroduce/edit";
	}
	
	@PostMapping(path = {"/edit"})
	public String edit(GIBoard board, @RequestParam(defaultValue = "-1") int pageNo) {
		
		gIboardService.update(board);
		
		return String.format("redirect:detail?boardNo=%d",board.getBoardNo());
	}
}

