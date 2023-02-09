<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />

	<style>
.side {
	position: relative;
	width: 220px;
	min-height: 500px;
	margin-top: 130px;
	border-radius: 20px;
	float: left;
	background-color: #d1d1e5;
	text-align: center;
}

.rside {
	height: auto;
	width: 950px;
	min-height: 1200px;
	float: right;
	margin-top: 130px;
}

.main {
	line-height: 180%;
	position: relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;
	min-height: 1000px;
}

.user-btn {
	color: var(- -main-color-shadow6);
	font-size: 2rem;
}

.qna_title{
	font-size: 30px;
	float: left;
}
.qna_button{
	float: right;
}
.qna_body{
	margin-top: 100px;
}

.qna_list_title{
	font-size: 20px;
}

.qna_list_date{
	float: right;
}
.qna_sumbmit{
	display: flex;
 	margin-top: 20px;
}

.qna_submit_btn{
	display: flex;
	margin-left: auto;
}

.qna_update_btn{
	margin-right:10px;
}
</style>
<title>Insert title here</title>
</head> 
<body>
	
	<jsp:include page="/views/inc/header.jsp" />

			
			<div class="container">
				
				<div class="main">
					
					<div class="rside">
						<div class="qna_header">
								<p class="qna_title">1:1 문의답변 <p>
						</div>
						<div class="qna_body">
								<c:choose>
									<c:when test="${empty qnaAllList }">
										<p>문의 받은 내역이 없습니다.</p>
									</c:when>
									<c:when test="${!empty qnaAllList }">
										<c:forEach var="list" items="${ qnaAllList}" varStatus="vs">
											<div>
												<div>
												 	<i class="bi bi-chat-fill fs-10"></i> 
												 	문의한 유저번호:  <span class="qna_list_title" id="user_no2" name="user_no2">${list.getUser_no() }</span>
												 	문의내용:  <span class="qna_list_title" id="qna_title" name="qna_title">${list.getQna_title() }</span>
												 	
													<input type="hidden" id="user_no" name="user_no" value="${list.getUser_no() }">
													<div class="qna_list_date">
														<div>${list.getReg_date() }</div>
														<div style="display:none"><p id="qna_no">${list.getQna_no() }</p></div>
													</div>
												</div>	
											</div>
												
											<i class="bi bi-arrow-down-circle-fill" data-bs-toggle="collapse" data-bs-target="#collapseEx${list.getQna_no() }"
														aria-expanded="false" aria-controls="collapseEx${list.getQna_no() }"></i>
											<div class="collapse" id="collapseEx${list.getQna_no() }">
												<div class="card card-body" id="qna_content" name="qna_content">
													${list.getQna_content() }
												</div>
												<div class="qna_sumbmit">
													<div class="qna_submit_btn">
														<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalQnA${vs.index }">
														  답변
														</button>
													
														<!------------------------- Modal ------------------------------>
													<div class="modal fade" id="ModalQnA${vs.index }" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="ModalLabel">답변하기</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        <textarea class="form_textarea" id="ans_content" name="ans_content" maxlength="500" style="width:465px; height: 246px"></textarea>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick='answer_btn()'>답변</button>
													      </div>
													    </div>
													  </div>
													</div>
													</div>
												</div>
												<hr>
											</div>
														
										</c:forEach>
									</c:when>
								</c:choose>
						</div>
					</div>
					
					<!-- side -->
				<div class="side">
					<div class="user_btn"><i class="fa-solid fa-user"></i></div>
					<div><a href="/views/mypage/mypage.jsp">${authUser.getUser_name() }</a>님 환영합니다.</div>
					<h1><a href="/mypage/edit">회원정보 관리</a></h1>
					<!-- Button trigger modal -->
					<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  회원탈퇴
					</button>
					
					<div><a href="/mypage/address">배송지 관리</a></div>
					<div><a href="/mypage/tracking">배송 조회</a></div>
					<div><a href="#">나의 구매내역</a></div>
					<div><a href="/mypage/getMyQnAList">1:1문의</a></div>
					<div><a href="#">상품문의</a></div>
					<div><a href="/mypage/getAllQnAList">관리자 답변</a></div>
					
				</div>	
					
				</div>
				
				
			</div>
			
		<jsp:include page="/views/inc/footer.jsp" />

		<script type="text/javascript">
			function answer_btn(){
				var user_no = $('#user_no').val();
				var ans_content = $('#ans_content').val();
				var ans_title = $('#ans_title').val();
				console.log(user_no);
				console.log(ans_title);
				$.ajax({
					type : "POST",
					url : "/mypage/answerQnA",
					data : {
							user_no : user_no,
							ans_content : ans_content
							},
					success : function(data){
						alert('답변완료 되었습니다.');
					},
					error : function(){
						alert('서버에러입니다.');
					}
				});
				
			}
		</script>
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</body>
</html>