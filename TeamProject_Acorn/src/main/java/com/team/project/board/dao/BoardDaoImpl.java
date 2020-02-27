package com.team.project.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.board.dto.BoardDto;


@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardDto getData(BoardDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addViewCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}
}
