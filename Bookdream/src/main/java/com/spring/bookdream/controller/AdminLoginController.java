package com.spring.bookdream.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping("/views/admin/*")
public class AdminLoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	// 기존 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UserVO vo, UserDAO userDAO, Model model) {
		
		System.out.println("로그인 인증 처리 ...");
		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_password());

		boolean result = userService.adminLoginCheck(vo, model);
		UserVO user = userService.getUser(vo);
		ModelAndView mav = new ModelAndView();
		
		if (result) { // 로그인 성공
			System.out.println("로그인 처리");
			RedirectView rv = new RedirectView();
			rv.setUrl("admin.jsp");
			rv.setExposeModelAttributes(false);
			mav.setView(rv);
			session.setAttribute("authUser", user);
			
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_no", user.getUser_no());

			return mav;
		} else { // 로그인 실패
			System.out.println("로그인 실패");
			mav.setViewName("admin/login");

			model.addAttribute("loginMsg", "로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요");
			model.addAttribute("loginUrl", "login.jsp");

			return mav;
		}
	}
	
	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public String logout(HttpSession session) {

		System.out.println("로그아웃 처리");
		
		// 1. 브라우저와 연결된 세션 객체를 강제로 종료한다.
		session.invalidate();

		// 2. 세션 종료후, 메인 화면으로 이동한다.
		return "redirect:/views/main/main.jsp";

	}


	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertAdmin() {

	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertAdmin(UserVO vo, UserDAO userDAO) {
		System.out.println("관리자 회원가입 처리 ");

		userService.insertAdmin(vo);
		return "redirect:/";

	}

}
