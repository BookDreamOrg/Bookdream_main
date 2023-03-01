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

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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

<!-- Script Bootstrap, jqurey-3.6.3 -->
<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!-- 스크롤 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	line-height: 14px;
	font-size: 14px;
}

.point_history {
	width: 120px;
	height: 100%;
	font-size: 10px;
	margin-left: 10px;
}

/*                                     */
.mypage_sub{
	display: flex;
	justify-content: space-between;
}

.mypage_sub_title {
    height: 50px;
    line-height: 70px;
	margin-top: 30px;    
    font-size: 14px;
    font-weight: bold;
}

.mypage_sub_title_right {
    height: 50px;
    line-height: 70px;
	margin-top: 30px;    
    font-size: 14px;
    font-weight: bold;
}

/*                         */
.mypage_recent_pur_table {
	border-left: 5px solid white;
	width: 100%;
}

.mypage_recent_pur_table td:nth-child(1) img {
	width: 80px;
	height: 100px;
	vertical-align: middle;	
	border: 1px solid black;
}

.mypage_recent_pur_table tr {
	height: 120px;	
	text-align: center;	
	vertical-align: middle;
	font-size: 14px;
}

.mypage_recent_pur_table td:nth-child(1),
.mypage_recent_pur_table td:nth-child(3) {
	width: 15%;
	font-weight: bold;
}

.mypage_recent_pur_table td:nth-child(2) {
	width: 70%;
	padding: 0px 40px;
	text-align: left;

}
.mypage_recent_pur_table tr:hover {
	border-left: 5px solid #5c5d99;
	background-color: #e0e0ee;	
	cursor: pointer;
}



/*                   */

.mypage_recent_qna_table {
	width: 100%;
	border-left: 5px solid white;	
}

.mypage_recent_qna_table tr {
	height: 80px;
	vertical-align: middle;
	font-size: 14px;
}

.mypage_recent_qna_table td:nth-child(1), 
.mypage_recent_qna_table td:nth-child(3) {
	width: 15%;
	text-align: center;	
	font-size: 12px;
}

.mypage_recent_qna_table td:nth-child(2) {
	width: 70%;
	padding: 0px 40px;
	text-align: left;
	 
}

.mypage_recent_qna_table td:nth-child(3) {
	font-weight: bold;
}

.mypage_recent_qna_table tr:hover {
	border-left: 5px solid #5c5d99;
	background-color: #e0e0ee;	
}

.mypage_info_content_title {
	font-size: 12px;
	color: #5c5d99;
	font-weight: bold;
}

/* Modal */
.point_history_modal {
	height: 700px;
	padding: 0px 30px;
}

.point_history_table_container {
	margin-top: 20px;
	border-bottom: 1px dotted #DFDFDF;
}

.point_history_table {
	width: 100%;	
}

.point_history_table th,td {
	width: 20%;
	font-size: 14px;
	text-align: center;
	vertical-align: middle;

}

.point_history_table th {
	height: 50px;
	font-weight: bold;
	position: sticky; 
	top: 0; 
	z-index: 2px;		
	background-color: #efefef;
}

.point_history_table td {
	height: 70px;
	font-size: 12px;
}

.point_history_table tr:nth-child(odd) {
	background-color: #fafafa;
}


.cancelDecoreation {
  text-decoration: line-through;
  text-decoration-color: #FF6384;
}


.cancelColor {
	color: #FF6384;	
	font-weight: bold;
}

/* */
.point_dshbr_table {
	width: 100%; 
	height: 15%; 
	margin-top: 50px;	
}

.point_dshbr_table tr {
	text-align: left;

}

.point_dshbr_table th {
	font-size: 12px;
	font-weight: bold;
	padding-left: 60px;
	height: 30%;
}

.point_dshbr_table td {
	font-size: 24px;
	vertical-align: top;

}
.point_dshbr_table td:nth-child(1), 	
.point_dshbr_table td:nth-child(3), 	
.point_dshbr_table td:nth-child(5) {	
	padding-left: 60px;
	text-align: left;
}

.point_dshbr_table td:nth-child(5) {
	font-weight:bold;
	color: #5c5d99
}

