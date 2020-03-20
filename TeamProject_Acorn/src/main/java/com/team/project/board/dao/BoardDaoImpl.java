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
		return session.selectOne("board.getCount", dto);
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		return session.selectList("board.getList", dto);
	}

	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert", dto);
	}

	@Override
	public BoardDto getData(BoardDto dto) {
		return session.selectOne("board.getData", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("board.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("board.delete", num);
	}

	@Override
	public BoardDto getData(int num) {
		return session.selectOne("board.getData2", num);
	}

	@Override
	public void update(BoardDto dto) {
		session.update("board.update", dto);
	}

	@Override
	public void addCountComment(int num) {
		session.update("board.addCountComment", num);

	}

	@Override
	public void minusCountComment(int num) {
		session.update("board.minusCountComment", num);
		
	}
}
