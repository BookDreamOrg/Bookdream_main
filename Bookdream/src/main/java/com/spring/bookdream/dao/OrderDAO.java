package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

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

	// 마이페이지 : 주문 조회
	public List<Map<String, Object>> searchOrder(SearchCriteria cri ) {
		
		System.out.println("---> OrderDAO searchOrder 실행 <---");
		return mybatis.selectList("OrderDAO.searchOrder", cri);	
		
	}

	// 마이페이지 : 주문 조회 개수
	public int searchOrderCount(SearchCriteria cri) {

		return mybatis.selectOne("OrderDAO.searchOrderCount", cri);	

	}
	
	// 결제 취소, 반품요청
	public void cancelOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO cancelOrder 실행 <---");
		
		mybatis.update("OrderDAO.cancelOrder", vo);
		
	}
	
	
	// 결제취소, 반품완료시 포인트 반환
	public int updateUserPoint(OrderVO vo) {
		
		System.out.println("---> OrderDAO updateUserPoint 실행 <---");
		return mybatis.update("OrderDAO.updateUserPoint", vo);	
		
	}	
	
	
	// 주문 개수 확인
	public List<Map<String, Object>> orderStatusCount(OrderVO vo) {
		
		System.out.println("---> OrderDAO orderCount 실행 <---");
		
		return mybatis.selectList("OrderDAO.orderStatusCount", vo);	
		
	}		
	
	// 최근 주문 조회
	public Map<String, Object> recentOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO recentOrder 실행 <---");
		
		return mybatis.selectOne("OrderDAO.recentOrder", vo);	
		
	}
	
	/************ 관리자 부문************/
	
	// 일주일 주문 카운트
	public List<Map<String, Object>> orderDateCount(OrderVO vo) {
		
		System.out.println("---> OrderDAO orderDateCount 실행 <---");
		
		return mybatis.selectList("OrderDAO.orderDateCount", vo);	
		
	}

	// 관리자
	// 주간 취소/반품 카운트
	public List<Map<String, Object>> orderCancelDateCount(OrderVO vo) {
		
		System.out.println("---> OrderDAO orderCancelDateCount 실행 <---");
		
		return mybatis.selectList("OrderDAO.orderCancelDateCount", vo);	
		
	}

	// 월간 주문 카운트
	public List<Map<String, Object>> orderMlyDateCount(OrderVO vo) {

		System.out.println("---> OrderDAO orderMlyDateCount 실행 <---");
		
		return mybatis.selectList("OrderDAO.orderMlyDateCount", vo);	
	}

	public List<Map<String, Object>> orderMlyCancelDateCount(OrderVO vo) {
		
		System.out.println("---> OrderDAO orderMlyCancelDateCount 실행 <---");
		
		return mybatis.selectList("OrderDAO.orderMlyCancelDateCount", vo);
	}
	
	// 결제취소/반품 승인
	public void orderAprvl(OrderVO vo) {
		
		mybatis.update("OrderDAO.orderAprvl", vo);
		
	}

	// 주문 총 관리 리스트
	public List<Map<String, Object>> orderMngmn(SearchCriteria cri) {

		return mybatis.selectList("OrderDAO.orderMngmn", cri);
	}

	// 주문 총 관리 카운트
	public int orderMngmnCount(SearchCriteria cri) {

		return mybatis.selectOne("OrderDAO.orderMngmnCount", cri);
	}

	// 주문 총 관리 세부내역
	public List<Map<String, Object>> orderMngmnDtls(OrderVO vo) {

		return mybatis.selectList("OrderDAO.orderMngmnDtls", vo);
	}
	
	/*[관리자] 일주일 도서 주문량 -------------------------------------------------------------*/
	public List<Map<String, Object>> orderBy7DaysBook(){
		System.out.println("---> OrderDAO orderBy7DaysBook() 실행 <---");
		
		return mybatis.selectList("OrderDAO.Order_BY_7DAYS");
		
	}



}
