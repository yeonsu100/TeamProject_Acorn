package com.team.project.suggest.dto;

public class SuggestDto {
	// 필드
	private int num;		  // 건의 게시판 번호
	private String sugId;	  // 건의자 ID
	private String sugContent;// 건의 내용
	private String regdate;	  // 건의 날짜
	private int startRowNum;  // 페이징 처리용 시작번호
	private int endRowNum;    // 페이징 처리용 끝 번호
	// 디폴트 생성자
	public SuggestDto() {}
	
	public SuggestDto(int num, String sugId, String sugContent, String regdate, int startRowNum,
			int endRowNum) {
		super();
		this.num = num;
		this.sugId = sugId;
		this.sugContent = sugContent;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSugId() {
		return sugId;
	}

	public void setSugId(String sugId) {
		this.sugId = sugId;
	}


	public String getSugContent() {
		return sugContent;
	}

	public void setSugContent(String sugContent) {
		this.sugContent = sugContent;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	

	
	
}
