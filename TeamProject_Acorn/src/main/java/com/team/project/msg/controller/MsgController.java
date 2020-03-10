package com.team.project.msg.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.msg.service.MsgService;

@Controller
public class MsgController {
	@Autowired 
	private MsgService service;
	
	//메시지 목록보기 
	@RequestMapping("/msg/list")
	public ModelAndView list(ModelAndView mView,
			HttpServletRequest request) {
	//메시지 목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
	service.list(request);
	mView.setViewName("msg/list");
	return mView;
	}
	
}
