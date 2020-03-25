package com.team.project.board.dao;

import java.util.List;

import com.team.project.board.dto.BoardCommentDto;

public interface BoardCommentDao {
	public List<BoardCommentDto> getList(BoardCommentDto dto);
	public int getCount(BoardCommentDto dto);
	public void delete(int num);
	public void insert(BoardCommentDto dto);
	public int getSequence();
	public void update(BoardCommentDto dto);
}
