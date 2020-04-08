package com.team.project.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dto.BoardCommentDto;
import com.team.project.board.dto.BoardDto;

public interface BoardService {
	public void getList(HttpServletRequest request);
	public void saveContent(BoardDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num, HttpServletRequest request);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(BoardDto dto, HttpServletRequest request);
	//원글 조회수 증가 메소드
	public void addViewCount(int num);
	public void saveComment(HttpServletRequest request);
	public void deleteComment(int num);
	public void updateComment(BoardCommentDto dto);
	//댓글 빼는 메소드
	public void minusCountComment(int num);
	
}
