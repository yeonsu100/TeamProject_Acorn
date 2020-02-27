package com.team.project.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dao.BoardDao;
import com.team.project.board.dto.BoardCommentDto;
import com.team.project.board.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;

	@Override
	public void getList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveContent(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getUpdateData(ModelAndView mView, int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateContent(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(BoardCommentDto dto) {
		// TODO Auto-generated method stub
		
	}
}
