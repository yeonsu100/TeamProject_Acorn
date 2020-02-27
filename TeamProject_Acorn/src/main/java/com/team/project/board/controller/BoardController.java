package com.team.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dto.BoardDto;
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
	//새글 추가 폼 요청 처리
	@RequestMapping("/board/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
	
		return new ModelAndView("board/insertform");
	}
	//새글 추가 요청 처리
	@RequestMapping(value="/board/insert", method=RequestMethod.POST)
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute BoardDto dto) {
		//세션에 있는 글작성자의 아이디
				String writer=(String)
						request.getSession().getAttribute("id");
				//CafeDto 객체에 담고 
				dto.setWriter(writer);
				//서비스를 이용해서 DB 에 저장
				service.saveContent(dto);
				//글 목록 보기로 리다일렉트 이동 
				return new ModelAndView("redirect:/board/list.go");
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/board/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		//view page로 forward 이동해서 글 자세히 보기
		return "cafe/detail";
	}
	
	
}
