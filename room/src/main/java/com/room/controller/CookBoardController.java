package com.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/cookboard" })
public class CookBoardController {

	@GetMapping(path = { "/cooklist" })
	public String list() {
		return "cookboard/cooklist";
	}
}
