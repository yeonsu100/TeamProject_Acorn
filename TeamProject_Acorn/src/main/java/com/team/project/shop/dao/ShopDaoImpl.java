package com.team.project.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao {
	// 의존객체
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ShopDto> getList() {
		
		
		
		
		
		return session.selectList("shop.getList");
	}

	@Override
	public void minusCount(int num) {
		// 재고의 갯수 줄이기
		session.update("shop.minusCount", num);
	}

	@Override
	public int getPrice(int num) {
		return session.selectOne("shop.getPrice", num);
	}

}
