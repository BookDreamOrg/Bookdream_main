package com.spring.bookdream.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PurchaseService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PageVO;
import com.spring.bookdream.vo.PurchaseVO;
import com.spring.bookdream.vo.SearchCriteria;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	UserService userService;

	@Autowired
	private PurchaseService purchaseService;	

	@Autowired
	private HttpSession session;	
	
	// 마이페이지 - 주문목록 조회 (간단)
	@RequestMapping(value="/tracking")
	public String mypageTracking(HttpServletResponse response, OrderVO order, 
								 SearchCriteria cri, Model model, @RequestParam(value="p") int pageNum) {

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					    
		}


		int user_no = (int) session.getAttribute("user_no");
		cri.setUser_no(user_no);
		order.setUser_no(user_no);

		//********** 페이징 처리 시작 **********//
		// 1. 주문 총 개수  
		int count = orderService.orderCount(order).getOrder_count();
		
		// 2. URL파라미터
		cri.setPageNum(pageNum);
		
		// 3. 페이징버튼 
		PageVO pageMaker = new PageVO(cri, count);
		
		model.addAttribute("pageMaker", pageMaker);
		
		//********** 페이징 처리 끝 **********//
		
		// 배송상태 업데이트
		// 결제 1일뒤 = 배송중, 2일뒤 = 배송완료
		orderService.trackingUpdate(order);			
		
		// 주문 목록 표시
		model.addAttribute("orderlist", orderService.searchOrder(cri));
		
		return "mypage/mypage_tracking";
			
	}


//	// 반품, 결제취소 등 배송상태 변경
//	@RequestMapping(value="/orderList")
//	@ResponseBody	
//	public List<OrderVO> searchOrder(OrderVO order, SearchCriteria cri) {
//	
//		int user_no = (int) session.getAttribute("user_no");
//		cri.setUser_no(user_no);
//	
//		// 배송상태 업데이트
//		// 결제 1일뒤 = 배송중, 2일뒤 = 배송완료
//		orderService.trackingUpdate(order);
//			
//		List<OrderVO> list  = orderService.searchOrder(cri);
//		
//		return list;
//	}

		
	// 주문목록 조회 (상세)
	@RequestMapping(value="/orderDetail")
	@ResponseBody	
	public List<PurchaseVO> getPurchaseList(@RequestBody PurchaseVO purchase) {
		
		int user_no = (int) session.getAttribute("user_no");
		purchase.setUser_no(user_no);
				
		List<PurchaseVO> list  = purchaseService.getPurchaseList(purchase);
		
		return list;
	}	

	
	// 마이페이지(배송지관리)
	@RequestMapping(value="/address")
	public String myPageAddress(HttpServletResponse response) {

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					
		}
					
		return "mypage/mypage_address";
			
	}
		
	
	
	
	//회원정보 수정
	@PostMapping(value="/updateUser")
	@ResponseBody
	public String updateUser(@RequestParam(value="id") String id,
							 @RequestParam(value="password") String password,
							 @RequestParam(value="password_check") String password_check,
							 @RequestParam(value="email") String email,
							 @RequestParam(value="name") String name){
		
		if(id.equals("") || password.equals("") || password_check.equals("") || email.equals("") || name.equals("")) {
			return "error";
		}
		
		if(!(password.equals(password_check))) {
			return "password_error";
		}
		
		UserVO userVO = (UserVO)session.getAttribute("authUser");
		
		userVO.setUser_id(id);
		userVO.setUser_password(password);
		userVO.setUser_email(email);
		userVO.setUser_name(name);
		System.out.println("회원정보 수정");
		System.out.println(id);
		System.out.println(password);
		System.out.println(email);
		System.out.println(name);
		userService.updateUser(userVO);
		
		return "/mypage/mypage";
	}
	
}


