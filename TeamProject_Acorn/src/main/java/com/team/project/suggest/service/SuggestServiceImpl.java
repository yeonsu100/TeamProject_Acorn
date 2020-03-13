package com.team.project.suggest.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.suggest.dao.SuggestDao;
import com.team.project.suggest.dto.SuggestDto;

@Service
public class SuggestServiceImpl implements SuggestService{
	@Autowired
	private SuggestDao suggestDao;

	@Override
	public void list(HttpServletRequest request) {
		//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT=7;
		//하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT=5;
		SuggestDto dto=new SuggestDto();

		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//전체 row 의 갯수를 읽어온다.
		int totalRow=suggestDao.getCount(dto);
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
		// FileDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		//1. DB 에서 파일 목록을 얻어온다.
		List<SuggestDto> list=suggestDao.getList(dto);
		//2. view page 에 필요한 값을 request 에 담아둔다.
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
	}
	
	// 게시판 글 작성
	@Override
	public void addSuggest(HttpServletRequest request, SuggestDto dto) {
		String sugId=(String)request.getSession().getAttribute("id");
		String sugContent=request.getParameter("sugContent");
		// 작성 내용
		dto.setSugId(sugId);
		dto.setSugContent(sugContent);
		suggestDao.insert(dto);
	}

	@Override
	public void updateSuggest(SuggestDto dto) {
		suggestDao.update(dto);
	}
}