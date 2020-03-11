package com.team.project.msg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.msg.dto.MsgDto;

@Repository
public class MsgDaoImpl implements MsgDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int getCount(MsgDto dto) {
		
		// 검색 조건에 맞는 파일의 전체 갯수를 select 해서
		int count=session.selectOne("msg.getCount", dto);
		// 리턴한다.
		return count;
	}

	@Override
	public List<MsgDto> getList(MsgDto dto) {
		List<MsgDto> list=session.selectList("msg.getList", dto);
		return list;
	}

	@Override
	public MsgDto getData(MsgDto dto) {
		dto=session.selectOne("msg.getData", dto);
		return dto;
	}

	@Override
	public void checkRead(MsgDto dto) {
		session.update("msg.checkRead", dto);
	}

	@Override
	public void sendMsg(MsgDto dto) {
		session.insert("msg.sendMsg", dto);
	}
	
}
