package com.team.project.msg.dao;

import java.util.List;

import com.team.project.msg.dto.MsgDto;

public interface MsgDao {
	// 메시지 갯수
	public int getCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getList(MsgDto dto);
	// 메시지 갯수
	public int getSentCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getSentList(MsgDto dto);
	// 메시지 갯수
	public int getSavedCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getSavedList(MsgDto dto);
	// 메시지 데이터 읽어오기
	public MsgDto getData(MsgDto dto);
	// 메시지 최초 읽은시간 기록
	public void checkRead(MsgDto dto);
	// 메시지 보내기(테이블에 추가)
	public void sendMsg(MsgDto dto);
	// 접속된 아이디의 안읽은 메시지 개수 읽어오기
	public int getUnreadCount(MsgDto dto);
}
