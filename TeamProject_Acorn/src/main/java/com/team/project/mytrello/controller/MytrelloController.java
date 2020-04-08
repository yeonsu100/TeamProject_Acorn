package com.team.project.mytrello.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MytrelloController {
	@RequestMapping("/mytrello/list")
	public ModelAndView authlist(ModelAndView mView, HttpServletRequest request) {
		return mView;
	}
}
