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

	public List<AddressVO> getAddressList(AddressVO vo) {
		
		return mybatis.selectList("AddressDAO.getAddressList", vo);
	}
	
	public void insertAddress(AddressVO vo) {
		
		mybatis.insert("AddressDAO.insertAddress", vo);
	}	
	
	public void defaultAddress(AddressVO vo) {
		
		mybatis.update("AddressDAO.defaultAddress", vo);
		mybatis.update("AddressDAO.defaultAddress2", vo);			
	}
	
	public int deleteAddress(AddressVO address_no) {
		
		return mybatis.delete("AddressDAO.deleteAddress", address_no);
	}	
	
	public AddressVO getAddress(AddressVO vo) {

		return mybatis.selectOne("AddressDAO.getAddress", vo);
	}
	
	public void updateAddress(AddressVO vo) {
		
		mybatis.update("AddressDAO.updateAddress", vo);		
	}	
	
}