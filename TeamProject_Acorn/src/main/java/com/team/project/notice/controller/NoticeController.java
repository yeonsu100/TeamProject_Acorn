package com.team.project.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.notice.dto.NoticeDto;
import com.team.project.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	// 파일 목록보기 
	@RequestMapping("/notice/list")
	public ModelAndView list(ModelAndView mView,
			HttpServletRequest request) {
		// 파일 목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		service.list(request);
		mView.setViewName("notice/list");
		return mView;
	}
	// 글작성 폼 요청
	@RequestMapping("/notice/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		return new ModelAndView("notice/insertform");
	}
	// 글작성 요청
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST )
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute NoticeDto dto) {
		// 세션에 있는 작성자 아이디 읽어오기
		String writer=(String)request.getSession().getAttribute("id");
		dto.setWriter(writer);
		service.addContent(request, dto);
		return new ModelAndView("redirect:/notice/list.go");
	}
	
	//원글 삭제 요청 처리
	@RequestMapping("/notice/delete")
	public ModelAndView 
		authDelete(HttpServletRequest request,
				@RequestParam int num){
		//서비스를 이용해서 글을 삭제하기 
		service.deleteContent(num, request);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/notice/list.go");
	}
	// 글 자세히 보기
	@RequestMapping("/notice/detail")
	public String detail(HttpServletRequest request){
		service.detail(request);
		//view page 로 forward 이동해서 글 자세히 보기 
		return "notice/detail";
	}	
}
