package com.spring.bookdream.service;

import java.util.List;

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
	
	

}
