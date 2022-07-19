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

import com.room.dto.Member;
import com.room.dto.Message;
import com.room.service.MessageService;
import com.room.ui.MessagePager;

@Controller
@RequestMapping(path= {"/message"})
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;

	@GetMapping(path= {"/list"})
	public String list(@RequestParam(defaultValue = "1")int pageNo,Model model) {
		
		int pageSize = 3;
		int pagerSize = 4;
		int count = 0; 
		
		List<Message> messageList = messageService.findAll();
		count = messageService.findMessageCount();
		
		MessagePager messagePager = new MessagePager(count, pageNo, pageSize, pagerSize, "list");
		
		model.addAttribute("messageList",messageList);
		model.addAttribute("messagepager",messagePager);
		model.addAttribute("messageList",messageList);
		
		return "message/list";
				
	}
	
	@GetMapping(path= {"/write"})
	public String showWrite(Model model) {
		
		List<Member> memberList = messageService.findMemberList();
		model.addAttribute("memberList",memberList);
		
		return "message/write";
	}
	
	
	@PostMapping(path= {"/write"})
	public String showWriteForm(Message message,HttpServletRequest req) {
		messageService.writeMessage(message);
		
		return "redirect:list";
	}
	
	@PostMapping(path= {"/receiver"})
	public String receiver(Member member, Model model) {
		
		List<Member> memberList = messageService.findMemberList();
		model.addAttribute("memberList",memberList);
		
		return "message/receiver";
	}
	
	
	
	
}

