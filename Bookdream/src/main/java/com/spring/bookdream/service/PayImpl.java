package com.spring.bookdream.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.PayDAO;
import com.spring.bookdream.vo.PayVO;


@Service("PayService")
public class PayImpl implements PayService {
	
	@Autowired
	private PayDAO payDAO;

	@Override
	public void insertPay(PayVO vo) {
		payDAO.insertPay(vo);
	}

	@Override
	public PayVO searchPay(PayVO vo) {
		
		return payDAO.searchPay(vo);
	}

	@Override
	public Map<String, Object> lastPayment(PayVO vo) {
		
		return payDAO.lastPayment(vo);
	}

	// 주간 결제 금액
	@Override
	public List<Map<String, Object>> payWekTotalPrice(PayVO vo) {
		
		return payDAO.payWekTotalPrice(vo);
	}

	// 월간 결제 금액
	@Override
	public List<Map<String, Object>> payMlyTotalPrice(PayVO vo) {
		
		return payDAO.payMlyTotalPrice(vo);
	}

	@Override
	public Map<String, Object> totalPaymentAmount(PayVO vo) {
		
		return payDAO.totalPaymentAmount(vo);
	}

	// 결제수단 비율
	@Override
	public Map<String, Object> payMethodRate() {

		return payDAO.payMethodRate();
	}

}
