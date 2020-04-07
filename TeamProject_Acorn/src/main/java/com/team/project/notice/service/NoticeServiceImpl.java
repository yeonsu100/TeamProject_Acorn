package com.team.project.notice.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.AccessException;
import com.team.project.exception.CanNotDeleteException;
import com.team.project.exception.UpdateException;
import com.team.project.notice.dao.NoticeDao;
import com.team.project.notice.dto.NoticeDto;
import com.team.project.users.dao.UsersDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

	// 글 목록 메소드
	@Override
	public void list(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		NoticeDto dto=new NoticeDto();
		if(keyword != null) {
			if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("keyword", keyword);
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("condition", condition);
		}	
		final int PAGE_ROW_COUNT=5;
		final int PAGE_DISPLAY_COUNT=5;
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		int totalRow=noticeDao.getCount(dto);
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}	
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		List<NoticeDto> list=noticeDao.getList(dto);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}
	
	// 글 추가 메소드
	@Override
	public void addContent(HttpServletRequest request, NoticeDto dto) {
		String isAdmin=(String)request.getSession().getAttribute("isAdmin");
		// 관리자가 아니면 글 작성 시 익셉션 발생
		if(isAdmin==null) {
			throw new AccessException();
		}
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String writer=(String)request.getSession().getAttribute("id");
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		noticeDao.insert(dto);
	}
	
	// 글삭제 하는 메소드
	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=noticeDao.getDate(num).getWriter();
		if(!id.equals(writer)) {
			throw new CanNotDeleteException();
		}
		noticeDao.delete(num);
		
	}

	// 글 자세히보기
	@Override
	public void showContent(int num, ModelAndView mView) {
		NoticeDto dto= new NoticeDto();
		noticeDao.getData(dto);
		mView.addObject("dto", dto);
	}

	@Override
	public void detail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		NoticeDto dto=new NoticeDto();
		if(keyword != null) {
			if(condition.equals("titlecontent")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
			request.setAttribute("condition", condition);
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}		
		dto.setNum(num);
		noticeDao.addCount(num);
		NoticeDto dto2=noticeDao.getData(dto);
		request.setAttribute("dto", dto2);
	}

	// 글수정 서비스
	@Override
	public void updateContent(NoticeDto dto, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=noticeDao.getData(dto).getWriter();
		if(!id.equals(writer)) {
			throw new UpdateException();
		}
		noticeDao.update(dto);
	}

	// 글 조회수 증가 
	@Override
	public void addCount(int num) {
		noticeDao.addCount(num);
	}
}