.point_dshbr_table td:nth-child(2),
.point_dshbr_table td:nth-child(4) {

	width: 5%;
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
							<div>${authUser.getUser_name()}님 | ${authUser.getFlatform_type()} 회원
									<button type="button" class="btn btn-outline-success point_history" id="point_history">
										<i class="fas fa-money-check"></i> 포인트 사용 현황
									</button>								
							</div>						
							<ul>
								<li class="mypage_info_content_title">이메일</li>							
								<li class="mypage_info_content_text"> ${authUser.getUser_email()}</li><br>
								<li class="mypage_info_content_title">전화번호</li>
								<li class="mypage_info_content_text">${authUser.getUser_tel()}</li>
							</ul>	
							<ul class="mypage_info_content_ul2">
								<li class="mypage_info_content_title">포인트
								
								</li>
								<li class="mypage_info_content_text">${userPoint}P

								</li>
								
								<br>							
								
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
						<div>
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
						</div>						
						</c:otherwise>
						
					</c:choose>
						
				</div>							


				
				</div>	
						

							
			</div>	
				
		</div>

		<!-- Modal -->
		<div class="modal fade" id="point_history_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
		    <div class="modal-content point_history_modal">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">포인트 사용현황</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="point_history_body">
		        
		        <c:set var="totalPoint" value="10000"/>
  				
  				<div style="height:70%; overflow-y: auto;" class="point_history_table_container" id="point_history_table_container">	 
  				       
		        <table class="point_history_table scrollbar">
			        <tr>
			       		<th></th>
			       		<th>적립 포인트</th>
			       		<th>사용 포인트</th>
			       		<th>구매확정 포인트</th>
			       		<th>합계</th>
			       	</tr>		
			       	
			        <tr>
			       		<td>회원가입</td>
			       		<td>${totalPoint}</td>
			       		<td></td>
			       		<td></td>
			       		<td>${totalPoint}</td>
			       	</tr>				       	        		        
			        <c:forEach items="${userPointHistory}" var="point" varStatus="i">
			        	
				        <c:set var="totalPoint"   value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? totalPoint : (totalPoint + point.SAVE_POINT + point.PRCHSCNFRM_POINT) - point.USE_POINT}"></c:set>        	
						<c:set var="sumUsePoint"  value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? sumUsePoint : sumUsePoint + point.USE_POINT}"/>
					
						<c:set var="sumSavePoint" value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? sumSavePoint : sumSavePoint + point.SAVE_POINT}"/>
						<c:set var="sumPrchscnfrmPoint" value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? sumPrchscnfrmPoint : sumPrchscnfrmPoint + point.PRCHSCNFRM_POINT}"/>
						
						<c:set var="cancelDecoreation" value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? 'cancelDecoreation' : ''}"/>
						<c:set var="cancelText" value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? '취소' : ''}"/>
						<c:set var="cancelColor" value="${point.ORDER_STATUS == 11 || point.ORDER_STATUS == 13 ? 'cancelColor' : ''}"/>
			
			        	<tr class="">
			        		<td class="${cancelDecoreation}"><fmt:formatDate value="${point.PAY_DATE}" pattern="YY년 MM월 dd일 (E)" /></td>
			        		<td class="${cancelDecoreation}">${point.SAVE_POINT}</td>
			        		<td class="${cancelDecoreation}">${point.USE_POINT}</td>
			        		<td class="${cancelColor}">${point.PRCHSCNFRM_POINT}${cancelText}</td>
			        		<td class="${cancelDecoreation}">${totalPoint}</td>
			        	</tr>		  
			        	      
			        </c:forEach>
		        
		        </table>
		        		        
		  		</div>
		  		
		  		<table class="point_dshbr_table">
		        	<tr>
		        		<th colspan="2">적립포인트</th>
		        		<th colspan="2">사용포인트</th>
		        		<th>총 포인트</th>
		        	</tr>
		        	
		        	<tr>
		        		<td>${sumSavePoint + 10000 + sumPrchscnfrmPoint}</td>
		        		<td>-</td>
		        		<td>${sumUsePoint }</td>
		        		<td>=</td>
		        		<td>${totalPoint}</td>
		        	</tr>
		        </table>
		        	        
		      </div>

		    </div>
		  </div>
		</div>		

	<jsp:include page="/views/inc/footer.jsp" />
	</div>

	<!-- 공통 function -->
	<script type="text/javascript" src="/resources/js/commonFunction.js"></script>
		
	<script>
		let user_no = <%=(int) session.getAttribute("user_no")%>
		<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	
	<script type="text/javascript">
	
	// 최근 상품 누르면 배송조회로 이동
	$(document).on("click", "table.mypage_recent_pur_table", function(e) {
	
		location.href="/mypage/tracking"
	})
	
	// 포인트사용현황 버튼 클릭
	$(document).on("click", "#point_history", function(e) {

		let modal = ById('point_history_table_container')
		
		modal.scrollTop = 0		
		
		$('#point_history_modal').modal('show')

		userPointHistory() 
	})
	
	$(document).on("click", ".btn-close", function(e) {

		let modal = ById('point_history_table_container')
		
		modal.scrollTop = 0		
	})
	
	// 포인트사용현황 function
	function userPointHistory() {
		
		$.ajax ({
		
			type : "POST",                              
			url : "/mypage/userPointHistory",	
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {
										
				console.log(data)
			},
				
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
			        
			}	
						
		})
		
	}
		
	// 스크롤
    const scrollbar = document.querySelector('.scrollbar');
    scrollbar.classList.add('animate__animated', 'animate__fadeInUp');
		
	</script>

	
	
</body>
</html>