package com.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/petboard" })
public class PetBoardController {

	@GetMapping(path = { "/list" })
	public String list() {
		
		return "petboard/list";
	}
}
