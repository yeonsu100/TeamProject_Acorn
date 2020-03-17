package com.team.project.done.dto;

public class DoneDto {
	private int num;
	private String title;
	private String content;
	private String regdate;
	
	public DoneDto() {}

	public DoneDto(int num, String title, String content, String regdate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
