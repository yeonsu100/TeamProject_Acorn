package com.team.project.suggest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.suggest.dto.SuggestDto;
import com.team.project.suggest.service.SuggestService;

@Controller
public class SuggestController {
	@Autowired
	private SuggestService service;
	
	// 게시판 목록 보기 
	@RequestMapping("/suggest/list")
	public ModelAndView authlist(ModelAndView mView,
			HttpServletRequest request) {
		service.list(request);
		mView.setViewName("suggest/list");
		return mView;
	}

	// 글작성 요청
	@RequestMapping(value = "/suggest/insert", method = RequestMethod.POST )
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute SuggestDto dto) {
		String sugId=(String)request.getSession().getAttribute("id");
		dto.setSugId(sugId);
		service.addSuggest(request, dto);
		ModelAndView mView=new ModelAndView();
		mView.setViewName("redirect:/suggest/list.go");
		return mView;
	}
	
	//게시글 수정 요청
	@ResponseBody
	@RequestMapping("/suggest/update")
	public Map<String, Object>
		authSuggestUpdate(HttpServletRequest request, @ModelAttribute SuggestDto dto){
		service.updateSuggest(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
		
	}
	
	// 한 줄 게시판 삭제 요청처리
	@RequestMapping("/suggest/delete")
	public ModelAndView 
		authSuggestDelete(HttpServletRequest request,
				@RequestParam int num){
		service.deleteSuggest(num, request);
		return new ModelAndView("redirect:/suggest/list.go");
	}
}
