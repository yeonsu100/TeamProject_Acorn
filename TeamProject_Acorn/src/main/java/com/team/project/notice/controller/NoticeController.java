package com.team.project.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.notice.service.NoticeService;

public class NoticeController {
	@Autowired
	private NoticeService service;
	
	// 파일 목록보기 
	@RequestMapping("/notice/list")
	public ModelAndView list(ModelAndView mView,
			HttpServletRequest request) {
		// 파일 목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		
		mView.setViewName("notice/list");
		return mView;
	}
}
