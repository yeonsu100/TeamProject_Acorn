package com.team.project.board.dto;

public class BoardCommentDto {
	private int num;
	private String writer;
	private String content; //댓글 내용
	private String target_id; //댓글 대상자의 아이디
	private int ref_group; //댓글의 그룹번호 (원글의 글번호가 댓글의 그룹번호)
	private int comment_group; //댓글 내에서의 그룹번호 (대댓글의 처리)
	private String deleted; // 삭제한 댓글인지 확인 "no" | "yes"
	private String regdate;
	private String profile; //댓글 작성자의 프로필 이미지 경로를 담을 필드
	private int re_prevNum; //이전 댓글의 번호 담을 필드
	private int re_nextNum; //다음 댓글의 번호 담을 필드

	//디폴트 생성자
	public BoardCommentDto() {}

	public BoardCommentDto(int num, String writer, String content, String target_id, int ref_group, int comment_group,
			String deleted, String regdate, String profile, int re_prevNum, int re_nextNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.deleted = deleted;
		this.regdate = regdate;
		this.profile = profile;
		this.re_prevNum = re_prevNum;
		this.re_nextNum = re_nextNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getRe_prevNum() {
		return re_prevNum;
	}

	public void setRe_prevNum(int re_prevNum) {
		this.re_prevNum = re_prevNum;
	}

	public int getRe_nextNum() {
		return re_nextNum;
	}

	public void setRe_nextNum(int re_nextNum) {
		this.re_nextNum = re_nextNum;
	}
	
}
