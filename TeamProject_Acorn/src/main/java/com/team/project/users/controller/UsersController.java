package com.team.project.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.dto.UsersDto;
import com.team.project.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	//개인 정보 보기 요청 처리
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpServletRequest request, 
				ModelAndView mView) {
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
		//UsersService 객체를 이용해서 개인정보를 ModelAndView 객체에 담기도록 한다.
		service.showInfo(id, mView);
		//view page 정보를 담고 
		mView.setViewName("users/info");
		return mView;//ModelAndView 객체를 리턴해주기 
	}
		
	//사원추가 폼 요청처리
	@RequestMapping("/emp/insertform")
	public String emp_insert_form() {
		return "emp/insertform";
	}
	
	//사원여부 체크 폼 요청 처리 
	@RequestMapping("/users/signup_checkform")
	public String signup_checkform() {
		return "users/signup_checkform";
	}
	
	//회원가입 폼 요청 처리 
	@RequestMapping("/users/signup_form")
	public String signup_form() {
		return "users/signup_form";
	}
	
	//사용가능 userid 여부 체크
	@ResponseBody
	@RequestMapping("/users/checkid")
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.isExistId(inputId);
		return map;
	}
	
	//사원 추가 요청 처리
	@RequestMapping(value = "/emp/insert", method = RequestMethod.POST)
	public ModelAndView empInsert(@ModelAttribute("dto") UsersDto dto, 
			ModelAndView mView, HttpSession session) {
		service.addEmp(dto);
		mView.setViewName("emp/insert");
		return mView;
	}
	
	//회원가입 요청 처리 
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto,
			ModelAndView mView, HttpSession session) {
		service.addUser(dto);
		mView.setViewName("users/insert");
		return mView;
	}
	
	//사원여부 확인 요청 처리
	@RequestMapping(value="/users/signup_check", method=RequestMethod.POST)
	public ModelAndView empcheck(@ModelAttribute UsersDto dto,
			ModelAndView mView, 
			HttpServletRequest request,
			HttpServletResponse response) {
		//목적지 정보
		String url=request.getParameter("url");
		if(url==null){
			url=request.getContextPath()+"/users/signup_form.go";
		}
		//목적지 정보를 미리 인코딩 해 놓는다.
		String encodedUrl=URLEncoder.encode(url);
		// view page 에 전달하기 
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		//입력한 이름과 전화번호가 T_emp테이블에 등록된 정보인지, T_user에 이미 존재하는(이미 가입된)사원인지 확인 
		service.validEmp(dto, request.getSession(), mView);
		
		mView.setViewName("users/signup_check");
		return mView;
	}
	
	
	
	//로그인 폼 요청 처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
		String url=request.getParameter("url");
		if(url==null){//만일 없으면 
			//로그인 성공후에 index 페이지로 보낼수 있도록 구성한다. 
			url=request.getContextPath()+"/home.go";
		}
		//아이디, 비밀번호가 쿠키에 저장되었는지 확인해서 저장 되었으면 폼에 출력한다.
		Cookie[] cookies=request.getCookies();
		//저장된 아이디와 비밀번호를 담을 변수 선언하고 초기값으로 빈 문자열 대입 
		String savedId="";
		String savedPwd="";
		if(cookies != null){
			for(Cookie tmp:cookies){
				if(tmp.getName().equals("savedId")){
					savedId=tmp.getValue();
				}else if(tmp.getName().equals("savedPwd")){
					savedPwd=tmp.getValue();
				}
			}
		}	
		//view page 에서 필요한 정보 넘겨주기 
		request.setAttribute("url", url);
		request.setAttribute("savedId", savedId);
		request.setAttribute("savedPwd", savedPwd);
		return "users/loginform";
	}
	//로그인 요청 처리 
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UsersDto dto,
			ModelAndView mView, 
			HttpServletRequest request,
			HttpServletResponse response) {
		//목적지 정보
		String url=request.getParameter("url");
		if(url==null){
			url=request.getContextPath()+"/home.go";
		}
		//목적지 정보를 미리 인코딩 해 놓는다.
		String encodedUrl=URLEncoder.encode(url);
		// view page 에 전달하기 
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		//아이디 비밀번호 저장 체크박스를 체크 했는지 읽어와 본다.
		String isSave=request.getParameter("isSave");	
		//아이디, 비밀번호를 쿠키에 저장
		Cookie idCook=new Cookie("savedId", dto.getUserid());
		Cookie pwdCook=new Cookie("savedPwd", dto.getPwd());
		if(isSave != null){ // null 이 아니면 체크 한 것이다.
			//한달 동안 저장하기
			idCook.setMaxAge(60*60*24*30);
			pwdCook.setMaxAge(60*60*24*30);
		}else{
			//쿠키 지우기 
			idCook.setMaxAge(0);
			pwdCook.setMaxAge(0);
		}
		//응답할때 쿠키도 심어 지도록 
		response.addCookie(idCook);
		response.addCookie(pwdCook);
		
		service.validUser(dto, request.getSession(), mView);
		
		mView.setViewName("users/login");
		return mView;
	}
	
	//로그아웃처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.go";
	}
}
