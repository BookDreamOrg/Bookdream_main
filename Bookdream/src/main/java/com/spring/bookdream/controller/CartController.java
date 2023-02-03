package com.spring.bookdream.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bookdream.dao.CartDAO;
import com.spring.bookdream.service.CartService;
import com.spring.bookdream.vo.CartVO;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping(value="/itemorder/cart/*")
public class CartController {
	
	ModelAndView mv = new ModelAndView();

	
	@Autowired
	private CartService cartService;
		
	/* [[ 장바구니 목록 조회  ]]
	 * if 	-> session에서 user_no가 있으면(=로그인 상태) 바로 DB에 select 함.
	 * else -> 			"		    없으면 (=비회원 상태) cookie에 저장된 cart 정보 가져오기.  */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView cartList(Model model, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] cartList() 실행... ");
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		int user_no = user.getUser_no();
		System.out.println(">> user_no : " + user_no);
		
		System.out.print("[장바구니] 로그인 여부 조회 : ");
		if (user != null) {
			System.out.println("Y");//yes
			
			System.out.println("[장바구니] 장바구니 리스트 조회");
			model.addAttribute("cartList", cartService.getCartList(user_no));
		
			// user_no의 장바구니 리스트 갯수 (뱃지)
			int cnt = cartService.selectListCount(user_no);
			System.out.println("\t>> cnt : " + cnt);
			model.addAttribute("cartListCount", cnt); 
			
			
			mv.setViewName("/itemorder/cart/list");
			
		} else {
			System.out.println("N");//no
			
			/*
			 * 쿠키에 있는 장바구니 정보 찾아서 list 출력
			 * */
			
			//mv.setViewName("/itemorder/cart/list");
			
		}
		return mv;
		
	}
	
	
	/* [[ 장바구니 아이템 추가  ]]
	 * if 	-> session에서 user_no가 있으면(=로그인 상태) 바로 DB에 insert 
	 * else -> 			"		    없으면 (=비회원 상태) 장바구니 정보 cookie에 임시 저장 */
	@ResponseBody
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public int addCart(CartVO cart, Model model, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] addCart() 실행...");
		
		int result = 0; // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		
		System.out.print("[장바구니] 로그인 check : ");
		if (user != null) {
			System.out.println("Y");// do 로그인 yes
			
			int user_no = user.getUser_no();
			System.out.println(">> user_no : " + user_no);

			cart.setUser_no(user.getUser_no());
			System.out.println("---> [장바구니] cartService.addCart() 장바구니 추가 실행... ");
			model.addAttribute("addCart", cartService.addCart(cart));
			
			// user_no의 장바구니 리스트 갯수 (뱃지)
			System.out.println("---> [장바구니] cartService.selectListCount() 장바구니 갯수 조회 실행 ... ");
			int cnt = cartService.selectListCount(user_no);
			cart.setListCount(cnt);
			model.addAttribute("cartListCount", cnt); 
			System.out.println("\t>> cartListCount : " + cart.getListCount());
			
			result = 1;	// 1 : 장바구니 추가 성공
		} 
		
		return result;
		
		/*
		else {
			System.out.println("N");// do 로그인 no
			
			
			int book_no = (int) session.getAttribute("book_no");
			int product_count = (int) session.getAttribute("product_count");
			
			session.setAttribute("book_no", book_no);
			session.setAttribute("product_count", product_count);
			
			result = 0; // 1 : 로그인 완료, 0 : 로그인 미완 
			return result;
		}
		 */
		
		
	}	
	
	// 선택한 장바구니 삭제
	/**/
	@ResponseBody
	@RequestMapping(value="/delete",  method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "chbox[]") List<String> chArr,
											CartVO cart, Model model, HttpSession session) {
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] deleteCart() 실행...");	
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		
		int result = 0; // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
		
		int cart_no = 0;
		
		System.out.print("[장바구니] 로그인 check : ");
		if (user != null) {
			System.out.println("Y");// do 로그인 yes
			
			int user_no = user.getUser_no();
			System.out.println(">> user_no : " + user_no);
			
			cart.setUser_no(user_no);
			
			chArr.toString();
			
			System.out.println("---> [장바구니] List<String> chArr 데이터 분리하기 for문 실행... ");
			for (String i : chArr) {
				cart_no = Integer.parseInt(i);
				System.out.println(">> chArr["+i+"] : " + cart_no);
			
				cart.setCart_no(cart_no);
				System.out.println("---> [장바구니] cartService.deleteCart() 실행... ");
				cartService.deleteCart(cart);
			}
			result = 1;	 // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
			
		}	
		return result;
		
	}
	 
}
