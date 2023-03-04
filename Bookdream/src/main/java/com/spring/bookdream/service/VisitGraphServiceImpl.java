package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.VisitDAO;
import com.spring.bookdream.vo.VisitVO;

@Service("visitService")
public class VisitGraphServiceImpl implements VisitGraphService {
	
	@Autowired
	VisitDAO visitDAO;

	@Override
	public List<VisitVO> countVisitor(VisitVO vo) {
		return visitDAO.countVisitor(vo);
	}

}
