package com.team.project.notice.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.CanNotDeleteException;
import com.team.project.notice.dao.NoticeDao;
import com.team.project.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void list(HttpServletRequest request) {
		/*
		 *  request에 검색 keyword 가 전달 될수도 있고 안될수도 있다.
		 *  - 전달 안되는 경우 : navbar에서 파일 목록보기를 누른경우
		 *  - 전달 되는 경우 : 하단에 검색어를 입력하고 검색버튼을 누른경우
		 *  - 전달 되는 경우2 : 이미 검색을 한 상태에서 하단 페이지 번호를 누른 경우
		 */
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//검색 키워드가 존재한다면 키워드를 담을 NoticeDto 객체 생성 
		NoticeDto dto=new NoticeDto();
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("title")) {//제목+파일명 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			/*
			 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 *  request 에 담아준다.
			 */
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//키워드와 검색조건을 request 에 담는다. 
			request.setAttribute("keyword", keyword);
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("condition", condition);
		}	
		//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT=5;
		//하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT=5;
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
		int totalRow=noticeDao.getCount(dto);
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
		// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// 1. DB에서 글 목록을 얻어온다.
		List<NoticeDto> list=noticeDao.getList(dto);
		// 2. 글 목록을 응답한다.
		
		// EL, JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
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
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		// 글작성자
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

	@Override
	public void showContent(int num, ModelAndView mView) {
		NoticeDto dto= new NoticeDto();
		noticeDao.getData(dto);
		mView.addObject("dto", dto);
	}

	@Override
	public void detail(HttpServletRequest request) {
		//파라미터로 전달되는 글번호
		int num=Integer.parseInt(request.getParameter("num"));

		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");

		//NoticeDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		NoticeDto dto=new NoticeDto();

		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("titlecontent")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			//request 에 검색 조건과 키워드 담기
			request.setAttribute("condition", condition);
			/*
			 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 *  request 에 담아준다.
			 */
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}		
		//NoticeDto 에 글번호도 담기
		dto.setNum(num);
		//조회수 1 증가 시키기
		noticeDao.addCount(num);
		//글정보를 얻어와서
		NoticeDto dto2=noticeDao.getData(dto);
		//request 에 글정보를 담고 
		request.setAttribute("dto", dto2);
	}

	// 글수정 서비스
	@Override
	public void updateContent(NoticeDto dto) {
		noticeDao.update(dto);
	}

	@Override
	public void addCount(int num) {
		noticeDao.addCount(num);
	}
}
