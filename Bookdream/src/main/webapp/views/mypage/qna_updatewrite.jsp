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

.form_textarea{
	width: 100%;
	margin-top: 5px;
}
</style>
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
												<option value="message">요청사항을 직접 입력합니다.</option>
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
		<script type="text/javascript">
		function updateQnAIn(){
			var qna_no = $('#qna_no').val();
			var qna_type = $('#qna_type').val();
			var qna_title = $('#qna_title').val();
			var qna_content = $('#qna_content').val();
			console.log(qna_no);
			console.log(qna_type);
			console.log(qna_title);
			console.log(qna_content);
			
			$.ajax({
				type : "POST",
				url : "/mypage/updateQnAInfo",
				data : {
						qna_no : qna_no,
						qna_type : qna_type,
						qna_title : qna_title,
						qna_content : qna_content
						},
				success : function(data){
					alert('수정되었습니다.');
					location.href='/mypage/getMyQnAList';
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
		
	<script>
		let user_no =
	<%=(int) session.getAttribute("user_no")%>
		;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>	
</body>
</html>