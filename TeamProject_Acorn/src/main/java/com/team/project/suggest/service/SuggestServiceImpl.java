package com.team.project.suggest.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.exception.CanNotDeleteException;
import com.team.project.suggest.dao.SuggestDao;
import com.team.project.suggest.dto.SuggestDto;

@Service
public class SuggestServiceImpl implements SuggestService{
	@Autowired
	private SuggestDao suggestDao;

	// 글 목록
	@Override
	public void list(HttpServletRequest request) {
		final int PAGE_ROW_COUNT=7;
		final int PAGE_DISPLAY_COUNT=5;
		SuggestDto dto=new SuggestDto();
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		int totalRow=suggestDao.getCount(dto);
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

		List<SuggestDto> list=suggestDao.getList(dto);
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
		dto.setSugId(sugId);
		dto.setSugContent(sugContent);
		suggestDao.insert(dto);
	}

	// 게시글 업데이트
	@Override
	public void updateSuggest(SuggestDto dto) {
		suggestDao.update(dto);
	}
	
	// 게시글 삭제 업데이트
	@Override
	public void deleteSuggest(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String admin=(String)request.getSession().getAttribute("isAdmin");
		String sugId=suggestDao.getData(num).getSugId();
		// 관리자와 작성자만 삭제가능
		if(!id.equals(sugId)&& admin==null) {
			throw new CanNotDeleteException();
		}else {
			suggestDao.delete(num);
		}
		suggestDao.delete(num);
	}
}
