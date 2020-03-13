package com.team.project.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dto.BoardCommentDto;
import com.team.project.board.dto.BoardDto;
import com.team.project.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	//글 목록 요청처리
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request) {
		//HttpServletRequest 객체를 서비스에 넘겨주면서 비즈니스 로직 수행
		service.getList(request);
		
		//view page 로 forward 이동, 글 목록 출력
		return new ModelAndView("board/list");
		
	}
	//새글 추가 폼 요청 처리
	@RequestMapping("/board/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
	
		return new ModelAndView("board/insertform");
	}
	//새글 추가 요청 처리
	@RequestMapping(value="/board/insert", method=RequestMethod.POST)
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute BoardDto dto) {
		//세션에 있는 글작성자의 아이디
				String writer=(String)
						request.getSession().getAttribute("id");
				//BoardDto 객체에 담고 
				dto.setWriter(writer);
				//서비스를 이용해서 DB 에 저장
				service.saveContent(dto);
				//글 목록 보기로 리다일렉트 이동 
				return new ModelAndView("redirect:/board/list.go");
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/board/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		//view page로 forward 이동해서 글 자세히 보기
		return "board/detail";
	}
	//원글 삭제 요청 처리
	@RequestMapping("/board/delete")
	public ModelAndView authDelete(HttpServletRequest request, @RequestParam int num) {
		//서비스를 이용하여 글 삭제
		service.deleteContent(num, request);
		//글 목록 보기로 redirect move
		return new ModelAndView("redirect:/board/list.go");	
	}
	@RequestMapping("board/updateform")
	public ModelAndView authUpdateform(HttpServletRequest request,
			@RequestParam int num, ModelAndView mView) {
		//수정할 글정보 ModelAndView 객체 담기
		service.getUpdateData(mView, num);
		mView.setViewName("board/updateform");
		return mView;
	}
	//원글 수정 반영 요청 처리
		@RequestMapping(value="/board/update",
				method=RequestMethod.POST)
		public ModelAndView 
			authUpdate(HttpServletRequest request,
					@ModelAttribute BoardDto dto){
			//서비스를 이용해서 수정 반영한다.
			service.updateContent(dto);

			//글 자세히 보기로 리다일렉트 이동 
			return new ModelAndView
				("redirect:/board/detail.go?num="+dto.getNum());
		}
		
		//댓글 저장 요청 처리
		@RequestMapping(value= "/board/comment_insert", 
				method = RequestMethod.POST)
		public ModelAndView authCommentInsert(HttpServletRequest request,
				@RequestParam int ref_group) {
			service.saveComment(request);
			return new ModelAndView("redirect:/board/detail.go?num="+ref_group);
		}
		
		//댓글 수정 요청 처리
		@ResponseBody
		@RequestMapping("/board/comment_update")
		public Map<String, Object>
			authCommentUpdate(HttpServletRequest request, @ModelAttribute BoardCommentDto dto){
			service.updateComment(dto);
			Map<String, Object> map=new HashMap<>();
			map.put("isSuccess", true);
			return map;
		}
		
		//댓글 삭제 요청 처리
		@ResponseBody
		@RequestMapping("/board/comment_delete")
		public Map<String , Object>
			authCommentDelete(HttpServletRequest request,
					@RequestParam int num){
			
			service.deleteComment(num);
			
			Map<String, Object> map=new HashMap<>();
			map.put("isSuccess", true);
			return map; // {"isSuccess":true} 형식의 JSON 문자열이 응답된다.
		}
}