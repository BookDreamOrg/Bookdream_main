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
<style>

/* password */
.pw_ok {
	color: #008000;
	display: none;
}

.pw_no {
	color: #6A82FB;
	display: none;
}
/* side */
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

.user_info_title {
	font-size: 30px;
	margin-bottom: 10px;
}
</style>

<title>회원정보 수정</title>
</head>
<body>
	<%
		UserVO user = (UserVO) session.getAttribute("authUser");
	%>
	<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />
	<div class="container">
		<div class="main">
			<div class="rside">
				<div class="user_info_title">
					<p>회원정보 수정
					<p>
				</div>
				<hr>
				<div class="user_info_table">
					<table class="table table-board">
						<tr>
							<td>아이디</td>
							<td><input type="text" disabled class="form-control"
								id="user_id" name="user_id" value="<%=user.getUser_id()%>"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" class="form-control"
								id="user_password" name="user_password"
								onchange="PasswordCheck()"></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인</td>
							<td><input type="password" class="form-control"
								id="user_passwordcheck" name="user_passwordcheck"
								onchange="PasswordCheck()"></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<div>
									<span class="pw_ok">비밀번호가 일치합니다!</span> <span class="pw_no">비밀번호가
										일치하지 않습니다!</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="input" class="form-control" id="user_name"
								name="user_name" value="<%=user.getUser_name()%>"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="input" class="form-control" id="user_email"
								name="user_email" value="<%=user.getUser_email()%>"></td>
						</tr>
					</table>

					<div class="d-grid gap-2">
						<button type="button" class="btn btn-light " id="modal_reg_check"
							onclick="updateUser()">저장</button>
					</div>
				</div>
			</div>

			<div class="side">
				<div>
					<a href="/views/mypage/mypage.jsp">${authUser.getUser_name() }</a>님
					환영합니다.
				</div>
				<h1>
					<a href="/mypage/edit">회원정보 관리</a>
				</h1>
				<!-- Button trigger modal -->
				<button type="button" class="btn" data-bs-toggle="modal"
					data-bs-target="#exampleModal">회원탈퇴</button>

				<div>
					<a href="/mypage/address">배송지 관리</a>
				</div>
				<div>
					<a href="/mypage/tracking">배송 조회</a>
				</div>
				<div>
					<a href="#">나의 구매내역</a>
				</div>
				<div>
					<a href="/mypage/getMyQnAList">1:1문의</a>
				</div>
				<div>
					<a href="#">상품문의</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		function updateUser() {
			var id = $('#user_id').val();
			var password = $('#user_password').val();
			var password_check = $('#user_passwordcheck').val();
			var name = $('#user_name').val();
			var email = $('#user_email').val();

			$.ajax({
				url : '/mypage/updateUser',
				type : 'post',
				data : {
					id : id,
					password : password,
					password_check : password_check,
					name : name,
					email : email
				},
				success : function(data) {
					console.log(data);
					if (data === "error") {
						alert('입력칸을 확인해주세요!');
					} else if (data === "password_error") {
						alert('비밀번호가 달라요!');
					} else {
						$('#modal').fadeOut();
						document.location.href(data);
					}

				},
				error : function() {
					alert('서버 에러입니다.');
				}
			});

		}

		function PasswordCheck() {
			var pw = $('#user_password').val();
			var pwCheck = $('#user_passwordcheck').val();

			if (pw != pwCheck) { // 비밀번호가 일치하지 않는다면
				$('.pw_no').css("display", "inline-block");
				$('.pw_ok').css("display", "none");
			} else { // 비밀번호가 일치한다면
				$('.pw_no').css("display", "none");
				$('.pw_ok').css("display", "inline-block");
			}
		};
	</script>

	<jsp:include page="/views/inc/footer.jsp" />
	</div>
	</div>
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