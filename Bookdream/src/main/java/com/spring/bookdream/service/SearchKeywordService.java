package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.AddressVO;
import com.spring.bookdream.vo.KeywordHistoryVO;

public interface SearchKeywordService {
	
	//검색한 키워드 데이터에 추가
	void searchingKeyword(String keyword);
	
	List<Map<String, Object>>viewAutoKeyword(Map<String, Object> paramMap) throws Exception;
	
	// 상위 누적 키워드 랜덤 5개 추천도서로 표시
	List<KeywordHistoryVO> rcmndBooklist(KeywordHistoryVO vo);
}
