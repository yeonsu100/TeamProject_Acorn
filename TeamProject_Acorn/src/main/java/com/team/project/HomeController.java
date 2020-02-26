package com.team.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {	
	@RequestMapping("/home.go")
	public String home(HttpServletRequest request) {
		return "home";
	}
}
