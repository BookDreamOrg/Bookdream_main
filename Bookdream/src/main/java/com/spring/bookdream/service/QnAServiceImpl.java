package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.QnADAO;
import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.UserVO;

@Service("QnAService")
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO qnaDAO; 
	
	@Override
	public void QnAInsert(QnAVO qnaVO) {
		qnaDAO.QnAInsert(qnaVO);
	}
	
	//나의 문의 목록 리스트
	public List<QnAVO> getMyQnAList(QnAVO qnaVO){
		return qnaDAO.getMyQnAList(qnaVO);
	}
	
	//문의 가져오기
	public QnAVO getQnA(QnAVO qnaVO) {
		return qnaDAO.getQnA(qnaVO);
	}
	
	//문의 수정
	public void updateQnA(QnAVO qnaVO) {
		qnaDAO.updateQnA(qnaVO);
	}
	
	//문의 삭제
	public void deleteQnA(QnAVO qnaVO) {
		qnaDAO.deleteQnA(qnaVO);
	}
	
	//전체 문의 리스트
	public List<QnAVO> getAllQnAList(){
		return qnaDAO.getAllQnAList();
	}
	
	//답변 insert
	public void insertAnswer(AnswerVO answerVO) {
		qnaDAO.insertAnswer(answerVO);
	}

	//마이페이지 나의 문의 목록 리스트 (3개)
	public List<QnAVO> getRecentMyQnAList(QnAVO qnaVO) {
		return qnaDAO.getRecentMyQnAList(qnaVO);
	}
		
	//답변 체크
	public void answerCheck(QnAVO qnaVO) {
		qnaDAO.answerCheck(qnaVO);
	}
	
	//질문 번호에 따른 답변 가져오기
	public List<AnswerVO> getAnswer(QnAVO qnaVO) {
		return qnaDAO.getAnswer(qnaVO);
	}
		
	// 유저번호에 맞는 유저정보 가져오기
	public List<UserVO> getQnAUser() {
		return qnaDAO.getQnAUser();
	}
}
