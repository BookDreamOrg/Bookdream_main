package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.UserVO;

public interface QnAService {
	
	//문의 등록
	public void QnAInsert(QnAVO qnaVO);
	
	//나의 문의 목록 리스트
	public List<QnAVO> getMyQnAList(QnAVO qnaVO);
	
	//문의 가져오기
	public QnAVO getQnA(QnAVO qnaVO);
	
	//문의 수정
	public void updateQnA(QnAVO qnaVO);
	
	//문의 삭제
	public void deleteQnA(QnAVO qnaVO);
	
	//문의대기 리스트
	public List<QnAVO> getWaitQnAList();
	
	//문의완료 리스트
	public List<QnAVO> getClearQnAList();
	
	//답변 insert
	public void insertAnswer(AnswerVO answerVO);
	
	//답변 전달
	public void answerCheck(QnAVO qnaVO);
	
	//질문 번호에 따른 답변 가져오기
	public List<AnswerVO> getAnswer(QnAVO qnaVO);
	
	//마이페이지 나의 문의 목록 리스트 (3개)
	public List<Map<String, Object>> getRecentMyQnAList(QnAVO qnaVO);	
	
	// 유저번호에 맞는 유저정보 가져오기
	public List<UserVO> getQnAUser();
	
	// 페이징 답변대기 리스트 가져오기
	public List<QnAVO>getAllQnAPageList(QnAVO qnaVO);
	
	// 페이징 답변완료 리스트 가져오기
	public List<QnAVO>getClearQnAPageList(QnAVO qnaVO);
	
	//전체 문의 리스트
	public List<QnAVO> getAllQnAList();
}
