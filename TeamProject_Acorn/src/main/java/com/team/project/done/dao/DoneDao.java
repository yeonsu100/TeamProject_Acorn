package com.team.project.done.dao;

import java.util.List;

import com.team.project.done.dto.DoneDto;

public interface DoneDao {
	public List<DoneDto> getList(); 
	public void delete(int num);
	public void insert(DoneDto dto);
	public DoneDto getData(int num);
	public void update(DoneDto dto);
}