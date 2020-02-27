package com.team.project.notice.dao;

import java.util.List;

import com.team.project.notice.dto.NoticeDto;

public interface NoticeDao {
	// 글의 갯수
	public int getCount(NoticeDto dto);
	// 글의 목록
	public List<NoticeDto> getList(NoticeDto dto);
	// 글 추가
	public void insert(NoticeDto dto);
}
