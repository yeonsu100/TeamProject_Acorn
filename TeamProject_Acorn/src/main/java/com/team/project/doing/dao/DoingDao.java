package com.team.project.doing.dao;

import java.util.List;

import com.team.project.doing.dto.DoingDto;

public interface DoingDao {
	public List<DoingDto> getList(); 
	public void delete(int num);
	public void insert(DoingDto dto);
	public DoingDto getData(int num);
	public void update(DoingDto dto);
}