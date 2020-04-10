package com.team.project.users.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.board.dao.BoardDao;
import com.team.project.board.dto.BoardDto;
import com.team.project.users.dao.UsersDao;
import com.team.project.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	@Autowired
	private BoardDao b_dao;
	
	static final int PAGE_ROW_COUNT=10; 
	static final int PAGE_DISPLAY_COUNT=10;
	
	@Override
	public void addUser(UsersDto dto) {
		String encodedPwd=new BCryptPasswordEncoder().encode(dto.getPwd());
		dto.setPwd(encodedPwd);
		dao.insertUser(dto);
	}
	
	@Override
	public void addEmp(UsersDto dto) {
		dao.insertEmp(dto);
	}
	
	@Override
	public void validUser(UsersDto dto, HttpSession session, ModelAndView mView) {
		boolean isValid=false;
		String pwdHash=dao.getPwdHash(dto.getUserid());
		String isAdmin=dao.getIsAdmin(dto.getUserid());
		if(pwdHash != null) {
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			session.setAttribute("id", dto.getUserid());
			session.setAttribute("isAdmin", isAdmin);
		}		
	}
	
	@Override
	public void validEmp(UsersDto dto, HttpSession session, ModelAndView mView) {
		String ename=dao.getEname(dto.getPnum());
		if(ename != null && ename.equals(dto.getEname())) {
			int empno=dao.getEmpno(dto.getPnum());
			boolean isUserExist=dao.isUserExist(empno);
			session.setAttribute("isUserExist", isUserExist);
			session.setAttribute("ename", ename);
			session.setAttribute("empno", empno);
		}
	}

	@Override
	public Map<String, Object> isExistId(String inputId) {
		boolean isExist=dao.isIdExist(inputId);
		Map<String, Object> map=new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}
	
	@Override
	public Map<String, Object> isExistPnum(String inputPnum) {
		boolean isExist=dao.isPnumExist(inputPnum);
		Map<String, Object> map=new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}
	

	@Override
	public void showInfo(String id, ModelAndView mView) {
		UsersDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}

	@Override
	public String saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		String realPath=request.getServletContext().getRealPath("/upload");
		String orgFileName=mFile.getOriginalFilename();
		String filePath=realPath+File.separator;
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdir();
		}
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try{
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String path="/upload/"+saveFileName;			
		String id=(String)request.getSession().getAttribute("id");
		UsersDto dto=new UsersDto();
		dto.setUserid(id);;
		dto.setProfile(path);
		dao.updateProfile(dto);
		
		return path;
	}

	@Override
	public void updatePassword(UsersDto dto, ModelAndView mView) {
		String pwdHash=dao.getPwdHash(dto.getUserid());
		boolean isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		if(isValid) {
			String encodedPwd=new BCryptPasswordEncoder()
					.encode(dto.getNewPwd());
			dto.setPwd(encodedPwd);
			dao.updatePwd(dto);
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
	}

	@Override
	public void empMainList(HttpServletRequest request) {
		UsersDto dto=new UsersDto();
		String keyword=request.getParameter("keyword");
		if(keyword != null) {
			dto.setEname(keyword);
		}
		final int PAGE_ROW_COUNT=10;
		final int PAGE_DISPLAY_COUNT=5;
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}else {
			pageNum=1;
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		int totalRow=dao.getCount(dto);
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}	
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<UsersDto> list=dao.getList(dto);

		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}
	

	@Override
	public void empResignList(HttpServletRequest request) {
		UsersDto dto=new UsersDto();
		String keyword=request.getParameter("keyword");
		if(keyword != null) {
			dto.setEname(keyword);
		}
		final int PAGE_ROW_COUNT=10;
		final int PAGE_DISPLAY_COUNT=5;
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}else {
			pageNum=1;
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		int totalRow=dao.getCountR(dto);
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}	
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<UsersDto> list=dao.getListR(dto);

		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void resignEmp(HttpServletRequest request) {
		String eno=request.getParameter("empno");
		int empno=Integer.parseInt(eno);
		String userid=dao.getUserid(empno);
		UsersDto dto=new UsersDto();
		dto.setEmpno(empno);
		dto.setUserid(userid);
		dao.resignEmp(empno);
		dao.updateResignWriter(dto);
		dao.updateResignUserid(dto);
	}

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

		int totalRow=b_dao.getCount(dto);
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

		List<BoardDto> list=b_dao.getList(dto);
		
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);			
	}


	
}
