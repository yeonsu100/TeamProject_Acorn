package com.team.project.doing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/mytrello/doing/delete")
	public String delete(@RequestParam int num) {
		dao.delete(num);
		return "redirect:/mytrello/doing/list.go";
	}
	
	@RequestMapping("/mytrello/doing/insertform")
	public String insertform() {
		return "mytrello/doing/insertform";
	}
	
	@RequestMapping("/mytrello/doing/insert")
	public ModelAndView insert(@ModelAttribute("dto") DoingDto dto,
			ModelAndView mView) {
		dao.insert(dto);
		mView.setViewName("mytrello/doing/insert"); 
		return mView;
	}
	
	@RequestMapping("/mytrello/doing/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		DoingDto dto=dao.getData(num);
		mView.addObject("dto", dto);
		mView.setViewName("mytrello/doing/updateform");
		return mView;
	}
	
	@RequestMapping("/mytrello/doing/update")
	public ModelAndView update(@ModelAttribute("dto") DoingDto dto,
			ModelAndView mView) {
		dao.update(dto);
		mView.setViewName("mytrello/doing/update");
		return mView;
	}
}