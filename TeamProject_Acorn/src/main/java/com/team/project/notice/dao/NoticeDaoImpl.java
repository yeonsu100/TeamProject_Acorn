package com.team.project.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSession session;
	
	//  글 갯수 메소드
	@Override
	public int getCount(NoticeDto dto) {
		// 검색 조건에 맞는 파일의 전체 갯수를 select 해서
		int count=session.selectOne("notice.getCount", dto);
				// 리턴한다.
		return count;
	}
	
	// 글목록 출력 메소드
	@Override
	public List<NoticeDto> getList(NoticeDto dto) {
		List<NoticeDto> list=session.selectList("notice.getList", dto);
		return list;
	}
	
	// 글 추가 메소드
	@Override
	public void insert(NoticeDto dto) {
		session.insert("notice.insert", dto);
	}
	
	// 글삭제 메소드
	@Override
	public void delete(int num) {
		session.delete("notice.delete", num);
	}

	// 글 하나의 정보 
	@Override
	public NoticeDto getData(NoticeDto dto) {
		dto=session.selectOne("notice.getData2", dto.getNum());
		return dto;
	}

	@Override
	public void update(NoticeDto dto) {
		session.update("notice.update", dto);
	}

	@Override
	public NoticeDto getDate(int num) {
		NoticeDto dto=session.selectOne("notice.getData2", num);
		return dto;
	}

}
