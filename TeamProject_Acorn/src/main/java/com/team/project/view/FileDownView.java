package com.team.project.view;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.team.project.file.dto.FileDto;

@Component("fileDownView")
public class FileDownView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		FileDto dto=(FileDto)model.get("dto");

		String orgFileName=dto.getOrgFileName();
		String saveFileName=dto.getSaveFileName();
		ServletContext application=request.getServletContext();
		
		String path=application.getRealPath("/upload")+File.separator+saveFileName;
		
		FileInputStream fis=new FileInputStream(path);
		
		String encodedName=null;
		System.out.println(request.getHeader("User-Agent"));
		if(request.getHeader("User-Agent").contains("Firefox")){
			encodedName=new String
				(orgFileName.getBytes("utf-8"),"ISO-8859-1");
		}else{ 
			encodedName=URLEncoder.encode(orgFileName, "utf-8");
			encodedName=encodedName.replaceAll("\\+"," ");
		}
		
		response.setHeader("Content-Disposition","attachment;filename="+encodedName);
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.setContentLengthLong(dto.getFileSize());
		
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
		byte[] buffer=new byte[1024*1000];
		int readedByte=0;
		while(true){
			readedByte = fis.read(buffer);
			if(readedByte == -1)break;
			bos.write(buffer, 0, readedByte);
			bos.flush(); 
		}
		fis.close();   
	}
}
