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
	//글 삭제 
	public void delete(int num);
	// 글하나의 정보
	public NoticeDto getData(NoticeDto dto);
	public NoticeDto getDate(int num);
	// 글 정보 수정
	public void update(NoticeDto dto);
	// 조회수 증가 시키기
	public int addCount(int num);
}
