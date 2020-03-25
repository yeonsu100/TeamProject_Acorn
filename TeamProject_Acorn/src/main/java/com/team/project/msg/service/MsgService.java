package com.team.project.msg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.project.msg.dto.MsgDto;
import com.team.project.users.dto.UsersDto;

public interface MsgService {
	// 받은메시지 목록 메소드
	public void list(HttpServletRequest request);
	// 메시지 자세히 보기
	public void detail(HttpServletRequest request);
	// 메시지 보내기
	public void sendMsg(MsgDto dto);
	// 보관함메시지 삭제
	public int savedDel(HttpServletRequest request);
	// 보낸메시지 삭제
	public int sendDel(HttpServletRequest request);
	// 받은메시지 삭제
	public int recDel(HttpServletRequest request);
	// 안 읽은 메시지 있는지 검색해서 안읽은 개수 찾아오기
	public Map<String, Object> checkNewMsg(HttpServletRequest request);
	// 메시지 보관함에 저장
	public void checkSaved(HttpServletRequest request);
	// 메시지 보낼 아이디 검색
	public void userList(HttpServletRequest request);
	// idlist 받아오기
	public List<UsersDto> getIdList(HttpServletRequest request);
}
