package com.team.project.doing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.doing.dao.DoingDao;
import com.team.project.doing.dto.DoingDto;

@Service
public class DoingServiceImpl implements DoingService {
	@Autowired
	private DoingDao dao;

	@Override
	public void getList(ModelAndView mView) {
		List<DoingDto> list=dao.getList();
		mView.addObject("list", list);
	}
}