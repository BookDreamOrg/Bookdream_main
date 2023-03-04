package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.OrderitemDAO;
import com.spring.bookdream.vo.OrderitemVO;


@Service("orderitemService")
public class OrderitemImpl implements OrderitemService {
	
	@Autowired
	private OrderitemDAO orderitemDAO;

	// 장바구니 상품 목록 조회
	@Override
	public List<Map<String, Object>> getOrderitemList(OrderitemVO vo) {

		return orderitemDAO.getOrderitemList(vo);
	}
	
	// 장바구니 상품 개수 조회
	@Override
	public Map<String, Object> getOrderitemCount(OrderitemVO vo) {

		return orderitemDAO.getOrderitemCount(vo);
	}

	// 바로구매 상품 조회
	@Override
	public Map<String, Object> getBuyNow(OrderitemVO vo) {

		return orderitemDAO.getBuyNow(vo);

	}
			
	// 구매 한 장바구니만 제거
	@Override
	public int deleteCartList(OrderitemVO vo) {
		
		return orderitemDAO.deleteCartList(vo);		
	}
	// 구매 후 사용자의 포인트 정산
	@Override
	public int updateUserPoint(OrderitemVO vo) {

		return orderitemDAO.updateUserPoint(vo);	
	}









}
