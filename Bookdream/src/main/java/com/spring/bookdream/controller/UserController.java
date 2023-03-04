package com.spring.bookdream.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping(value="/views/user/*")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;
	//회원가입
	@RequestMapping(value="/insertUser.do")
	public String insertUser(UserVO userVO, UserDAO userDAO, HttpServletResponse response) throws IOException {
		System.out.println("회원가입 처리 ");
		
		String id = userVO.getUser_id();
		String pw = userVO.getUser_password();
		String name = userVO.getUser_name();
		String email = userVO.getUser_email();
		String email2 = userVO.getUser_email2();
		
		if(id == "" || pw == "" || name == "" || email == "" || email2 == "") {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('빈칸이 있어요!');location.href='/views/user/join.jsp\'</script>");
			w.flush();
			w.close();
			return "/user/join";
		}
		
		userService.insertUser(userVO);
		return "/user/login"; 
	}
	
	// 회원가입 아이디 중복체크
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("idcheckController" + id);
		if(id == null || id.equals("")) {
			return -1;
		}
		int cnt = userService.idCheck(id);

		
		return cnt;
	}
	
	//이름과 이메일로 아이디 찾기
	@PostMapping("/idfindUser.do")
	@ResponseBody
	public String idFind(@RequestParam(value="name", required=false) String name, 
						@RequestParam(value="email", required=false) String email,
						Model model) {
		System.out.println("id찾기");
		
		System.out.println("con" + name);
		System.out.println(email);
		UserVO userVO = new UserVO();
		userVO.setUser_name(name);
		userVO.setUser_email(email);
		String id = userService.idFind(userVO);
		
		System.out.println("con"+id);
		if(id == null) {
			System.out.println("아이디가 없습니다.");
			return id;
		} else {
	    	String idfind = "";
	    	for(int i=0; i<id.length(); i++){
	    		if(i<2){
	    			idfind += id.charAt(i);
	    		} else{
	    			idfind += '*';
	    		}
	    	}
			System.out.println(idfind);
			session.setAttribute("idfind", idfind);
			return id;
		}
		
	} 
	
	//아이디, 이름, 이메일로 비밀번호 찾기
	@PostMapping("/pwfindUser.do")
	@ResponseBody
	public String pwFind(@RequestParam(value="id", required=false) String id, 
						@RequestParam(value="name", required=false) String name, 
						@RequestParam(value="email", required=false) String email,
						Model model) {
		System.out.println("id찾기");
		
		System.out.println("con" + name);
		System.out.println(email);
		UserVO userVO = new UserVO();
		userVO.setUser_id(id);
		userVO.setUser_name(name);
		userVO.setUser_email(email);
		String pw = userService.pwFind(userVO);
		
		System.out.println("con"+pw);
		if(pw == null) {
			System.out.println("비밀번호가 없습니다.");
			return pw;
		} else {
			session.setAttribute("pwfind", pw);
			return pw;
		}
		
	}
 	
}
