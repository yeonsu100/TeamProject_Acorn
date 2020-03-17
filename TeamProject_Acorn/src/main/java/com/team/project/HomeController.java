package com.team.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {	
	@RequestMapping("/home.go")
	public String home(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String url;
		if(id==null) {
			url="users/loginform";
		}else {
			url="home";
		}
		return url;
	}
}
