package com.team.project.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.todo.dao.TodoDao;
import com.team.project.todo.dto.TodoDto;

@Service
public class TodoServiceImpl implements TodoService {
	@Autowired
	private TodoDao dao;

	@Override
	public void getList(ModelAndView mView) {
		List<TodoDto> list=dao.getList();
		mView.addObject("list", list);
	}

	@Override
	public void deleteDoing(int num) {
		dao.delete(num);
	}

	@Override
	public void addDoing(TodoDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getDoing(ModelAndView mView, int num) {
		TodoDto dto=dao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void updateDoing(TodoDto dto) {
		dao.update(dto);
	}

}