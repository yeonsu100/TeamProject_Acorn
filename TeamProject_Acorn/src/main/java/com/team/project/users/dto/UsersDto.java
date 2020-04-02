package com.team.project.users.dto;

public class UsersDto {
	private int empno;
	private String ename;
	private String hdate;
	private String pnum;
	private String userid;
	private String pwd;
	private String email;
	private String profile;
	private String isadmin;
	private String newPwd;
	private int startRowNum; // 시작 번호를 담을 필드
	private int endRowNum;   // 끝 번호를 담을 필드
	
	//디폴트 생성자
	public UsersDto() {}

	public UsersDto(int empno, String ename, String hdate, String pnum, String userid, String pwd, String email,
			String profile, String isadmin, String newPwd, int startRowNum, int endRowNum) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.hdate = hdate;
		this.pnum = pnum;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.profile = profile;
		this.isadmin = isadmin;
		this.newPwd = newPwd;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}



	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getNewPwd() {
		return newPwd;
	}


	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}


	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getHdate() {
		return hdate;
	}

	public void setHdate(String hdate) {
		this.hdate = hdate;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}
}
