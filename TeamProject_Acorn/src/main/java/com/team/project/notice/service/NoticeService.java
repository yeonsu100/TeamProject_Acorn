package com.team.project.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.notice.dto.NoticeDto;

public interface NoticeService {
	// 글 목록 메소드
	public void list(HttpServletRequest request);
	// 글 추가 메소드
	public void addContent(HttpServletRequest request, NoticeDto dto);
	// 글 삭제 메소드
	public void deleteContent(int num, HttpServletRequest request);
	// 글 검색 메소드
	public void showContent(int num, ModelAndView mView);
	// 글 자세히 보기
	public void detail(HttpServletRequest request);
	
}
