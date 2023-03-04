package com.spring.bookdream.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.DeliveryVO;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertDelivery(DeliveryVO vo) {
		
		mybatis.insert("DeliveryDAO.insertDelivery", vo);
		
	}

	public void updateDelivery(DeliveryVO vo) {
		
		// 송장번호, 택배사 등록
		mybatis.insert("DeliveryDAO.updateDelivery", vo);
		
		// 결제완료 -> 배송중
		mybatis.insert("DeliveryDAO.startDelivery", vo);
		
	}

	public void cmpltDelivery(DeliveryVO vo) {
		
		// 배송중 -> 배송완료
		mybatis.insert("DeliveryDAO.cmpltDelivery", vo);
		
	}

	// 배송조회
	public Map<String, Object> getDelivery(DeliveryVO delivery) {
		return 	mybatis.selectOne("DeliveryDAO.getDelivery", delivery);
	}
	
}