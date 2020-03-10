package com.team.project.suggest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.suggest.dto.SuggestDto;
import com.team.project.suggest.service.SuggestService;

@Controller
public class SuggestController {
	@Autowired
	private SuggestService service;
	
	// 게시판 목록 보기 
	@RequestMapping("/suggest/list")
	public ModelAndView list(ModelAndView mView,
			HttpServletRequest request) {
		// 파일 목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		service.list(request);
		mView.setViewName("suggest/list");
		return mView;
	}

	// 글작성 요청
	@RequestMapping(value = "/suggest/insert", method = RequestMethod.POST )
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute SuggestDto dto) {
		// 세션에 있는 작성자 아이디 읽어오기
		String sugId=(String)request.getSession().getAttribute("id");
		dto.setSugId(sugId);
		service.addSuggest(request, dto);
		ModelAndView mView=new ModelAndView();
		mView.setViewName("redirect:/suggest/list.go");
		return mView;
	}
}
