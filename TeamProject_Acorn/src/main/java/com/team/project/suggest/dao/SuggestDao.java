package com.team.project.suggest.dao;

import java.util.List;

import com.team.project.suggest.dto.SuggestDto;

public interface SuggestDao {
	// 글 갯수 가져올 메소드
	public int getCount(SuggestDto dto);
	// 글 목록 출력할 메소드
	public List<SuggestDto> getList(SuggestDto dto);
	// 글 입력 할 메소드
	public void insert(SuggestDto dto);
	// 글 수정 할 메소드
	public void update(SuggestDto dto);
}
