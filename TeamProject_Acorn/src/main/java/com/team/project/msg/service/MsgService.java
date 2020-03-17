package com.team.project.msg.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.project.msg.dto.MsgDto;

public interface MsgService {
	// 메시지 목록 메소드
	public void list(HttpServletRequest request);
	// 메시지 자세히 보기
	public void detail(HttpServletRequest request);
	// 메시지 보내기
	public void sendMsg(HttpServletRequest request, MsgDto dto);
	// 안 읽은 메시지 있는지 검색해서 안읽은 개수 찾아오기
	public Map<String, Object> checkNewMsg(HttpServletRequest request);
}
