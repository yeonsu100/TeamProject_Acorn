package com.team.project.doing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.doing.dao.DoingDao;
import com.team.project.doing.dto.DoingDto;

@Controller
public class DoingController {
	@Autowired
	private DoingDao dao;
	
	@RequestMapping("/mytrello/doing/list")
	public ModelAndView list(ModelAndView mView) {
		List<DoingDto> list=dao.getList();
		mView.addObject("list", list);
		mView.setViewName("mytrello/doing/list");
		return mView;
	}
}