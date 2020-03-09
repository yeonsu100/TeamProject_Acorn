package com.team.project.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public String getPwdHash(String inputId) {
		//입력한 아이디를 이용해서 저장된 비밀번호를 select 한다.
		//만일 존재하지 않는 아이디 이면 null 이다.
		String savedPwd=session.selectOne("users.getPwdHash", inputId);
		//select 된 비밀번호를 리턴해준다. 
		return savedPwd;
	}
	
	@Override
	public String getProfile(String inputId) {
		String savedProfile=session.selectOne("users.getProfile", inputId);
		return savedProfile;
	};
	
	@Override
	public String getEname(String pnum) {
		//입력한 전화번호를 이용해서 저장된 사원명을 select
		//존재하지않으면 null
		String savedEname=session.selectOne("users.getEname", pnum);
		//select된 사원명을 리턴
		return savedEname;
	}
	
	@Override
	public int getEmpno(String pnum) {
		//입력한 전화번호를 이용해서 저장된 사원의 사원번호 select
		int savedEmpno=session.selectOne("users.getEmpno", pnum);
		return savedEmpno;
	}

	@Override
	public boolean isIdExist(String inputId) {
		//인자로 전달되는 아이디를 이용해서 select 를 한다.
		String id=session.selectOne("users.isIdExist", inputId);
		//만일 select 된 결과가 null 이면 존재하지 않는 아이디이다.
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public boolean isUserExist(int inputEmpno) {
		//인자로 전달되는 사번을 이용해서 userid select
		String userid=session.selectOne("users.isUserExist", inputEmpno);
		//만일 select 결과가 있으면 이미 가입한 사원이다
		if(userid==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insertUser(UsersDto dto) {
		session.insert("users.insertUser", dto);
	}
	
	@Override
	public void insertEmp(UsersDto dto) {
		session.insert("users.insertEmp", dto);
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public void updateProfile(UsersDto dto) {
		session.update("users.updateProfile", dto);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.updatePwd", dto);
	}

	@Override
	public void updateUser(UsersDto dto) {
		session.update("users.updateUser", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}
}
