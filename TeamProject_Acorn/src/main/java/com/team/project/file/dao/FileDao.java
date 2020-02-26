package com.team.project.file.dao;

import java.util.List;

import com.team.project.file.dto.FileDto;

public interface FileDao {
	public int getCount(FileDto dto);
	public List<FileDto> getList(FileDto dto);
	public void insert(FileDto dto);
	public FileDto getData(int num);
	public void addDownCount(int num);
	public void delete(int num);
}
