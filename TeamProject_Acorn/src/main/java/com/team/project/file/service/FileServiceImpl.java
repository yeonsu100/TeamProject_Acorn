package com.team.project.file.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.CanNotDeleteException;
import com.team.project.file.dao.FileDao;
import com.team.project.file.dto.FileDto;

@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileDao dao;

	@Override
	public void list(HttpServletRequest request) {

		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		FileDto dto=new FileDto();
		if(keyword != null) {
			if(condition.equals("titlename")) {
				dto.setTitle(keyword);
				dto.setOrgFileName(keyword);
			}else if(condition.equals("title")) {
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
		
		final int PAGE_ROW_COUNT=10;
		final int PAGE_DISPLAY_COUNT=5;
		
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		int totalRow=dao.getCount(dto);
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum){endPageNum=totalPageCount;}	
		
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		List<FileDto> list=dao.getList(dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void saveFile(HttpServletRequest request, FileDto dto) {
		String realPath=request.getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		
		MultipartFile mFile=dto.getMyFile();
		String orgFileName=mFile.getOriginalFilename();
		long fileSize=mFile.getSize();
		String filePath=realPath+File.separator;
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdir();
		}
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		dao.insert(dto);			
	}

	@Override
	public void getFileData(ModelAndView mView, int num) {
		FileDto dto=dao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void addDownCount(int num) {
		dao.addDownCount(num);
	}
	
	@Override
	public void removeFile(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		FileDto dto=dao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		String admin=(String)request.getSession().getAttribute("isAdmin");
		if(!id.equals(dto.getWriter())&& admin==null) {
			//예외를 발생 시켜서 메소드가 정상 수행되지 않도록 막는다
			 throw new CanNotDeleteException();
		}else {
			String saveFileName=dto.getSaveFileName();
			dao.delete(num);
			String path=request.getServletContext().getRealPath("/upload")+File.separator+saveFileName;
			File f=new File(path);
			f.delete();
		}
		String saveFileName=dto.getSaveFileName();
		dao.delete(num);
		String path=request.getServletContext().getRealPath("/upload")+File.separator+saveFileName;
		File f=new File(path);
		f.delete();
	}
}
