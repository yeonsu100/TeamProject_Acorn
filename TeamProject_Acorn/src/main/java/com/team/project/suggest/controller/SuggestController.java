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
		String profile=(String)request.getSession().getAttribute("profile");
		dto.setSugId(sugId);
		dto.setProfile(profile);
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
		//서비스를 이용해서 글을 삭제하기 
		service.deleteSuggest(num, request);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/suggest/list.go");
	}
}
