package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.OrderDAO;
import com.spring.bookdream.vo.OrderVO;

@Service("OrderService")
public class OrderImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	// 
	@Override
	public void insertOrder(OrderVO vo) {
		
		orderDAO.insertOrder(vo);		
	}

	// 
	@Override
	public List<OrderVO> searchOrder(OrderVO vo) {

		return orderDAO.searchOrder(vo);
	}

	@Override
	public void cancelOrder(OrderVO vo) {

		orderDAO.cancelOrder(vo);
	}

	@Override
	public int updateBookStock(OrderVO vo) {

		return orderDAO.updateBookStock(vo);
	}

	@Override
	public int updateUserPoint(OrderVO vo) {
		
		return orderDAO.updateUserPoint(vo);
	}

	@Override
	public void trackingUpdate(OrderVO vo) {
		
		orderDAO.trackingUpdate(vo);
		
	}

	@Override
	public List<Map<String, Object>> orderStatusCount(OrderVO vo) {

		return orderDAO.orderStatusCount(vo);
	}

	@Override
	public OrderVO recentOrder(OrderVO vo) {
		
		return orderDAO.recentOrder(vo);
	}

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

	// 금주 취소/반품 현황
	@Override
	public List<Map<String, Object>> cancelOrderWek(OrderVO vo) {

		return orderDAO.cancelOrderWek(vo);

	}
	// 금주 취소/반품 현황 카운트
	@Override
	public int cancelOrderWekCount(OrderVO vo) {

		return orderDAO.cancelOrderWekCount(vo);
	}

	// 결제취소/반품요청 승인
	@Override
	public void orderAprvl(OrderVO vo) {
		
		orderDAO.orderAprvl(vo);
		
	}	
	
	

}
