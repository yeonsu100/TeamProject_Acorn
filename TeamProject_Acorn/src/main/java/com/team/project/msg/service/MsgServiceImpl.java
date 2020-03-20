package com.team.project.msg.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.msg.dao.MsgDao;
import com.team.project.msg.dto.MsgDto;

@Service
public class MsgServiceImpl implements MsgService{
	@Autowired
	private MsgDao dao;
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;

	@Override
	public void list(HttpServletRequest request) {
		MsgDto dto=new MsgDto();
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//total row
		int totalRow=0;
		//어느 리스트로 갈지 리스트타입 읽어오기
		String pageType=request.getParameter("pageType");
		//전달된 키워드에 따라 getCount, getList에 필요한 파라미터 지정
		if(pageType!=null) {
			if(pageType.equals("sent")) {
				dto.setIdSend(id);
				totalRow=dao.getSentCount(dto);
			}else if(pageType.equals("saved")) {
				dto.setIdRec(id);
				totalRow=dao.getSavedCount(dto);
			}
		}else{
			dto.setIdRec(id);
			totalRow=dao.getCount(dto);
		}
		
		//보여줄 페이지의 번호
		int pageNum;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}else {
			pageNum=1;
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}	
		if(endPageNum < pageNum) {
			pageNum=endPageNum;
		}
		// Dto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// DB에서 메시지 목록을 얻어온다.
		List<MsgDto> list=new ArrayList<>();
		if(pageType!=null) {
			if(pageType.equals("sent")) {
				list=dao.getSentList(dto);
				request.setAttribute("pageType", pageType);
			}else if(pageType.equals("saved")) {
				list=dao.getSavedList(dto);
				request.setAttribute("pageType", pageType);
			}
		}else{
			list=dao.getList(dto);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void detail(HttpServletRequest request) {
		//파라미터로 전달되는 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		String pageType=request.getParameter("pageType");
		String id=(String)request.getSession().getAttribute("id");
		//MsgDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		MsgDto dto=new MsgDto();
		dto.setNum(num);
		MsgDto dto2=dao.getData(dto);
		if(dto2.getIdRec().equals(id) && dto2.getReadDate()==null) {
			dao.checkRead(dto);
		}
		request.setAttribute("dto", dto2);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageType", pageType);
	}

	@Override
	public void sendMsg(MsgDto dto) {
		dao.sendMsg(dto);
	}

	@Override
	public Map<String, Object> checkNewMsg(HttpServletRequest request) {
		MsgDto dto=new MsgDto();
		String id=(String)request.getSession().getAttribute("id");
		dto.setIdRec(id);
		int unreadCount=dao.getUnreadCount(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("count", unreadCount);
		return map;
	}

	@Override
	public void checkSaved(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		dao.checkSaved(num);
		dao.restoreSavedDel(num);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
	}

	@Override
	public int sendDel(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		dao.sendDel(num);
		MsgDto dto=new MsgDto();
		dto.setIdSend((String)request.getSession().getAttribute("id"));
		int totalRow=dao.getSentCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}	
		if(endPageNum < pageNum) {
			pageNum=endPageNum;
		}
		return pageNum;
	}

	@Override
	public int recDel(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		dao.recDel(num);
		MsgDto dto=new MsgDto();
		dto.setIdRec((String)request.getSession().getAttribute("id"));
		int totalRow=dao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}	
		if(endPageNum < pageNum) {
			pageNum=endPageNum;
		}
		return pageNum;
	}

	@Override
	public int savedDel(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		dao.savedDel(num);
		dao.restoreSaved(num);
		MsgDto dto=new MsgDto();
		dto.setIdRec((String)request.getSession().getAttribute("id"));
		int totalRow=dao.getSavedCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}	
		if(endPageNum < pageNum) {
			pageNum=endPageNum;
		}
		return pageNum;
	}
}
