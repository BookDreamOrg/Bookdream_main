package com.spring.bookdream.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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
	
		//모든 유저 리스트 가져오기
		public List<UserVO> getAllUserList(){
			return mybatis.selectList("UserDAO.getAllUserList");
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
		
		// 구글 정보 저장
		public void googleinsert(UserVO vo) {
			System.out.println("google inesrt완료");
			mybatis.insert("UserDAO.googleInsert", vo);
		}
		
		// 네이버 정보저장
		public void naverinsert(UserVO vo) {
			System.out.println("naver insert완료");
			mybatis.insert("UserDAO.naverInsert", vo);
		}
		

		// 카카오 정보 확인
		public UserVO findkakao(UserVO vo) {
			return mybatis.selectOne("UserDAO.findKakao", vo);	
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
	
		//이름, 이메일로 아이디 찾기
		public String idFind(UserVO vo) {
			System.out.println(vo.getUser_name());
			System.out.println(vo.getUser_email());
			String id = mybatis.selectOne("UserDAO.idFind", vo);
			System.out.println(id);
			return id;
		}
		
		//아이디, 이름, 이메일로 비밀번호 찾기
		public String pwFind(UserVO vo) {
			String pw = mybatis.selectOne("UserDAO.pwFind", vo);
			return pw;
		}
		
		// naver, google 소셜로그인 정보 확인
		public UserVO getBySns(UserVO snsUser) {
			if(StringUtils.equals(snsUser.getFlatform_type(), "naver")) {
				return mybatis.selectOne("UserDAO.findNaver", snsUser.getUser_email());
			} else {
				return mybatis.selectOne("UserDAO.findGoogle", snsUser.getUser_email());
			}
		}
		
		//회원정보 수정
		public void updateUser(UserVO vo) {
			System.out.println("userDAO : " + vo.getUser_id());
			System.out.println("userDAO : " + vo.getUser_password());
			mybatis.update("UserDAO.updateUser", vo);
		}
		
		// 회원탈퇴
		public void deleteUser(UserVO vo) {
			mybatis.delete("UserDAO.deleteUser", vo);
		}
		
		// 회원조회
		public List<UserVO> selectUser() {
			System.out.println("Uesr List 불러오는중...");
			
			return mybatis.selectList("UserDAO.selectUser");
		}
		
		// 유저 count
		public int countUser() {
			return mybatis.selectOne("UserDAO.countUser");
		}
		
		// User list page
		public List userListPage(int displayPost, int postNum) {
			
			HashMap<String, Integer> data = new HashMap<String, Integer>();
			
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);
			
			return mybatis.selectList("UserDAO.userListPage", data);
		}
		
		// User Get By user_no
		public UserVO getUserByNo(int no) {
			return (UserVO) mybatis.selectOne("UserDAO.getUserByNo", no);
		}
		
		// Set BlackList
		public void setBlack(int no) {
			mybatis.update("UserDAO.setBlack", no);
		}
}
