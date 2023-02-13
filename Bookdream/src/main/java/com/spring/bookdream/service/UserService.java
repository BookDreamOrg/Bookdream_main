package com.spring.bookdream.service;

import java.util.List;

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
	
	//이메일로 아이디 찾기
	public String idFind(UserVO vo);
	
	//아이디로 비밀번호 찾기
	public String pwFind(UserVO vo);
	
	// 구글 정보 저장
	public void googleInsert(UserVO vo);
	
	// 네이버 정보 저장
	public void naverInsert(UserVO vo);

	public UserVO getBySns(UserVO snsUser);
	
	//회원정보 수정
	public void updateUser(UserVO vo);
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo);
	
	// 회원조회
	public List<UserVO> selectUser();
	
	// 유저 Count
	public int countUser();
	
	// 유저 List Paging
	public List<UserVO> userListPage(int displayPost, int postNum);
}
