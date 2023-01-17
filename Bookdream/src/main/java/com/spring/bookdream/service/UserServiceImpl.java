package com.spring.bookdream.service;

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
}
