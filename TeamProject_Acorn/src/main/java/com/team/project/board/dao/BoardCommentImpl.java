package com.team.project.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.board.dto.BoardCommentDto;

@Repository
public class BoardCommentImpl implements BoardCommentDao{
	
	@Autowired
	private SqlSession session;
	//인자로 전달된 그룹번호(원글의 글번호)에 해당되는 댓글 목록 얻어오기
	
	@Override
	public List<BoardCommentDto> getList(int ref_group) {
		return session.selectList("boardComment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
		session.update("boardComment.delete", num);
	}

	@Override
	public void insert(BoardCommentDto dto) {
		session.insert("boardComment.insert", dto);
	}
	//저장할 댓글의 글번호를 리턴하는 메소드
	@Override
	public int getSequence() {
		//시퀀스의 값을 얻어내서 리턴
		int seq=session.selectOne("boardComment.getSequence");
		return seq;
	}

	@Override
	public void update(BoardCommentDto dto) {
		session.update("boardComment.update", dto);
	}

}
