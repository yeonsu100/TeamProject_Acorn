package com.team.project.doing.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.doing.dto.DoingDto;

@Repository
public class DoingDaoImpl implements DoingDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<DoingDto> getList() {
		List<DoingDto> list=session.selectList("doing.getList");
		return list;
	}
}
