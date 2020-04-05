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
	private int startRowNum;
	private int endRowNum;
	private String title;
	private String content;
	
	//디폴트 생성자
	public UsersDto() {}

	public UsersDto(int empno, String ename, String hdate, String pnum, String userid, String pwd, String email,
			String profile, String isadmin, String newPwd, int startRowNum, int endRowNum, String title,
			String content) {
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
		this.title = title;
		this.content = content;
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

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
