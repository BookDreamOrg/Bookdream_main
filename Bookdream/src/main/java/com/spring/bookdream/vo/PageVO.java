package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class PageVO {
	  private int startPage;
	  private int endPage;
	  private boolean prev, next;
	  private int totalPage;
	  private int displayPageItems = 5; // 슷자블럭 개수

	  private SearchCriteria cri;
	  
	  public PageVO() {

	  }
	  
	  public PageVO(SearchCriteria cri, int totalPage) {

	    this.cri = cri;
	    if (totalPage == 0) {
	    	this.totalPage = 1;
	    } else {
		    this.totalPage = totalPage;
	    }
	 
	    this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) displayPageItems)) * displayPageItems;
	    this.startPage = (this.endPage - displayPageItems) + 1;
	    int realEnd = (int) (Math.ceil(totalPage / (double) cri.getAmount()));
	    if (realEnd <= this.endPage) {
	      this.endPage = realEnd;
	    }

	    this.prev = this.startPage > 1;
	    this.next = this.endPage < realEnd;
	    
	    // pageNumber가 endPage이면서, endPage에 게시글이 한개만 있는 경우, 해당 게시글을 삭제하면
	    // endPage가 1이 감소하여, 현재 pageNumber도 endPage로 수정  
	    if (this.cri.getPageNum() > this.endPage) {
	    	this.cri.setPageNum(endPage);
	    }
	    
	    System.out.println("cri : " + cri);
	    System.out.println("totalPage : " + totalPage);
	    System.out.println("endPage : " + endPage);
	    System.out.println("startPage : " + startPage);
	    System.out.println("realEnd : " + realEnd);
	    System.out.println("prev : " + prev);
	    System.out.println("next : " + next);
	  }


}
