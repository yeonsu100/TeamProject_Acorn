package com.team.project.todo.service;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.todo.dto.TodoDto;

public interface TodoService {
	public void getList(ModelAndView mView);
	public void deleteDoing(int num);
	public void addDoing(TodoDto dto);
	public void getDoing(ModelAndView mView, int num);
	public void updateDoing(TodoDto dto);
}