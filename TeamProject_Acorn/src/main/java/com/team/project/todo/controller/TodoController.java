package com.team.project.todo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.todo.dao.TodoDao;
import com.team.project.todo.dto.TodoDto;

@Controller
public class TodoController {
	@Autowired
	private TodoDao dao;
	
	@RequestMapping("/mytrello/todo/list")
	public ModelAndView list(ModelAndView mView) {
		List<TodoDto> list=dao.getList();
		mView.addObject("list", list);
		mView.setViewName("mytrello/todo/list");
		return mView;
	}
	
	@RequestMapping("/mytrello/todo/delete")
	public String delete(@RequestParam int num) {
		dao.delete(num);
		return "redirect:/mytrello/todo/list.go";
	}
	
	@RequestMapping("/mytrello/todo/insertform")
	public String insertform() {
		return "mytrello/todo/insertform";
	}
	
	@RequestMapping("/mytrello/todo/insert")
	public ModelAndView insert(@ModelAttribute("dto") TodoDto dto,
			ModelAndView mView) {
		dao.insert(dto);
		mView.setViewName("mytrello/todo/insert"); 
		return mView;
	}
	
	@RequestMapping("/mytrello/todo/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		TodoDto dto=dao.getData(num);
		mView.addObject("dto", dto);
		mView.setViewName("mytrello/todo/updateform");
		return mView;
	}
	
	@RequestMapping("/mytrello/todo/update")
	public ModelAndView update(@ModelAttribute("dto") TodoDto dto,
			ModelAndView mView) {
		dao.update(dto);
		mView.setViewName("mytrello/todo/update");
		return mView;
	}
}