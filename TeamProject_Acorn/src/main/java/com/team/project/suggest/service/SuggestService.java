package com.team.project.suggest.service;

import javax.servlet.http.HttpServletRequest;

import com.team.project.suggest.dto.SuggestDto;



public interface SuggestService {
	// 글 목록 메소드
	public void list(HttpServletRequest request);
	// 글 추가 메소드
	public void addSuggest(HttpServletRequest request, SuggestDto dto);
}
