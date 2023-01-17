package com.spring.bookdream.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.UserVO;

// DAO (Data Access Object)
@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 유저정보 상세 조회
		public UserVO getUser(UserVO vo) {
			System.out.println("---> JDBC로 getUser() 기능 처리");
			// selectOne : select 조회 SQL문에서 결과값이 한개의 row인 return일때 사용
			return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
		}
	
		// 로그인 확인
		public boolean loginCheck(UserVO vo) {
			String name = mybatis.selectOne("UserDAO.loginCheck", vo);
			System.out.println("userDAO " + name);
			boolean result = false;
			if(name != null) {
				result = true;
			}
			return result;
		}
		
		// 회원가입
		public void insertUser(UserVO vo) {
			System.out.println("insertUser처리");
			vo.setUser_email(vo.getUser_email()+vo.getUser_email2());
			
			mybatis.insert("UserDAO.insertUser", vo);
		}
		
		// 카카오 정보 저장
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			System.out.println("카카오 insert완료");
			mybatis.insert("UserDAO.kakaoInsert",userInfo);
		}

		// 카카오 정보 확인
		public UserVO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			
			return mybatis.selectOne("UserDAO.findKakao", userInfo);	
		}
		
		// 플랫폼 정보 가져오기
		public String findFlatform(UserVO vo) {
			System.out.println("플랫폼 정보 가져오기");
			System.out.println(vo.getUser_name());
			System.out.println(vo.getUser_email());
			
			return mybatis.selectOne("UserDAO.findFlatform", vo);
		}
		
		// 아이디 중복 확인
		public int idCheck(String id) {
			System.out.println("UserDAO");
			int cnt =0;
			cnt = mybatis.selectOne("UserDAO.idCheck", id);
			System.out.println(cnt);
			return cnt;
		}
	
}
