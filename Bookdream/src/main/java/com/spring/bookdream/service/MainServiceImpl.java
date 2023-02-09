package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.BookDAO;
import com.spring.bookdream.vo.BookVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private BookDAO bookDAO;

	@Override
	public List<BookVO> bestSeller() {
		return bookDAO.bestSeller();
	}

	@Override
	public List<BookVO> bestSellerByReviewCount() {
		return bookDAO.bestSellerByReviewCount();
	}

	@Override
	public List<BookVO> bestSellerByReviewGrade() {
		return bookDAO.bestSellerByReviewGrade();
	}

}
