package com.team.project.file.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.file.dto.FileDto;
import com.team.project.file.service.FileService;

@Controller
public class FileController {
	@Autowired
	private FileService service;
	
	@RequestMapping("/file/list")
	public ModelAndView authlist(ModelAndView mView, HttpServletRequest request) {
		service.list(request);
		mView.setViewName("file/list");
		return mView;
	}
	
	@RequestMapping("/file/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		return new ModelAndView("file/upload_form");
	}
	
	@RequestMapping(value = "/file/upload", method = RequestMethod.POST)
	public ModelAndView authUpload(HttpServletRequest request, @ModelAttribute FileDto dto) {
		service.saveFile(request, dto);
		return new ModelAndView("redirect:/file/list.go");
	}
	
	@RequestMapping("/file/download")
	public ModelAndView download(ModelAndView mView, @RequestParam int num) {
		service.getFileData(mView, num);
		service.addDownCount(num);
		mView.setViewName("fileDownView");
		return mView;
	}
	
	@RequestMapping("/file/delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		service.removeFile(request);
		return new ModelAndView("redirect:/file/list.go");
	}
	
}