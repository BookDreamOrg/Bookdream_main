package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.SearchCriteria;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문정보 등록
	public void insertOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO insertOrder 실행 <---");
		mybatis.insert("OrderDAO.insertOrder", vo);		
	}

	// 주문 조회
	public List<OrderVO> searchOrder(SearchCriteria cir) {
		
		System.out.println("---> OrderDAO searchOrder 실행 <---");
		return mybatis.selectList("OrderDAO.searchOrder", cir);	
		
	}

	// 결제 취소, 반품요청
	public void cencelOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO cencelOrder 실행 <---");
		
		// 결제 취소
		mybatis.update("OrderDAO.cencelOrder", vo);
		
		// 반품 요청중
		mybatis.update("OrderDAO.cencelOrder2", vo);
		
	}
	
	// 결제취소, 반품완료시 도서 반환
	public int updateBookStock(OrderVO vo) {
		
		System.out.println("---> OrderDAO updateBookStock 실행 <---");
		return mybatis.update("OrderDAO.updateBookStock", vo);	
		
	}
	
	// 결제취소, 반품완료시 포인트 반환
	public int updateUserPoint(OrderVO vo) {
		
		System.out.println("---> OrderDAO updateUserPoint 실행 <---");
		return mybatis.update("OrderDAO.updateUserPoint", vo);	
		
	}	
	
	// 배송상태 갱신
	public void trackingUpdate(OrderVO vo) {
		
		System.out.println("---> OrderDAO trackingUpdate 실행 <---");
		// 결제완료 -> 배송중 
		mybatis.update("OrderDAO.trackingUpdate", vo);		
		// 배송중 -> 배송완료
		mybatis.update("OrderDAO.trackingUpdate2", vo);		
	}	
	
	// 주문 개수 확인
	public OrderVO orderCount(OrderVO vo) {
		
		System.out.println("---> OrderDAO orderCount 실행 <---");
		
		return mybatis.selectOne("OrderDAO.orderCount", vo);	
		
	}		
}
