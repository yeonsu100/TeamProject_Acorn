package com.team.project.msg.dao;

import java.util.List;

import com.team.project.msg.dto.MsgDto;

public interface MsgDao {
	// 메시지 갯수
	public int getCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getList(MsgDto dto);
}
