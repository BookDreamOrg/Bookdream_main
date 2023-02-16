package com.spring.bookdream.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public ModelAndView cartList(CartVO cart, Model model, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] cartList() 실행... ");
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		System.out.println(">> user_no : " + user.getUser_no());
		
		System.out.print("[장바구니] 로그인 여부 조회 : ");
		if (user != null) {
			System.out.println("Y");//yes
			
			cart.setUser_no(user.getUser_no());
			
			System.out.println("[장바구니] 장바구니 리스트 조회");
			model.addAttribute("cartList", cartService.getCartList(cart));
			
			// user_no의 장바구니 리스트 갯수 (뱃지)
			countCartLsits(user.getUser_no(), model);
			
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
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		cart.setUser_no(user.getUser_no());
		
		int result = 1; // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
		
		System.out.print("[장바구니] 로그인 check : ");
		if (user != null) {
			System.out.println("Y");// do 로그인 yes
			
			if (initCount(cart)) {
				// ooooooooooooooooooo 중복 있음. ooooooooooooooooooo
				System.out.print("\n[장바구니] 아이템  중복  : " + initCount(cart)); 

				System.out.println("---> [장바구니] cartService.addCart_init() 장바구니 업데이트 실행... ");
				model.addAttribute("addCart", cartService.addCart_init(cart));
				
				// user_no의 장바구니 리스트 갯수 (뱃지)
				countCartLsits(user.getUser_no(), model);
				System.out.println("\t>> cartListCount : " + cart.getListCount());
				
				result = 1;	// 1 : 장바구니 추가 성공
				
			} else {
				// xxxxxxxxxxxxxxxxxxx 중복 없음. xxxxxxxxxxxxxxxxxxx
				System.out.println("\n[장바구니] 아이템  중복  : " + initCount(cart)); 
				
				System.out.println("---> [장바구니] cartService.addCart() 장바구니 추가 실행... ");
				model.addAttribute("addCart", cartService.addCart(cart));
				
				// user_no의 장바구니 리스트 갯수 (뱃지)
				countCartLsits(user.getUser_no(), model);
				
				System.out.println("\t>> cartListCount : " + cart.getListCount());
				
				result = 1;	// 1 : 장바구니 추가 성공
			}

		} 
		
		return result;
		
	}	
	
	
	/* [[ 장바구니 수량 업데이트  ]] */
	@ResponseBody
	@RequestMapping(value="/modifyCount", method = RequestMethod.POST)
	public int modifyCount(CartVO cart, Model model, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] modifyCount() 실행...");
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		cart.setUser_no(user.getUser_no());
		
		int result = 0; // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
		
		System.out.println("---> [장바구니] cartService.modifyCount() 장바구니 업데이트 실행... ");
		cartService.modifyCount(cart);
				
		result = 1;	// 1 : 장바구니 추가 성공
		
		return result;
		
	}	
	
	
	/* [[user의 카트 아이템  중복 boolean]]
	 * cart table에서 book_no가 존재하면 true, 없으면 false*/
	@ResponseBody
	@RequestMapping(value = "/initCount" , method = RequestMethod.POST)
	public boolean initCount(CartVO cart) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] initCount() 실행... ");
		
		// user_no의 장바구니에 book_no 갯수
		int init = cartService.selectInitCount(cart);
		System.out.println("\t>> init : " + init);
		
		if (init == 1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
	/* [[선택한 장바구니 삭제]]
	 * if 	-> session에서 user_no가 있으면(=로그인 상태) 바로 DB에 delete 
	 * else -> 			"		    없으면 (=비회원 상태) 장바구니 정보 cookie에 임시 저장된 item 삭제 */
	@ResponseBody
	@RequestMapping(value="/delete")
	public int deleteCart(@RequestParam(name = "chbox[]") List<String> chArr,
							CartVO cart, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] deleteCart() 실행...");	
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		int user_no = user.getUser_no();
		
		int result = 0; // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
		int cart_no = 0;
		
		System.out.print("[장바구니] 로그인 check : ");
		if (user != null) {
			System.out.println("Y");// do 로그인 yes
			System.out.println(">> user_no : " + user_no);
			
			cart.setUser_no(user_no);
			
			System.out.println(">> ajax로 받아온 데이터 chArr[] : " + chArr);
			
			System.out.println("---> [장바구니] List<String> chArr 데이터 분리하기 for문 실행... ");
			for (String i : chArr) {
				cart_no = Integer.parseInt(i); // dataType변환 : string to int
				cart.setCart_no(cart_no);
				System.out.println("---> [장바구니] cartService.deleteCart() 실행... ");
				cartService.deleteCart(cart);
			}
			result = 1;	 // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
			
		}	
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/payNow")
	public int payNow(@RequestParam(name = "chbox[]") List<String> chArr,
							CartVO cart, HttpSession session) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] payNow() 실행...");	
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		int user_no = user.getUser_no();
		
		int result = 0; // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
		int cart_no = 0;
		
		System.out.print("[장바구니] 로그인 check : ");
		if (user != null) {
			System.out.println("Y");// do 로그인 yes
			System.out.println(">> user_no : " + user_no);
			
			cart.setUser_no(user_no);
			
			System.out.println(">> ajax로 받아온 데이터 chArr[] : " + chArr);
			
			System.out.println("---> [장바구니] List<String> chArr 데이터 분리하기 for문 실행... ");
			for (String i : chArr) {
				cart_no = Integer.parseInt(i); // dataType변환 : string to int
				cart.setCart_no(cart_no);
				//cartService.deleteCart(cart);
			}
			result = 1;	 // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
			
		}	
		return result;
		
	}
	
	
	/* [[user의 카트 아이템 갯수]]
	 * cart table에서 item 갯수를  count함.*/
	@ResponseBody
	@RequestMapping(value = "/countCartLsit" , method = RequestMethod.POST)
	public int countCartLsits(int user_no, Model model) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] countCartLsits() 실행... ");
		
		// user_no의 장바구니 리스트 갯수 (뱃지)
		int cnt = cartService.selectListCount(user_no);
		System.out.println("\t>> cnt : " + cnt);
		model.addAttribute("cartListCount", cnt); 
		
		return cnt;
	}

	
	/* [[user의 카트 아이템 갯수]]
	 * cart table에서 item 갯수를  count함.*/
	@ResponseBody
	@RequestMapping(value = "/totalPrice" , method = RequestMethod.POST)
	public void countTotalPrice(CartVO cart, Model model, HttpSession session ) {
		
		System.out.println("\n>>>>>>>>> CartController <<<<<<<<< ");
		System.out.println("---> [장바구니] countCartLsits() 실행... ");
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		cart.setUser_no(user.getUser_no());
		
		// user_no의 장바구니 리스트 갯수 (뱃지)
		cartService.totalPrice(cart);
		
		
		
	}

	
}
