package com.team.project.done.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.done.dao.DoneDao;
import com.team.project.done.dto.DoneDto;

@Service
public class DoneServiceImpl implements DoneService {
	@Autowired
	private DoneDao dao;

	@Override
	public void getList(ModelAndView mView) {
		List<DoneDto> list=dao.getList();
		mView.addObject("list", list);
	}

	@Override
	public void deleteDone(int num) {
		dao.delete(num);
	}

	@Override
	public void addDone(DoneDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getDone(ModelAndView mView, int num) {
		DoneDto dto=dao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void updateDone(DoneDto dto) {
		dao.update(dto);
	}
}