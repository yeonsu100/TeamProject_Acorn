package com.team.project.suggest.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.suggest.dto.SuggestDto;

@Repository
public class SuggestDaoImpl implements SuggestDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<SuggestDto> getList(SuggestDto dto) {
		List<SuggestDto> list=session.selectList("suggest.getList",dto);
		return list;
	}

	@Override
	public int getCount(SuggestDto dto) {
		// 건의 게시판 글의 전체 갯수를 가져온다.
		int count=session.selectOne("suggest.getCount", dto);
		return count;
	}

	@Override
	public void insert(SuggestDto dto) {
		session.insert("suggest.insert", dto);
	}

	@Override
	public void update(SuggestDto dto) {
		session.update("suggest.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("suggest.delete", num);
	}

	@Override
	public SuggestDto getData(int num) {
		SuggestDto dto=session.selectOne("suggest.getData", num);
		return dto;
	}
}
