package com.team.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	//글 목록 요청처리
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request) {
		//HttpServletRequest 객체를 서비스에 넘겨주면서 비즈니스 로직 수행
		service.getList(request);
		
		//view page 로 forward 이동, 글 목록 출력
		return new ModelAndView("board/list");
		
	}
}
