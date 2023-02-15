package com.spring.bookdream.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.SearchKeywordService;

@Controller
public class SearchKeywordController {
	
	@Autowired
	private SearchKeywordService keywordService;
	 
	
/************************************자동 완성 키워드 보여주기****************************************/	
	@PostMapping(value="/viewAutoKeyword")
	@ResponseBody
	public Map<String, Object> viewAutoKeyword(@RequestParam Map<String, Object> paramMap, String keyword) throws Exception{
		System.out.println("viewAutoKeyword()");
		System.out.println("keyword : " + keyword);
		List<Map<String, Object>> resultList = keywordService.viewAutoKeyword(paramMap);
	
		paramMap.put("resultList", resultList);
		System.out.println(paramMap.toString());
		
		return paramMap;
	
	}

	
/************************************메인에서 인기검색어 보여주기****************************************/	
	@GetMapping(value = "/bestSearchKeyword")
	@ResponseBody
	public List<String> bestSearchKeyword() {
		List<String> bestSearchKeyword = new ArrayList<String>();
		bestSearchKeyword = keywordService.bestSearchKeyword();
		System.out.println("bestSearchKeyword" + bestSearchKeyword);
	
		return bestSearchKeyword;
	
	}
}
