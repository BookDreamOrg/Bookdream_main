package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.UserVO;

@Repository
public class QnADAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void QnAInsert(QnAVO qnaVO) {
		mybatis.insert("QnADAO.qnaInsert", qnaVO);
	}
	
	//나의 문의 목록 리스트
	public List<QnAVO> getMyQnAList(QnAVO qnaVO){
		System.out.println("MyList");
		return mybatis.selectList("QnADAO.getMyQnAList", qnaVO);
	}
	
	//문의 가져오기
	public QnAVO getQnA(QnAVO qnaVO) {
		return mybatis.selectOne("QnADAO.getQnA", qnaVO);
	}
	
	//문의 수정
	public void updateQnA(QnAVO qnaVO) {
		mybatis.update("QnADAO.updateQnA", qnaVO);
	}
	
	//문의 삭제
	public void deleteQnA(QnAVO qnaVO) {
		mybatis.delete("QnADAO.deleteQnA", qnaVO);
	}	
	
	//답변대기 리스트 가져오기
	public List<QnAVO> getWaitQnAList(){
		return mybatis.selectList("QnADAO.getWaitQnAList");
	}
	
	//문의완료 리스트
	public List<QnAVO> getClearQnAList(){
		return mybatis.selectList("QnADAO.getClearQnAList");
	}
		
	//답변 insert
	public void insertAnswer(AnswerVO answerVO) {
		System.out.println("answerDAO");
		System.out.println(answerVO.getAns_content());
		System.out.println(answerVO.getUser_no());
		mybatis.insert("QnADAO.insertAnswer", answerVO);
	}
		
	//답변 체크
	public void answerCheck(QnAVO qnaVO) {
		mybatis.update("QnADAO.answerCheck", qnaVO);
	}
	
	//질문 번호에 따른 답변 가져오기
	public List<AnswerVO> getAnswer(QnAVO qnaVO) {
		return mybatis.selectList("QnADAO.getAnswer", qnaVO);
	}
	
	//나의 문의 목록 리스트
	public List<Map<String, Object>> getRecentMyQnAList(QnAVO qnaVO){
		System.out.println("MyList 3개");
		return mybatis.selectList("QnADAO.getRecentMyQnAList", qnaVO);
	}
	
	// 유저번호에 맞는 유저정보 가져오기
	public List<UserVO> getQnAUser() {
		return mybatis.selectList("QnADAO.getQnAUser");
	}
	
	// 페이징 답변대기 스트 가져오기
	public List<QnAVO>getAllQnAPageList(QnAVO qnaVO){
		return mybatis.selectList("QnADAO.getAllQnAPageList", qnaVO);
	}
	
	// 페이징 답변완료 리스트 가져오기
	public List<QnAVO>getClearQnAPageList(QnAVO qnaVO){
		return mybatis.selectList("QnADAO.getClearQnAPageList", qnaVO);
	}
	
	//전체 문의 리스트
	public List<QnAVO> getAllQnAList(){
		return mybatis.selectList("QnADAO.getAllQnAList");
	}
}
