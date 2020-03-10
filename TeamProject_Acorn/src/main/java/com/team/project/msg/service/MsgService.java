package com.team.project.msg.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MsgService {
	// 글 목록 메소드
	public void list(HttpServletRequest request);
}
