package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.AddressVO;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 주소 목록 조회
	public List<AddressVO> getAddressList(AddressVO vo) {
		
		return mybatis.selectList("AddressDAO.getAddressList", vo);
	}
	
	// 주소 신규 등록
	public void insertAddress(AddressVO vo) {
		
		mybatis.insert("AddressDAO.insertAddress", vo);
	}	
	
	// 기본 주소 설정
	public void defaultAddress(AddressVO vo) {
		
		mybatis.update("AddressDAO.defaultAddress", vo);
		mybatis.update("AddressDAO.defaultAddress2", vo);			
	}
	
	// 주소 삭제
	public int deleteAddress(AddressVO address_no) {
		
		return mybatis.delete("AddressDAO.deleteAddress", address_no);
	}	
	
	// 선택한 주소의 값 호출
	public AddressVO getAddress(AddressVO vo) {

		return mybatis.selectOne("AddressDAO.getAddress", vo);
	}
	
	// 주소 수정
	public void updateAddress(AddressVO vo) {
		
		mybatis.update("AddressDAO.updateAddress", vo);		
	}	

	// 기본 주소 조회
	public AddressVO getDefaultAddress(AddressVO vo) {

		return mybatis.selectOne("AddressDAO.getDefaultAddress", vo);
	}
}