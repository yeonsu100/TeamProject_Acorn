package com.team.project.msg.dto;

public class MsgDto {
	
	private int num;
	private String idSend;
	private String idRec;
	private String title;
	private String content;
	private String sendDate;
	private String readDate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호를 담을 필드
	private int nextNum; //다음글의 글번호를 담을 필드
		
	public MsgDto() {}

	public MsgDto(int num, String idSend, String idRec, String title, String content, String sendDate, String readDate,
			int startRowNum, int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.idSend = idSend;
		this.idRec = idRec;
		this.title = title;
		this.content = content;
		this.sendDate = sendDate;
		this.readDate = readDate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getIdSend() {
		return idSend;
	}

	public void setIdSend(String idSend) {
		this.idSend = idSend;
	}

	public String getIdRec() {
		return idRec;
	}

	public void setIdRec(String idRec) {
		this.idRec = idRec;
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

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
}
