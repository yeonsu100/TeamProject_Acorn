package com.team.project.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	@ResponseStatus(HttpStatus.FORBIDDEN)
//	@ExceptionHandler(CanNotDeleteException.class)
	public ModelAndView forbidden() {
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "Do NOT delete other user's file!");
		mView.setViewName("error/forbidden");
		return mView;
	}

	@ExceptionHandler(DataAccessException.class)
	public ModelAndView dataAccess(DataAccessException dae) {
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", dae);
		mView.setViewName("error/data_access");
		return mView;
	}
}
