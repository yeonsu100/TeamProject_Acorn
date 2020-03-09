package com.team.project.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.dao.UsersDao;
import com.team.project.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	
	@Override
	public void addUser(UsersDto dto) {
		//비밀번호를 암호화 한다.
		String encodedPwd=new BCryptPasswordEncoder().encode(dto.getPwd());
		//암호화된 비밀번호를 UsersDto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		//UsersDao 객체를 이용해서 DB 에 저장하기 
		dao.insertUser(dto);
	}
	
	@Override
	public void addEmp(UsersDto dto) {
		dao.insertEmp(dto);
	}
	
	@Override
	public void validUser(UsersDto dto, HttpSession session, ModelAndView mView) {
		//아이디 비밀번호가 유효한지 여부 
		boolean isValid=false;
		//아이디를 이용해서 저장된 비밀 번호를 읽어온다. 
		String pwdHash=dao.getPwdHash(dto.getUserid());
		String profile=dao.getProfile(dto.getUserid());
		if(pwdHash != null) {//비밀번호가 존재하고 
			//입력한 비밀번호와 일치 하다면 로그인 성공
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getUserid());
			session.setAttribute("profile", profile);
		}
	}
	
	@Override
	public void validEmp(UsersDto dto, HttpSession session, ModelAndView mView) {
		
		//전화번호를 통해 이름을 검색
		String ename=dao.getEname(dto.getPnum());
		if(ename != null && ename.equals(dto.getEname())) {//해당 이름 사원이 존재하고 입력한 이름과 일치하면
			int empno=dao.getEmpno(dto.getPnum());	//사번을 읽어와서
			boolean isUserExist=dao.isUserExist(empno); //이미 가입한 사원인지 여부를 검사해서
			//사원명, 사번, 이미 가입된 사원인지 여부를 전달 
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
	public void showInfo(String id, ModelAndView mView) {
		UsersDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}

	@Override
	public String saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getServletContext().getRealPath("/upload");
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//UsersDao 객체를 이용해서 프로파일 이미지
		//경로를 DB 에 저장하기
		String path="/upload/"+saveFileName;			
		//로그인된 아이디
		String id=(String)
				request.getSession().getAttribute("id");
		//아이디와 프로파일 이미지 경로를 dto 에 담고 
		UsersDto dto=new UsersDto();
		dto.setUserid(id);;
		dto.setProfile(path);
		// UsersDao 를 이용해서 DB 에 반영하기 
		dao.updateProfile(dto);
		
		//이미지 경로 리턴해주기 
		return path;
	}

	@Override
	public void updatePassword(UsersDto dto, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		
	}
}
