package com.team.project.board.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dao.BoardCommentDao;
import com.team.project.board.dao.BoardDao;
import com.team.project.board.dto.BoardCommentDto;
import com.team.project.board.dto.BoardDto;
import com.team.project.exception.CanNotDeleteException;
import com.team.project.exception.UpdateException;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardCommentDao boardCommentDao;
	
	static final int PAGE_ROW_COUNT=10; 
	static final int PAGE_DISPLAY_COUNT=10;

	@Override
	public void getList(HttpServletRequest request) {
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		BoardDto dto=new BoardDto();

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

		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		int totalRow=boardDao.getCount(dto);
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

		List<BoardDto> list=boardDao.getList(dto);
		
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);			
	}

	@Override
	public void saveContent(BoardDto dto) {
		boardDao.insert(dto);
		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		BoardDto dto=new BoardDto();
		BoardCommentDto re_dto=new BoardCommentDto();
		re_dto.setRef_group(num);
		
		int re_pageNum=1;
		String re_strPageNum=request.getParameter("re_pageNum");
		if(re_strPageNum != null) {
			re_pageNum=Integer.parseInt(re_strPageNum);
		}
		int re_startRowNum=1+(re_pageNum-1)*PAGE_ROW_COUNT;
		int re_endRowNum=re_pageNum*PAGE_ROW_COUNT;
		
		int re_totalRow=boardCommentDao.getCount(re_dto);
		
		int re_totalPageCount=(int)Math.ceil(re_totalRow/(double)PAGE_ROW_COUNT);
		
		int re_startPageNum=1+((re_pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		
		int re_endPageNum=re_startPageNum+PAGE_DISPLAY_COUNT-1;
		if(re_totalPageCount < re_endPageNum) {
				re_endPageNum=re_totalPageCount;
		}
		re_dto.setRe_startRowNum(re_startRowNum);
		re_dto.setRe_endRowNum(re_endRowNum);
		
		List<BoardCommentDto> commentList=boardCommentDao.getList(re_dto);
		request.setAttribute("commentList", commentList);
		request.setAttribute("re_startPageNum", re_startPageNum);
		request.setAttribute("re_endPageNum", re_endPageNum);
		request.setAttribute("re_pageNum", re_pageNum);
		request.setAttribute("re_totalPageCount", re_totalPageCount);
		request.setAttribute("re_totalRow", re_totalRow);
		
		if(keyword !=null) {
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
			}catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}
		
		dto.setNum(num);
		boardDao.addViewCount(num);
		BoardDto dto2=boardDao.getData(dto);
		request.setAttribute("dto", dto2);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=boardDao.getData(num).getWriter();
		String admin=(String)request.getSession().getAttribute("isAdmin");
		if(!id.equals(writer)&& admin==null) {
			throw new CanNotDeleteException();
		}else {
			boardDao.delete(num);
		}
		boardDao.delete(num);
	}

	@Override
	public void getUpdateData(ModelAndView mView, int num) {
		BoardDto dto=boardDao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void updateContent(BoardDto dto, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=boardDao.getData(dto).getWriter();
		if(!id.equals(writer)) {
			throw new UpdateException();
		}
		boardDao.update(dto);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
				String writer=(String)request.getSession()
						.getAttribute("id");
				int ref_group=
					Integer.parseInt(request.getParameter("ref_group"));
				String target_id=request.getParameter("target_id");
				String content=request.getParameter("content");
				String comment_group=
						request.getParameter("comment_group");		
				int seq = boardCommentDao.getSequence();
				BoardCommentDto dto=new BoardCommentDto();
				dto.setNum(seq);
				dto.setWriter(writer);
				dto.setTarget_id(target_id);
				dto.setContent(content);
				dto.setRef_group(ref_group);

				if(comment_group==null) {
					
					dto.setComment_group(seq);
				}else {
					dto.setComment_group
						(Integer.parseInt(comment_group));
				}
				boardCommentDao.insert(dto);		
				boardDao.addCountComment(ref_group);
				
			}
		

	@Override
	public void deleteComment(int num) {
		
		boardCommentDao.delete(num);
		
	}

	@Override
	public void updateComment(BoardCommentDto dto) {
		boardCommentDao.update(dto);
		
	}

	@Override
	public void addViewCount(int num) {
		boardDao.addViewCount(num);
		
	}

	@Override
	public void minusCountComment(int num) {
		boardDao.minusCountComment(num);
		
	}

}