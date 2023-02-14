<%@page import="com.spring.bookdream.vo.UserVO"%>
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/qna_write.css" />

<title>Insert title here</title>
</head> 
<body>
<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />

			
			<div class="container">
				
				<div class="main">
					
					<div class="rside">
						<div class="qna_header">
								<p class="qna_title">1:1 문의<p>
						</div>
						<div class="user_info_table">
							<table class="table table-board">
								<tr>
									<td>문의 유형</td>
									<td>
										<select class="form-select" id="qna_type" onchange="">
												<option selected>문의유형을 선택해주세요!</option>
												<option value="배송/수령일정일안내">배송/수령일정일안내</option>
												<option value="주문/결제">주문/결제</option>
												<option value="검색기능관련">검색기능관련</option>
												<option value="반품/교롼/환불">반품/교롼/환불</option>
												<option value="도서/상품정보">도서/상품정보</option>
												<option value="회원정보서비스">회원정보서비스</option>
										</select>
									</td>
								<tr>
									<td>내용</td>
									<td>
										<div>
											<div class="col_box">
												<input class="form-control" type="text" id="qna_title" name="qna_title" placeholder="제목을 입력해주세요" value="${getQnA.getQna_title() }">
												<input class="form-control" type="hidden" id="qna_no" value="${getQnA.getQna_no() }" >
											</div>
											<div class="col_box">
												<div class="box_area">
													<textarea class="form_textarea" id="qna_content" name="qna_content" maxlength="500" style="height: 246px"
													placeholder="빠른 답변을 위해  10자 이상의 문의 내용을 입력해주세요" >${getQnA.getQna_content() }
													</textarea>
												</div>
											</div>
										</div>
									</td>
								<tr>
								
								</tr>
							</table>
							<div class="qna_btn btn btn-success" type="button" onclick="updateQnAIn()">
								수정하기
							</div>
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
					
				</div>	
					
				</div>
				
				
			</div>
			
		<jsp:include page="/views/inc/footer.jsp" />
</div>	

		<script src="/resources/js/qna_updatewrite.js"></script>
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
		
	<script>
		let user_no =
	<%=(int) session.getAttribute("user_no")%>
		;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>

	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
</body>
</html>