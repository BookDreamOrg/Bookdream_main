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
<link rel="stylesheet" href="/resources/css/unregister.css" />
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
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		UserVO user = (UserVO) session.getAttribute("authUser");
	%>
	<jsp:include page="/views/inc/header.jsp" />


	<div class="container">
		<h1>
			<a href="/views/mypage/edit.jsp">회원정보 관리</a>
		</h1>
		<!-- Button trigger modal -->
		<button type="button" class="btn" data-bs-toggle="modal"
			data-bs-target="#unregisterModal">회원탈퇴</button>

		<!-- Modal -->
		<div class="modal fade" id="unregisterModal" tabindex="-1"
			aria-labelledby="unregisterModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered unregister_modal">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title unregister_modal_title"
							id="exampleModalLabel">회원탈퇴</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="unregister_modal_body">
							<div class="unregister_modal_law">
								<ol>
									<li>회원탈퇴 시 개인정보 및 BOOKDREAM에서 만들어진 모든 데이터는 삭제됩니다.</li>
									<li>(단, 아래 항목은 표기된 법률에 따라 특정 기간 보관됩니다.)</li>
									<li>1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호엥 관한 법률
										/ 보존 기관 : 5년</li>
									<li>2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한
										법률 / 보존 기관 : 5년</li>
									<li>3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년</li>
									<li>4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한
										법률 보존기간 / 3년</li>
									<li>5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한
										법률 보존기간 / 3년</li>
									<li>6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시
										제2016-3호)(전자세금계산서 사용자에 한함) : 5년</li>
									<li>(단, (세금)계산서 내 개인 식별번호는 3년 경과 후 파기)</li>
								</ol>
							</div>
							<div class="unregister_modal_notice">
								<span class="unregister_modal_notice-title">유의사항</span>
								<div class="unregister_modal_notice_content">
									<ol>
										<li>- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행 시 해당 아이디는
											영구적으로 삭제됩니다.</li>
										<li>- 회원님의 모든 콘텐츠와 활동 기록, 포인트 충전·적립·사용 내역이 삭제됩니다.</li>
										<li>- 결제 취소 신청 후 완료되기 전 계정을 삭제하는 경우 구매 기록을 확일할 수 없으므로 결제
											취소가 불가능합니다.</li>
									</ol>
								</div>
							</div>
							<div class="unregister_modal_agree">
								<label for="unregister_agree"> <input type="checkbox"
									id="unregister_agree" onclick="unregisterCheck()" /> 해당 내용을 모두
									확인했으며, 회원탈퇴에 동의합니다.
								</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" id="unregister_btn" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#unregisterCheckModal">
							회원탈퇴</button>
					</div>
				</div>
				
				<div><a href="/mypage/address">배송지 관리</a></div>
				<div><a href="/mypage/tracking?p=1">배송 조회</a></div>
				
			</div>
		</div>
		<div class="modal fade" id="unregisterCheckModal" aria-hidden="true"
			aria-labelledby="unregisterCheckModalLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="unregisterCheckModal">비밀번호
							재확인</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body unregitserCheck_modal_body">
						<div class="unregitserCheck_modal_input">
							<div>
								<label for="unregister_id">아이디</label> <input type="text"
									id="unregister_id" name="unregister_id"
									value="<%=user.getUser_id()%>" readonly />
							</div>
							<div>
								<label for="unregister_password">비밀번호</label> <input
									type="password" id="unregister_password"
									name="unregister_password" />
							</div>
							<span>본인확인 후 최종 회원탈퇴가 가능합니다.</span> <span>본인확인을 위해 비밀번호를
								다시 한번 확인합니다.</span>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary"
							data-bs-target="#unregisterModal" data-bs-toggle="modal">
							취소</button>
						<button class="btn btn-secondary" onclick="deleteUser()">
							확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="/views/inc/footer.jsp" />

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
		
	<script>
		function unregisterCheck() {

		}
		function deleteUser() {
			const id = $('#unregister_id').val();
			const password = $('#unregister_password').val();

			// 패스워드 맞는지 확인
			$.ajax({
				url : "/mypage/deleteUser",
				type : "POST",
				data : {
					id : id,
					password : password
				},
				success : function(data) {
					console.log(data);
					if (data === "error") {
						alert('비밀번호를 입력해주세요');
					} else if (data === "password_error") {
						alert('회원 비밀번호가 일치하지 않습니다.');
					} else {
						$('#unregisterCheckModal').modal('hide');
						document.location.replace(data);
					}
				},
				error : function() {
					alert("서버 에러.");
				}
			});

		}
	</script>
</body>
</html>