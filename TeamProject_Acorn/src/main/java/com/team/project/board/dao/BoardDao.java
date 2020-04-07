package com.team.project.board.dao;

import java.util.List;

import com.team.project.board.dto.BoardDto;

public interface BoardDao {
	public int getCount(BoardDto dto);
	public List<BoardDto> getList(BoardDto dto);
	public void insert(BoardDto dto);
	public BoardDto getData(BoardDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public BoardDto getData(int num);
	public void update(BoardDto dto);
	public void addCountComment(int num);
	public void minusCountComment(int num);	
}
