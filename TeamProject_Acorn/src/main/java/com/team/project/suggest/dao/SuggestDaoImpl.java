package com.team.project.suggest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SuggestDaoImpl implements SuggestDao{
	@Autowired
	private SqlSession session;
}
