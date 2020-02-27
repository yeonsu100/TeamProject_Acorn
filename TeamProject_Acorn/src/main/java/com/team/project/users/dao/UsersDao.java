package com.team.project.users.dao;

import com.team.project.users.dto.UsersDto;

public interface UsersDao {
	public boolean isExist(String inputId);
	public void insert(UsersDto dto);
	public String getPwdHash(String inputId);
	public UsersDto getData(String id);
	public String getEname(String pnum);
	public void updateProfile(UsersDto dto);
	public void updatePwd(UsersDto dto);
	public void updateUser(UsersDto dto);
	public void delete(String id);
}