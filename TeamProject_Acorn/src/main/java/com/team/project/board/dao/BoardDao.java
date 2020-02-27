package com.team.project.board.dao;

import java.util.List;

import com.team.project.board.dto.BoardDto;

public interface BoardDao {
	//글의 갯수
	public int getCount(BoardDto dto);
	//글의 목록
	public List<BoardDto> getList(BoardDto dto);
	//글 추가 
	public void insert(BoardDto dto);
	//글 정보 얻어오기 
	public BoardDto getData(BoardDto dto);
	//조회수 증가 시키기 
	public void addViewCount(int num);
	//글 삭제 
	public void delete(int num);
	//글 하나의 정보 
	public BoardDto getData(int num);
	//글 수정 
	public void update(BoardDto dto);
}
