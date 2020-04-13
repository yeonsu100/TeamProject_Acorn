package com.team.project.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.UpdateException;
import com.team.project.exception.AccessException;
import com.team.project.notice.dao.NoticeDao;
import com.team.project.notice.dto.NoticeDto;
import com.team.project.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private NoticeDao noticeDao;
	
	// 파일 목록보기 
	@RequestMapping("/notice/list")
	public ModelAndView authlist(ModelAndView mView,
			HttpServletRequest request) {
		service.list(request);
		mView.setViewName("notice/list");
		return mView;
	}
	
	// 글작성 폼 요청
	@RequestMapping("/notice/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		// Admin이 아니면 insertform.go Exception 발생 
		String isAdmin=(String)request.getSession().getAttribute("isAdmin");
		if(isAdmin==null) {
			throw new AccessException();
		}
		return new ModelAndView("notice/insertform");
	}
	
	// 글작성 요청
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST )
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute NoticeDto dto) {
		String writer=(String)request.getSession().getAttribute("id");
		dto.setWriter(writer);
		service.addContent(request, dto);
		return new ModelAndView("notice/insert");
	}
	
	//원글 삭제 요청 처리
	@RequestMapping("/notice/delete")
	public ModelAndView 
		authDelete(HttpServletRequest request,
				@RequestParam int num){
		service.deleteContent(num, request);
		return new ModelAndView("redirect:/notice/list.go");
	}
	
	// 글 자세히 보기
	@RequestMapping("/notice/detail")
	public String authdetail(HttpServletRequest request){
		service.detail(request);
		return "notice/detail";
	}
	
	// 글 업데이트 폼 요청 처리
	@RequestMapping("/notice/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request,
			ModelAndView mView, @RequestParam int num) {
		// 작성자와 로그인된 아이디가 같지 않으면 업데이트 폼 Exception 발생
		String id=(String)request.getSession().getAttribute("id");
		String writer=noticeDao.getDate(num).getWriter();
		if(!id.equals(writer)) {
			throw new UpdateException();
		}
		service.detail(request);
		mView.setViewName("notice/updateform");
		return mView;
	}
	
	// 글 수정 요청
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(@ModelAttribute NoticeDto dto,
			HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		service.updateContent(dto, request);
		ModelAndView mView =new ModelAndView();
		mView.addObject("num",num);
		mView.setViewName("notice/update");
		return mView;
	}
}
