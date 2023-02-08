package com.spring.bookdream.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class SearchCriteria {
	private int user_no;
    private int pageNum;
	private int amount;
	private String searchCondition;
	private String searchKeyword;
	
	public SearchCriteria() {
		this.pageNum = 1;
		this.amount = 2;
		this.searchCondition = "TITLE";
		this.searchKeyword = "";
	}
	
	public void setPageNum(int pageNum) {
		if (pageNum <= 0) { 
			this.pageNum = 1; 
			return; 
		} 
		this.pageNum = pageNum;
	}


	public void setAmount(int amount) {
		if (amount <= 0 || amount > 100) { 
			this.amount = 2; 
			return;
		}
		this.amount = amount;
	}


	public String makeQuery() {
		
		// UriComponests : URL Path를 만들어주는 spring library class
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("searchCondition", this.searchCondition)
				.queryParam("searchKeyword", this.searchKeyword)
				.build();
		
		return uriComponents.toUriString();
	}
	
}
