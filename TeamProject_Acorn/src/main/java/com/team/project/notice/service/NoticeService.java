package com.team.project.notice.service;

import javax.servlet.http.HttpServletRequest;

import com.team.project.notice.dto.NoticeDto;

public interface NoticeService {
	// 글 목록 메소드
	public void list(HttpServletRequest request);
	// 글 추가 메소드
	public void addContent(HttpServletRequest request, NoticeDto dto);
}
