package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.QnAVO;

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
	
	//전체 문의 리스트
	public List<QnAVO> getAllQnAList(){
		return mybatis.selectList("QnADAO.getAllQnAList");
	}
	
	//답변 insert
	public void insertAnswer(AnswerVO answerVO) {
		System.out.println("answerDAO");
		System.out.println(answerVO.getAns_content());
		System.out.println(answerVO.getUser_no());
		mybatis.insert("QnADAO.insertAnswer", answerVO);
	}

	//나의 문의 목록 리스트
	public List<QnAVO> getRecentMyQnAList(QnAVO qnaVO){
		System.out.println("MyList 3개");
		return mybatis.selectList("QnADAO.getRecentMyQnAList", qnaVO);
	}
}
