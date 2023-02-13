package com.spring.bookdream.service;

import java.util.List;

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

}
