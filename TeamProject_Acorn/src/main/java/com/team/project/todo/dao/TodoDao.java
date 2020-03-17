package com.team.project.todo.dao;

import java.util.List;

import com.team.project.todo.dto.TodoDto;

public interface TodoDao {
	public List<TodoDto> getList(); 
	public void delete(int num);
	public void insert(TodoDto dto);
	public TodoDto getData(int num);
	public void update(TodoDto dto);
}