package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.SearchKeywordDAO;
import com.spring.bookdream.vo.KeywordHistoryVO;


@Service("SearchKeywordService")
public class SearchKeywordServiceImpl implements SearchKeywordService {

	@Autowired
	private SearchKeywordDAO searchingKeywordDAO;
	
	@Override
	public void searchingKeyword(String keyword) {
			KeywordHistoryVO vo = new KeywordHistoryVO();
			vo.setKeyword(keyword);
			searchingKeywordDAO.insertSearchKeyword(vo);
		
	}

	@Override
	public List<Map<String, Object>> viewAutoKeyword(Map<String, Object> paramMap) throws Exception {
		return searchingKeywordDAO.viewAutoKeyword(paramMap);
	}
}
