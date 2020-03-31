package com.team.project.msg.dto;

public class MsgDto {
	
	private int num;		//메시지 번호(외부노출x)
	private String idSend;	//보낸사람
	private String idRec;	//받는사람
	private String title;	//제목
	private String content;	//내용
	private String sendDate;//보낸시간
	private String readDate;//읽은시간
	private String sendDel;	//보낸메시지에서 삭제여부
	private String recDel;	//받은메시지에서 삭제여부
	private String saved;	//보관여부
	private int startRowNum;//리스트페이지 첫글번호
	private int endRowNum;	//리스트페이지 끝글번호
		
	public MsgDto() {}

	

	public MsgDto(int num, String idSend, String idRec, String title, String content, String sendDate, String readDate,
			String sendDel, String recDel, String saved, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.idSend = idSend;
		this.idRec = idRec;
		this.title = title;
		this.content = content;
		this.sendDate = sendDate;
		this.readDate = readDate;
		this.sendDel = sendDel;
		this.recDel = recDel;
		this.saved = saved;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public String getSendDel() {
		return sendDel;
	}

	public void setSendDel(String sendDel) {
		this.sendDel = sendDel;
	}

	public String getRecDel() {
		return recDel;
	}

	public void setRecDel(String recDel) {
		this.recDel = recDel;
	}

	public String getSaved() {
		return saved;
	}

	public void setSaved(String saved) {
		this.saved = saved;
	}
	
}
