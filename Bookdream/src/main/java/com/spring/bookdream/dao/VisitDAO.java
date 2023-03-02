package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.VisitVO;

@Repository("visitDAO")
public class VisitDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	private static VisitDAO instance;

	// 싱글톤 패턴
	private VisitDAO(){}

	public static VisitDAO getInstance() {
		if (instance == null)
			instance = new VisitDAO();
		return instance;
	}

	public void insertVisitor(VisitVO vo) {
		System.out.println("INSERT VISITOR 실행");
		mybatis.insert("VisitDAO.insertVisitor", vo);
	}
	
	public List<VisitVO> countVisitor(VisitVO vo) {
		System.out.println("VISIT COUNTER 실행");
		return mybatis.selectList("VisitDAO.countVisitor", vo);
	}

}
