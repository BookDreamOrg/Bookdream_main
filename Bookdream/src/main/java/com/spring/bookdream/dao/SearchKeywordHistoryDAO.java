package com.spring.bookdream.dao;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.KeywordHistoryVO;

@Repository
public class SearchKeywordHistoryDAO {

	public SearchKeywordHistoryDAO() {

	}
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Autowired
	private HttpSession session;
	
	public void insertSearchKeyword(KeywordHistoryVO vo) {
		String user_id = (String)session.getAttribute("user_id");
		String keyword = vo.getKeyword();
		//키워드에 아무것도 입력하지 않았을 경우 실행되지 않음
		if(!keyword.trim().isEmpty()) {
			System.out.println("---> SearchKeywordHistoryDAO() > insertSearchKeyword()");
			if( user_id == null ) {
				vo.setUser_id(user_id);
				vo.setLogin_yn("N");
			}else {
				vo.setUser_id(user_id);
				vo.setLogin_yn("Y");
			}
			mybatis.insert("SearchKeywordHistoryDAO.insertSearchKeyword",vo);
		}
		
				
	}
}
