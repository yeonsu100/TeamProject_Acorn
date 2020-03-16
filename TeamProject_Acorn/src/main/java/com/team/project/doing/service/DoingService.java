package com.team.project.doing.service;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.doing.dto.DoingDto;

public interface DoingService {
	public void getList(ModelAndView mView);
	public void deleteDoing(int num);
	public void addDoing(DoingDto dto);
	public void getDoing(ModelAndView mView, int num);
	public void updateDoing(DoingDto dto);
}