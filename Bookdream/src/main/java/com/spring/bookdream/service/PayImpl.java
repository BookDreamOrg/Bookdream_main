package com.spring.bookdream.service;



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
	public void updatePay(PayVO vo) {
		payDAO.updatePay(vo);
		
	}

}
