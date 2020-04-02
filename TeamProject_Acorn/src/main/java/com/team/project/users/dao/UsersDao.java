package com.team.project.users.dao;

import java.util.List;

import com.team.project.users.dto.UsersDto;

public interface UsersDao {
	public boolean isIdExist(String inputId);
	public boolean isUserExist(int inputEmpno);
	public void insertUser(UsersDto dto);
	public void insertEmp(UsersDto dto);
	public String getPwdHash(String inputId);
	public UsersDto getData(String id);
	public String getEname(String pnum);
	public String getIsAdmin(String inputId);
	public int getEmpno(String pnum);
	public String getProfile(String inputId);
	public void updateProfile(UsersDto dto);
	public void updatePwd(UsersDto dto);
	public int getCount(UsersDto dto);
	public List<UsersDto> getList(UsersDto dto);
	public void deleteUser(int empno);
	public void deleteEmp(int empno);
}
