package com.room.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.room.dto.Member;
import com.room.mapper.MemberMapper;
import com.room.service.AccountService;

import lombok.Setter;


@Controller
@RequestMapping(path = { "/account" })
public class MemberController {
	
		@Setter
		private MemberMapper memberMapper;

		@Autowired
		@Qualifier("accountService")
		AccountService accountService;
	
		@GetMapping(path = { "/login" })
		public String LoginForm() {
			
			return "account/login";
		}
		
		@PostMapping(path = { "/login" })
		public String login(Member member, HttpSession session) {			
			Member member2 = accountService.findMemberByIdAndPasswd(member);		
			if (member2 != null) {
				session.setAttribute("loginuser", member2);
			} else {
				System.out.println("로그인 실패");
			}			
			return "redirect:/home";
		}
		

		@GetMapping(path = { "/register" })
		public String RegisterForm(Member memberId) {			
			return "account/register"; 			
		}
		
		
		
		@PostMapping(path = { "/register" })
		public String register(Member member) { 
			accountService.registerMember(member);		
			return "redirect:login";
		}
		

		@GetMapping(path = { "/logout" })
		public String logout(HttpSession session) {			
			session.removeAttribute("loginuser");			
			return "redirect:/home";
		}
		
		

		
		@GetMapping(path = { "/delete" })
		public String delete(Member memberId, HttpSession session) {
			
			session.removeAttribute("loginuser");
			accountService.delete(memberId);
			return "redirect:/home";
				
		}
		
		@GetMapping(path = { "/profile" })
		public String profileForm() {
			
			return "account/profile";	
			
		}	


		@PostMapping(path = { "/profile" })
		public String update(Member member) {	
			accountService.update(member);
			return "redirect:profile";
			
		}
		
		
}


