package com.spring.bookdream.service;

import com.spring.bookdream.vo.KeywordHistoryVO;

public interface SearchKeywordHistoryService {
	
	//검색한 키워드 데이터에 추가
	void searchingKeyword(String keyword);
}
