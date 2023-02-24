<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="/image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="/image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />


<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">
<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>마이페이지 - 메인</title>

<style>


.wrapper {
	height: auto;
}

</style>


</head>
<body>


	<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />

		
		<div class="main">
		
		<jsp:include page="/views/inc/mypage_side.jsp" />		

			<div class="mypage">
				
				<div class="mypage_info">
					<div class="mypage_info_title">마이페이지</div>

						
					
					<div class="mypage_info_box">
					<div class="mypage_info_profile"><i class="fa-solid fa-user fa-5x mypage_info_icon" ></i><i class="bi bi-gear-fill mypage_info_profile_set"></i></div>
						<div class="mypage_info_content">
							<div>${authUser.getUser_name()}님 | ${authUser.getFlatform_type()} 회원</div>						
							<ul>
								<li class="mypage_info_content_title">이메일</li>							
								<li class="mypage_info_content_text"> ${authUser.getUser_email()}</li><br>
								<li class="mypage_info_content_title">전화번호</li>
								<li class="mypage_info_content_text">${authUser.getUser_tel()}</li>
							</ul>	
							<ul class="mypage_info_content_ul2">
								<li class="mypage_info_content_title">포인트</li>
								<li class="mypage_info_content_text">${userPoint}P</li><br>							
								<li class="mypage_info_content_title">배송지</li>
								<c:choose>
									<c:when test="${address.zone_code eq null}">
										<li class="mypage_info_content_text">등록된 주소지가 없습니다.</li> 
									</c:when>
									
									<c:otherwise>
										<li class="mypage_info_content_text">${address.zone_code} ${address.road_add} ${address.detail_add}</li>						
									</c:otherwise>
								</c:choose>
							</ul>
						</div>	
					</div>
				</div>


				<!-- 배송상태 -->
				<c:choose>
					<c:when test="${order.ORDER_STATUS == 0}">
						<c:set var="status" value="결제완료"></c:set>
					</c:when>
					<c:when test="${order.ORDER_STATUS == 1}">
						<c:set var="status" value="배송중"></c:set>
					</c:when>					
					<c:when test="${order.ORDER_STATUS == 2}">
						<c:set var="status" value="배송완료"></c:set>
					</c:when>
					<c:when test="${order.ORDER_STATUS == 3}">
						<c:set var="status" value="구매확정"></c:set>
					</c:when>
					<c:when test="${order.ORDER_STATUS == 10}">
						<c:set var="status" value="결제취소중"></c:set>
					</c:when>
					<c:when test="${order.ORDER_STATUS == 11}">
						<c:set var="status" value="결제취소"></c:set>
					</c:when>					
					<c:when test="${order.ORDER_STATUS == 12}">
						<c:set var="status" value="반품요청중"></c:set>
					</c:when>
					<c:when test="${order.ORDER_STATUS == 13}">
						<c:set var="status" value="반품완료"></c:set>
					</c:when>																					
				</c:choose>

				<div class="mypage_sub_title">최근주문
					<span style="font-size: 12px; font-weight: normal; margin-left: 10px;">
						<fmt:formatDate value="${order.ORDER_DATE}" pattern="MM월 dd일 (E)" />
					</span>
				</div>					
				
				<div class="mypage_recent_pur">
				<hr>
					<table class="mypage_recent_pur_table">
					
					<c:choose>
						<c:when test="${order eq null}">
							<div style="text-align: center; margin: 30px 0px;">주문내역이 없습니다.</div>
						</c:when>
					
						<c:otherwise>
							<tr>
								<td><img class="mypage_recent_pur_img" alt="" src="${order.BOOK_IMG}"></td>
								<td>${order.ORDER_NAME }</td>
								<td>${status}</td>
							</tr>						
						</c:otherwise>
					</c:choose>

					</table>
	
				</div>
				
				<div class="mypage_sub">
					<div class="mypage_sub_title">문의현황</div>
					<div class="mypage_sub_title_right"> <a href="/mypage/getMyQnAList">+더보기</a></div>
				</div>
				<div class="mypage_recent_qna">
				<hr>
					<c:choose>
						<c:when test="${qna eq '[]'}">
							<div style="text-align: center; margin: 30px 0px;">문의내역이 없습니다.</div>
						</c:when>
						
						<c:otherwise>
							<table class="mypage_recent_qna_table">					
								<c:forEach items="${qna}" var="qna">
									
									<!-- 문의상태 -->							
									<c:set var="status" value="${qna.ANS_CHECK == 0 ? '문의접수' : '문의완료' }"></c:set>
												
									<tr>
										<td>
											<fmt:formatDate value="${qna.REG_DATE}" pattern="yy.MM.dd" /><br>
											<fmt:formatDate value="${qna.REG_DATE}" pattern="HH:mm" />
										</td>
										<td>${qna.QNA_TITLE}</td>
										<td>${status}</td>
									</tr>
								</c:forEach>
							</table>						
						</c:otherwise>
					</c:choose>
						
				</div>							


				
				</div>	
						

							
			</div>	
				
		</div>
		

	<jsp:include page="/views/inc/footer.jsp" />
	</div>

	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

	<script>
		let user_no =
	<%=(int) session.getAttribute("user_no")%>
		;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	
	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
	
	<script type="text/javascript">
	$(document).on("click", "table.mypage_recent_pur_table", function(e) {
	
		console.log("되냐?")
		location.href="/mypage/tracking"
	})
	
	
	
	
	</script>

	
	
</body>
</html>