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
	
	// 글목 록 
	@Override
	public List<SuggestDto> getList(SuggestDto dto) {
		List<SuggestDto> list=session.selectList("suggest.getList",dto);
		return list;
	}

	// 글 갯수
	@Override
	public int getCount(SuggestDto dto) {
		int count=session.selectOne("suggest.getCount", dto);
		return count;
	}
	
	// 글 작성
	@Override
	public void insert(SuggestDto dto) {
		session.insert("suggest.insert", dto);
	}

	// 글 수정
	@Override
	public void update(SuggestDto dto) {
		session.update("suggest.update", dto);
	}
	
	// 글 삭제
	@Override
	public void delete(int num) {
		session.delete("suggest.delete", num);
	}
	
	// 글 하나의 정보
	@Override
	public SuggestDto getData(int num) {
		SuggestDto dto=session.selectOne("suggest.getData", num);
		return dto;
	}
}
