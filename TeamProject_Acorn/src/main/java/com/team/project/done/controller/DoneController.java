package com.team.project.done.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.done.dao.DoneDao;
import com.team.project.done.dto.DoneDto;

@Controller
public class DoneController {
	@Autowired
	private DoneDao dao;
	
	@RequestMapping("/mytrello/done/list")
	public ModelAndView list(ModelAndView mView) {
		List<DoneDto> list=dao.getList();
		mView.addObject("list", list);
		mView.setViewName("mytrello/done/list");
		return mView;
	}
	
	@RequestMapping("/mytrello/done/delete")
	public String delete(@RequestParam int num) {
		dao.delete(num);
		return "redirect:/mytrello/done/list.go";
	}
	
	@RequestMapping("/mytrello/done/insertform")
	public String insertform() {
		return "mytrello/done/insertform";
	}
	
	@RequestMapping("/mytrello/done/insert")
	public ModelAndView insert(@ModelAttribute("dto") DoneDto dto,
			ModelAndView mView) {
		dao.insert(dto);
		mView.setViewName("mytrello/done/insert"); 
		return mView;
	}
	
	@RequestMapping("/mytrello/done/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		DoneDto dto=dao.getData(num);
		mView.addObject("dto", dto);
		mView.setViewName("mytrello/done/updateform");
		return mView;
	}
	
	@RequestMapping("/mytrello/done/update")
	public ModelAndView update(@ModelAttribute("dto") DoneDto dto,
			ModelAndView mView) {
		dao.update(dto);
		mView.setViewName("mytrello/done/update");
		return mView;
	}
}