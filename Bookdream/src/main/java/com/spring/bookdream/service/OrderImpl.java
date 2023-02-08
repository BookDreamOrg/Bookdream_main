package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.OrderDAO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.SearchCriteria;

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
	public List<OrderVO> searchOrder(SearchCriteria cir) {

		return orderDAO.searchOrder(cir);
	}

	@Override
	public void cencelOrder(OrderVO vo) {

		orderDAO.cencelOrder(vo);
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
	public OrderVO orderCount(OrderVO vo) {

		return orderDAO.orderCount(vo);
	}	

}
