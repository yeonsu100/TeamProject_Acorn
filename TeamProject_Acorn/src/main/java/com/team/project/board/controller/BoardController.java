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
	
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request) {
		service.getList(request);
		return new ModelAndView("board/list");
	}
	
	@RequestMapping("/board/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		return new ModelAndView("board/insertform");
	}
	
	@RequestMapping(value="/board/insert", method=RequestMethod.POST)
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute BoardDto dto) {
				String writer=(String)
						request.getSession().getAttribute("id");
				dto.setWriter(writer);
				service.saveContent(dto);
				return new ModelAndView("redirect:/board/list.go");
	}
	
	@RequestMapping("/board/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "board/detail";
	}

	@RequestMapping("/board/delete")
	public ModelAndView authDelete(HttpServletRequest request, @RequestParam int num) {
		service.deleteContent(num, request);
		return new ModelAndView("redirect:/board/list.go");	
	}
	
	@RequestMapping("board/updateform")
	public ModelAndView authUpdateform(HttpServletRequest request,
			@RequestParam int num, ModelAndView mView) {
		service.getUpdateData(mView, num);
		mView.setViewName("board/updateform");
		return mView;
	}
	
		@RequestMapping(value="/board/update",
				method=RequestMethod.POST)
		public ModelAndView 
			authUpdate(HttpServletRequest request,
					@ModelAttribute BoardDto dto){
			service.updateContent(dto);
			return new ModelAndView
				("redirect:/board/detail.go?num="+dto.getNum());
		}
		
		@RequestMapping(value= "/board/comment_insert", 
				method = RequestMethod.POST)
		public ModelAndView authCommentInsert(HttpServletRequest request,
				@RequestParam int ref_group){
			service.saveComment(request);
			return new ModelAndView("redirect:/board/detail.go?num="+ref_group);
		}
		
		@ResponseBody
		@RequestMapping("/board/comment_update")
		public Map<String, Object>
			authCommentUpdate(HttpServletRequest request, @ModelAttribute BoardCommentDto dto){
			service.updateComment(dto);
			Map<String, Object> map=new HashMap<>();
			map.put("isSuccess", true);
			return map;
		}
		 
		@ResponseBody
		@RequestMapping("/board/comment_delete")
		public Map<String , Object>
			authCommentDelete(HttpServletRequest request,
					@RequestParam int num){

			int ref_group=Integer.parseInt(request.getParameter("ref_group"));
			service.deleteComment(num);
			service.minusCountComment(ref_group);
			
			Map<String, Object> map=new HashMap<>();
			map.put("isSuccess", true);
			return map;
		}
		
}