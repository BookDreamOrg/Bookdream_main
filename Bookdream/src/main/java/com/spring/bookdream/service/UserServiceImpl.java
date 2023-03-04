package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	//모든 유저 리스트 가져오기
	public List<UserVO> getAllUserList(UserVO vo){
		return userDAO.getAllUserList(vo);
	}
	
	public String findFlatform(UserVO vo) {
		UserVO userVO = getUser(vo);
		
		return userDAO.findFlatform(userVO);
	}
	
	public boolean loginCheck(UserVO vo, Model model) {
		boolean result = userDAO.loginCheck(vo);
		
		if(result) {
			UserVO userVO = getUser(vo);
			
			model.addAttribute(userVO);
			model.addAttribute("userId", userVO.getUser_id());
			model.addAttribute("userPassword", userVO.getUser_password());
			
		}
		return result;
	}
	
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	@Override
	public int idCheck(String id) {
		System.out.println("impl");
		System.out.println(id);
		int cnt = userDAO.idCheck(id);
		System.out.println("cnt: " + cnt);
		
		return cnt;
	}
	
	public String idFind(UserVO vo) {
		return userDAO.idFind(vo);
	}
	
	public String pwFind(UserVO vo) {
		return userDAO.pwFind(vo);
	}
	
	@Override
	public void googleInsert(UserVO vo) {
		userDAO.googleinsert(vo);
	}

	@Override
	public void naverInsert(UserVO vo) {
		userDAO.naverinsert(vo);
	}

	@Override
	public UserVO getBySns(UserVO snsUser) {
		return userDAO.getBySns(snsUser);
	}
	
	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public List<UserVO> selectUser() {
		return userDAO.selectUser();
	}

	@Override
	public int countUser() {
		return userDAO.countUser();
	}

	@Override
	public List<UserVO> userListPage(UserVO vo) {
		return userDAO.userListPage(vo);
	}

	@Override
	public UserVO getUserByNo(int no) {
		return userDAO.getUserByNo(no);
	}

	@Override
	public void setBlack(int no) {
		userDAO.setBlack(no);
	}

	// 사용자 포인트 조회
	@Override
	public int userPoint(UserVO user) {

		return userDAO.userPoint(user);
	}

	// 사용자 포인트 내역
	public List<Map<String, Object>> userPointHistory(UserVO user) {
		return userDAO.userPointHistory(user);
	}

	// 구매확정 포인트 적립
	@Override
	public void pointEarned(UserVO user) {
		userDAO.pointEarned(user);
		
	}
	
	// 관리자 회원가입
	@Override
	public void insertAdmin(UserVO vo) {
		userDAO.insertAdmin(vo);
	}
	
	// 관리자 로그인 체크
	public boolean adminLoginCheck(UserVO vo, Model model) {
		boolean result = userDAO.adminLoginCheck(vo);
		
		if(result) {
			UserVO userVO = getUser(vo);
			
			model.addAttribute(userVO);
			model.addAttribute("userId", userVO.getUser_id());
			model.addAttribute("userPassword", userVO.getUser_password());
			
		}
		return result;
	}
	

}
