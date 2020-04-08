package com.team.project.users.dao;

import java.util.List;

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
		String savedPwd=session.selectOne("users.getPwdHash", inputId);
		return savedPwd;
	}
	
	@Override
	public String getIsAdmin(String inputId) {
		String savedIsAdmin=session.selectOne("users.getIsAdmin", inputId);
		return savedIsAdmin;
	}
	
	@Override
	public String getProfile(String inputId) {
		String savedProfile=session.selectOne("users.getProfile", inputId);
		return savedProfile;
	};
	
	@Override
	public String getEname(String pnum) {
		String savedEname=session.selectOne("users.getEname", pnum);
		return savedEname;
	}
	
	@Override
	public int getEmpno(String pnum) {
		int savedEmpno=session.selectOne("users.getEmpno", pnum);
		return savedEmpno;
	}

	@Override
	public boolean isIdExist(String inputId) {
		String id=session.selectOne("users.isIdExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public boolean isPnumExist(String inputPnum) {
		String pnum=session.selectOne("users.isPnumExist", inputPnum);
		if(pnum==null) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public boolean isUserExist(int inputEmpno) {
		String userid=session.selectOne("users.isUserExist", inputEmpno);
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
	public int getCount(UsersDto dto) {
		return session.selectOne("users.getCount", dto);
	}

	@Override
	public List<UsersDto> getList(UsersDto dto) {
		List<UsersDto> list=session.selectList("users.getList", dto);
		return list;
	}

	@Override
	public void deleteUser(int empno) {
		session.delete("users.deleteUser", empno);
	}

	@Override
	public void deleteEmp(int empno) {
		session.delete("users.deleteEmp", empno);
	}

	
}
