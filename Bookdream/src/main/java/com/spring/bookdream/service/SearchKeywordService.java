package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.KeywordHistoryVO;

public interface SearchKeywordService {
	
	//검색한 키워드 데이터에 추가
	void searchingKeyword(String keyword);
	
	List<Map<String, Object>>viewAutoKeyword(Map<String, Object> paramMap) throws Exception;
}
