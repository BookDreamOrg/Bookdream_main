package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.OrderDAO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.SearchCriteria;

@Service("OrderService")
public class OrderImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	// 주문 db 등록
	@Override
	public void insertOrder(OrderVO vo) {
		
		orderDAO.insertOrder(vo);		
	}

	// 마이페이지 주문내역 : 주문 목록 
	@Override
	public List<Map<String, Object>> searchOrder(SearchCriteria cri) {

		return orderDAO.searchOrder(cri);
	}

	@Override
	public int searchOrderCount(SearchCriteria cri) {

		return orderDAO.searchOrderCount(cri);
	}	
	
	// 결제취소/반품요청 
	@Override
	public void cancelOrder(OrderVO vo) {

		orderDAO.cancelOrder(vo);
	}

	// 결제취소/반품완료 시 사용,적립 포인트 반환
	@Override
	public int updateUserPoint(OrderVO vo) {
		
		return orderDAO.updateUserPoint(vo);
	}

	// 마이페이지 : 배송상태 총 카운트
	@Override
	public List<Map<String, Object>> orderStatusCount(OrderVO vo) {

		return orderDAO.orderStatusCount(vo);
	}

	// 마이페이지 메인 : 최근 주문한 상품
	@Override
	public Map<String, Object> recentOrder(OrderVO vo) {
		
		return orderDAO.recentOrder(vo);
	}
	
	/************ 관리자 부문************/	

	// 일주일 주문 카운트
	@Override
	public List<Map<String, Object>> orderDateCount(OrderVO vo) {

		return orderDAO.orderDateCount(vo);
	}

	// 일주일 주문 취소/반품 카운트
	@Override
	public List<Map<String, Object>> orderCancelDateCount(OrderVO vo) {

		return orderDAO.orderCancelDateCount(vo);
	}

	// 월간 주문 카운트
	@Override
	public List<Map<String, Object>> orderMlyDateCount(OrderVO vo) {

		return orderDAO.orderMlyDateCount(vo);
	}

	// 월간 주문 취소/반품 카운트
	@Override
	public List<Map<String, Object>> orderMlyCancelDateCount(OrderVO vo) {

		return orderDAO.orderMlyCancelDateCount(vo);
	}
	
	// 결제취소/반품요청 승인
	@Override
	public void orderAprvl(OrderVO vo) {
		
		orderDAO.orderAprvl(vo);
		
	}

	// 주문 총 관리 리스트
	@Override
	public List<Map<String, Object>> orderMngmn(SearchCriteria cri) {
		return orderDAO.orderMngmn(cri);
	}

	// 주문 총 관리 개수
	public int orderMngmnCount(SearchCriteria cri) {

		return orderDAO.orderMngmnCount(cri);
	}

	// 주문 총 관리 세부내역
	@Override
	public List<Map<String, Object>> orderMngmnDtls(OrderVO vo) {
		
	return orderDAO.orderMngmnDtls(vo);
	
	}
	
	//일주일 도서 주문량 카운트 
	@Override
	public List<Map<String,Object>> orderBy7DaysBook() {
		return orderDAO.orderBy7DaysBook();
	}




	
	
	

}
