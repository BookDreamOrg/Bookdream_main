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


<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">
<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>마이페이지 - 메인</title>

<style>


.wrapper {
	height: auto;
}

hr {
	padding: 0px 40px;
}

.main {
	line-height: 180%;
	position: relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;

	min-height: 1000px;
}

.mypage {
	height: auto;
	min-height: 1200px;
	padding: 0px 40px;	
	float: right;
}

.test {
	width: 100px;
	height: 100px;
}

.mypage_info {
	position: relative;
	width: 870px;
	height: auto;
	min-height: 300px;
}

.mypage_info_title {
    padding: 30px 0px;
    vertical-align: middle;
    height: 100px;
	margin-top: 30px;    
    font-size: 20px;
    font-weight: bold;
}


.mypage_info_box {
	height:auto;
	min-height: 300px;
	border-radius: 20px;
	padding: 40px 40px 40px 40px;
	background-color: #f7f7f7;	
	
}

.mypage_info_profile {
	position: relative;
	width: 150px;
	height:150px;
	border-radius: 50%;
	background-color: white;
	float: left;
	margin: 35px 40px 0px 0px;
}

.mypage_info_icon {
	margin: 35px 0px 0px 40px;
	color: #e0e0ee;
}

.mypage_info_profile_set {
	position: absolute;
	top: 120px;
	left: 120px;
	color: #525388;
}

.mypage_info_content div {
	margin-bottom: 20px;
}

.mypage_info_content ul {
	float: left;
}

.mypage_info_content_ul2 {
	 margin-left: 100px;
}

.mypage_info_content_text {
	font-size: 14px;
}

/*                                     */
.mypage_sub_title {
    height: 50px;
    line-height: 70px;
	margin-top: 30px;    
    font-size: 14px;
    font-weight: bold;
}

.mypage_recent_pur {

}

.mypage_recent_pur_table td:nth-child(1) img {
	width: 80px;
	height: 100px;
	vertical-align: middle;	
	border: 1px solid black;
}

.mypage_recent_pur_table td:nth-child(1),
.mypage_recent_pur_table td:nth-child(2),
.mypage_recent_pur_table td:nth-child(3) {
	height: 120px;	
	text-align: center;	
	vertical-align: middle;
	
	font-size: 14px;
}

.mypage_recent_pur_table td:nth-child(1),
.mypage_recent_pur_table td:nth-child(3) {
	width: 100px;
	font-weight: bold;
}

.mypage_recent_pur_table td:nth-child(2) {
	width: 670px;
	padding: 0px 40px;
	text-align: left;

}

.mypage_recent_qna_table td:nth-child(1), 
.mypage_recent_qna_table td:nth-child(2),
.mypage_recent_qna_table td:nth-child(3) {
	width: 100px;
	height: 80px;
	vertical-align: middle;
	text-align: center;
	
	font-size: 14px;
}

.mypage_recent_qna_table td:nth-child(1) {
	font-size: 12px;
}

.mypage_recent_qna_table td:nth-child(2) {
	width: 670px;
	padding: 0px 40px;
	text-align: left;
	 
}

.mypage_recent_qna_table td:nth-child(3) {
	font-weight: bold;
}

.mypage_recent_qna_table tr:hover {
	background-color: #e0e0ee;	
}



.mypage_info_content_title {
	font-size: 12px;
	color: #5c5d99;
	font-weight: bold;
}

</style>


</head>
<body>

	<%
		UserVO user = (UserVO) session.getAttribute("authUser");
	%>
	
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
								<li class="mypage_info_content_text">${authUser.getUser_point()}P</li><br>							
								<li class="mypage_info_content_title">배송지</li>
								<li class="mypage_info_content_text">[${address.zone_code}] ${address.road_add} ${address.detail_add}</li>						
							</ul>
						</div>	
					</div>
				</div>


				<!-- 배송상태 -->
				<c:choose>
					<c:when test="${order.order_status == 0}">
						<c:set var="status" value="결제완료"></c:set>
					</c:when>
					<c:when test="${order.order_status == 1}">
						<c:set var="status" value="배송중"></c:set>
					</c:when>					
					<c:when test="${order.order_status == 2}">
						<c:set var="status" value="배송완료"></c:set>
					</c:when>
					<c:when test="${order.order_status == 3}">
						<c:set var="status" value="구매확정"></c:set>
					</c:when>
					<c:when test="${order.order_status == 10}">
						<c:set var="status" value="결제취소중"></c:set>
					</c:when>
					<c:when test="${order.order_status == 11}">
						<c:set var="status" value="결제취소"></c:set>
					</c:when>					
					<c:when test="${order.order_status == 12}">
						<c:set var="status" value="반품요청중"></c:set>
					</c:when>
					<c:when test="${order.order_status == 13}">
						<c:set var="status" value="반품완료"></c:set>
					</c:when>																					
				</c:choose>


				<div class="mypage_sub_title">최근주문</div>					
				
				<div class="mypage_recent_pur">
				<hr>
					<table class="mypage_recent_pur_table">
						<tr>
							<td><img class="mypage_recent_pur_img" alt="" src="${order.bookVO.book_img}"></td>
							<td>${order.order_name }</td>
							<td>${status}</td>
						</tr>
					</table>
	
				</div>

				<div class="mypage_sub_title">문의현황</div>

				<div class="mypage_recent_qna">
				<hr>

					<table class="mypage_recent_qna_table">					
						<c:forEach items="${qna}" var="qna">
							
							<!-- 문의상태 -->							
							<c:set var="status" value="${qna.ans_check == 0 ? '문의접수' : '문의완료' }"></c:set>
										
							<tr>
								<td>
									<fmt:formatDate value="${qna.reg_date}" pattern="yy.MM.dd" /><br>
									<fmt:formatDate value="${qna.reg_date}" pattern="HH:mm" />
								</td>
								<td>${qna.qna_title}</td>
								<td>${status}</td>
							</tr>
						</c:forEach>
						
							
					</table>						
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

	
	
	
</body>
</html>