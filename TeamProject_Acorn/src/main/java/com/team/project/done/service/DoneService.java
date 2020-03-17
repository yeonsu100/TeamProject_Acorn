package com.team.project.done.service;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.done.dto.DoneDto;

public interface DoneService {
	public void getList(ModelAndView mView);
	public void deleteDone(int num);
	public void addDone(DoneDto dto);
	public void getDone(ModelAndView mView, int num);
	public void updateDone(DoneDto dto);
}