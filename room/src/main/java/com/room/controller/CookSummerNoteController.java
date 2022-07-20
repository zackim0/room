package com.room.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(path = { "/board" })
public class CookSummerNoteController {
	
	@PostMapping(path = { "/summernote-upload" }, produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public ArrayList<String> uploadImage(String id, String content, MultipartFile file, HttpServletRequest req) throws Exception {
		
		ArrayList<String> imagePaths = new ArrayList<String>();

		System.out.println(file.getOriginalFilename());
		String path = req.getServletContext().getRealPath("/resources/upload-files");
		file.transferTo(new File(path, file.getOriginalFilename()));
		imagePaths.add("/room/resources/upload-files/" + file.getOriginalFilename());
		
		return imagePaths;

		
	}
	
}
