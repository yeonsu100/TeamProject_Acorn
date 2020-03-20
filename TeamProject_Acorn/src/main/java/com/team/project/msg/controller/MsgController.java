package com.team.project.msg.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.msg.dto.MsgDto;
import com.team.project.msg.service.MsgService;

@Controller
public class MsgController {
	@Autowired 
	private MsgService service;
	
	//메시지 보관하기
	@RequestMapping(value="/msg/checksaved", method=RequestMethod.POST)
	public String save(HttpServletRequest request) {
		service.checkSaved(request);
		return "msg/checksaved";
	}
	
	//안읽은 메시지 개수 체크
	@ResponseBody
	@RequestMapping("/msg/checknewmsg")
	public Map<String, Object> checkNewMsg(HttpServletRequest request){
		Map<String, Object> map=service.checkNewMsg(request);
		return map;
	}
	
	//받은메시지 목록보기 
	@RequestMapping("/msg/list")
	public ModelAndView list(ModelAndView mView,
			HttpServletRequest request) {
	//메시지 목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
	service.list(request);
	mView.setViewName("msg/list");
	return mView;
	}
	
	//메시지 내용 보기
	@RequestMapping("/msg/detail")
	public String detail(HttpServletRequest request){
		service.detail(request);
		//view page 로 forward 이동
		return "msg/detail";
	}
	//메시지 작성폼 요청
	@RequestMapping("/msg/sendform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		return new ModelAndView("msg/sendform");
	}
	//메시지 전송 요청
	@RequestMapping(value = "/msg/send", method = RequestMethod.POST )
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute MsgDto dto) {
		//보내는사람 아이디(접속자) session에서 얻어오기
		String idSend=(String)request.getSession().getAttribute("id");
		dto.setIdSend(idSend);
		service.sendMsg(dto);
		return new ModelAndView("msg/send");
	}
}
