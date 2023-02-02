package com.spring.bookdream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.SearchKeywordHistoryDAO;
import com.spring.bookdream.vo.KeywordHistoryVO;


@Service("SearchKeywordHistoryService")
public class SearchKeywordHistoryServiceImpl implements SearchKeywordHistoryService {

	@Autowired
	private SearchKeywordHistoryDAO searchingKeywordHistoryDAO;
	
	@Override
	public void searchingKeyword(String keyword) {
			KeywordHistoryVO vo = new KeywordHistoryVO();
			vo.setKeyword(keyword);
			searchingKeywordHistoryDAO.insertSearchKeyword(vo);
		
	}
}
