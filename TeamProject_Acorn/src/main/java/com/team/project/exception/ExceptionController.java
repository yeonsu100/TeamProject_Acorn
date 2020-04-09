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
	@ExceptionHandler(CanNotDeleteException.class)
	public ModelAndView deleteForbidden() {
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "게시글 삭제 권한이 없습니다!");
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
	
	// notice insertform.go Exception 
	@ResponseStatus(HttpStatus.FORBIDDEN)
	@ExceptionHandler(AccessException.class)
	public ModelAndView insertForbidden() {
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "관리자만 작성할 수 있습니다.");
		mView.setViewName("error/forbidden");
		return mView;
	}
	
	@ResponseStatus(HttpStatus.FORBIDDEN)
	@ExceptionHandler(UpdateException.class)
	public ModelAndView UpdateForbidden() {
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "게시글 수정 권한이 없습니다!");
		mView.setViewName("error/forbidden");
		return mView;
	}
	
	// emp main.go Exception 
	@ResponseStatus(HttpStatus.FORBIDDEN)
	@ExceptionHandler(AdminAccessException.class)
	public ModelAndView AccessForbidden() {
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "접근 권한이 없습니다!");
		mView.setViewName("error/forbidden");
		return mView;
	}
}
