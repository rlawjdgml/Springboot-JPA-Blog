package com.cos.blog.controller;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.model.Board;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.service.BoardService;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.detaillist(id));
		return "/board/detail";
	}
	
	// 컨트롤러에서 세션을 어떻게 찾는지?
	// @AuthenticationPrincipal PrincipalDetail principal
	@GetMapping({"", "/"})
	public String index(Model model, @PageableDefault(size=3, sort="id", direction=Sort.Direction.DESC) org.springframework.data.domain.Pageable pageable, 
			@RequestParam(required= false, defaultValue = "") String searchText) {
		
		model.addAttribute("boards", boardService.search(pageable, searchText));
		
//		model.addAttribute("boards", boardService.writelist(pageable));
//		System.out.println("로그인 사용자 : "+principal.getUsername());
		return "index"; //viewResolver 작동!
	}
	
	
	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "/board/saveForm";
	}
	
	@GetMapping("/monthlyForm")
	public String monthlyForm() {
		return "monthlyForm";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(Model model, @PathVariable int id) {
		model.addAttribute("board", boardService.detaillist(id));
		return "board/updateForm";
	}
	
	@GetMapping("/favoriteForm")
	public String favorite() {
		return "favoriteForm";
	}

}
