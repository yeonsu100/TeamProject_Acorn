package com.team.project.users.service;

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
		if(pwdHash != null) {//비밀번호가 존재하고 
			//입력한 비밀번호와 일치 하다면 로그인 성공
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getUserid());
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void showInfo(String id, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO Auto-generated method stub
		return null;
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
