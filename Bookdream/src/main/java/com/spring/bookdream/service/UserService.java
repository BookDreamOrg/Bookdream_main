package com.spring.bookdream.service;

import org.springframework.ui.Model;

import com.spring.bookdream.vo.UserVO;

//@Service("userService")
public interface UserService {
	// CRUD 기능의 메소드 구현
	// 회원 정보 가져오기
	public UserVO getUser(UserVO vo);
	
	public String findFlatform(UserVO vo);
	
	// 로그인 아이디 체크
	public boolean loginCheck(UserVO vo, Model model);
	
	// 회원가입
	public void insertUser(UserVO vo);
	
	// 회원가입 아이디 중복체크
	public int idCheck(String id);
}
