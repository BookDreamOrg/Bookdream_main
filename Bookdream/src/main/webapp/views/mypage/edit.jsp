<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/resources/css/unregister.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/edit.css" />

<title>마이페이지 - 회원정보 수정</title>
</head>
<body>
	<%
		UserVO user = (UserVO) session.getAttribute("authUser");
	%>
	<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />
	<div class="container">
		<div class="main">
		
			<jsp:include page="/views/inc/mypage_side.jsp" />
			
			<div class="rside">
				<div class="user_info_title">
					회원정보 수정
				</div>
				<hr>
				<div class="user_info_table">
					<table class="table table-board">
						<tr>
							<td>아이디</td>
							<td><input type="text" disabled class="form-control"
								id="user_id" name="user_id" value="${authUser.getUser_id() }"></td>
						</tr>
						<c:choose>
						 <c:when test="${authUser.getUser_id() eq null }">
						 	<tr>
							<td>새 비밀번호</td>
							<td><input type="password" disabled class="form-control"
								id="user_password" name="user_password"
								onchange="PasswordCheck()"></td>
							</tr>
							<tr>
								<td>새 비밀번호 확인</td>
								<td><input type="password" disabled class="form-control"
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
							<td><input type="input"  disabled class="form-control" id="user_name"
								name="user_name" value="<%=user.getUser_name()%>"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="input" disabled class="form-control" id="user_email"
								name="user_email" value="<%=user.getUser_email()%>"></td>
						</tr>
					</table>

					<div class="d-grid gap-2">
						<div style="text-align: center">소셜 로그인 회원은 회원정보를 수정할 수 없습니다!</div>
					</div>
						 </c:when>
						 <c:otherwise>
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
						<button type="button" class="btn btn-outline-primary edit-btn" id="modal_reg_check"
							onclick="updateUser()">저장</button>
					</div>
						 </c:otherwise>
						</c:choose>
						
					</table>

					
			<!--------------------------- 회원탈퇴 --------------------------->		
			<!-- Button trigger modal -->
			<div class="user_delete_info_list">
				<span class="user_delete_title">회원탈퇴 후 동일 아이디로 재가입이 불가합니다. </span>
				<button type="button" class="btn btn-outline-primary edit-btn" id="deleteUserBtn" data-bs-toggle="modal"
				data-bs-target="#unregisterModal">회원탈퇴</button>
			</div>

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
										<li>1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호엥 관한
											법률 / 보존 기관 : 5년</li>
										<li>2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에
											관한 법률 / 보존 기관 : 5년</li>
										<li>3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년</li>
										<li>4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에
											관한 법률 보존기간 / 3년</li>
										<li>5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에
											관한 법률 보존기간 / 3년</li>
										<li>6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시
											제2016-3호)(전자세금계산서 사용자에 한함) : 5년</li>
										<li>(단, (세금)계산서 내 개인 식별번호는 3년 경과 후 파기)</li>
									</ol>
								</div>
								<div class="unregister_modal_notice">
									<span class="unregister_modal_notice-title">유의사항</span>
									<div class="unregister_modal_notice_content">
										<ol>
											<li>- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행 시 해당
												아이디는 영구적으로 삭제됩니다.</li>
											<li>- 회원님의 모든 콘텐츠와 활동 기록, 포인트 충전·적립·사용 내역이 삭제됩니다.</li>
											<li>- 결제 취소 신청 후 완료되기 전 계정을 삭제하는 경우 구매 기록을 확일할 수 없으므로 결제
												취소가 불가능합니다.</li>
										</ol>
									</div>
								</div>
								<div class="unregister_modal_agree">
									<label for="unregister_agree"> <input type="checkbox"
										id="unregister_agree" onclick="unregisterCheck()" /> 해당 내용을
										모두 확인했으며, 회원탈퇴에 동의합니다.
									</label>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" id="unregister_btn" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#unregisterCheckModal" disabled>
								회원탈퇴</button>
						</div>
					</div>
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
							<button class="btn btn-primary" onclick="deleteUser()">
								확인</button>
						</div>
					</div>
				</div>
			</div>
			
				</div>
			</div>

		</div>
	</div>
		<script src="/resources/js/edit.js"></script>
	
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