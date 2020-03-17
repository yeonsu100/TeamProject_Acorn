package com.team.project.done.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.done.dto.DoneDto;

@Repository
public class DoneDaoImpl implements DoneDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<DoneDto> getList() {
		List<DoneDto> list=session.selectList("done.getList");
		return list;
	}

	@Override
	public void delete(int num) {
		session.delete("done.delete", num);
	}

	@Override
	public void insert(DoneDto dto) {
		session.insert("done.insert", dto);
	}

	@Override
	public DoneDto getData(int num) {
		DoneDto dto=session.selectOne("done.getData", num);
		return dto;
	}

	@Override
	public void update(DoneDto dto) {
		session.update("done.update", dto);
	}

}
