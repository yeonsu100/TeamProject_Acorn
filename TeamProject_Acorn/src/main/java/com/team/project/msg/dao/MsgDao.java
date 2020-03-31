package com.team.project.msg.dao;

import java.util.List;

import com.team.project.msg.dto.MsgDto;
import com.team.project.users.dto.UsersDto;

public interface MsgDao {
	// 메시지 갯수
	public int getCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getList(MsgDto dto);
	// 메시지 갯수
	public int getSentCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getSentList(MsgDto dto);
	// 메시지 갯수
	public int getSavedCount(MsgDto dto);
	// 메시지 목록
	public List<MsgDto> getSavedList(MsgDto dto);
	// 메시지 데이터 읽어오기
	public MsgDto getData(MsgDto dto);
	// 메시지 최초 읽은시간 기록
	public void checkRead(MsgDto dto);
	// 메시지 보관함에 저장
	public void checkSaved(int num);
	// 받은 메시지 삭제
	public void recDel(int num);
	// 보낸 메시지 삭제
	public void sendDel(int num);
	// 보관함 메시지 삭제
	public void savedDel(int num);
	// 보관함 저장버튼 되살리기
	public void restoreSaved(int num);
	// 보관함 삭제 되돌리기(보관함 삭제했다가 원본에서 다시 보관함등록시)
	public void restoreSavedDel(int num);
	// 메시지 보내기(테이블에 추가)
	public void sendMsg(MsgDto dto);
	// 접속된 아이디의 안읽은 메시지 개수 읽어오기
	public int getUnreadCount(MsgDto dto);
	// 메시지 보내기용 id list
	public List<UsersDto> getIdList(MsgDto dto);
}
