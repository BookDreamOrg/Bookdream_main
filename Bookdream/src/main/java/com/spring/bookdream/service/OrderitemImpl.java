package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.OrderitemDAO;
import com.spring.bookdream.vo.OrderitemVO;


@Service("orderitemService")
public class OrderitemImpl implements OrderitemService {
	
	@Autowired
	private OrderitemDAO orderitemDAO;

	// 결제 상품 목록 조회
	@Override
	public List<OrderitemVO> getOrderitemList(OrderitemVO vo) {

		return orderitemDAO.getOrderitemList(vo);
	}
	
	// 결제 상품 개수 조회
	@Override
	public List<OrderitemVO> getOrderitemCount(OrderitemVO vo) {

		return orderitemDAO.getOrderitemCount(vo);
	}

	// 상품 구매후 재고 차감
	@Override
	public int updateBookStock(OrderitemVO user_no) {
		
		return orderitemDAO.updateBookStock(user_no);
	}

	@Override
	public int deleteCartList(OrderitemVO user_no) {
		
		return orderitemDAO.deleteCartList(user_no);		
	}





}
