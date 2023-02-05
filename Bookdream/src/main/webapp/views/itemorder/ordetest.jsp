<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<title>결제/주문 페이지</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Tosspay api -->
<script src="https://js.tosspayments.com/v1/payment"></script>

<!-- Iamport api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- 주소찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">


<style type="text/css">

* {
	box-sizing: border-box;
}

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! main !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
.main {
	position:relative;

	width: 1240px;
	height: auto;
	min-height: 1000px;
	
	margin: 0 auto;
	line-height: 180%;
}

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! orderlist !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

.orderlist {
	width: 850px;
	height: auto;
		
	margin-bottom: 30px;
	padding: 0px 25px;
}

.orderlist_table {
	width: 800px;
	font-size: 12px;

    border: 1px solid #DFDFDF;
}

.orderlist_table_th1 {
	height: 80px;
	vertical-align: middle;
	padding: 0px 30px;
	border: 1px solid #DFDFDF;

	font-size: 16px;	
	font-weight: bold;
}

.orderlist_table_th2 {
	width: 120px;
	height: 50px;
	padding: 0px 30px;
	vertical-align: middle;		
	
	color: #6768ab;
	font-weight: bold;
}

.orderlist_table_th_right {
	float: right;
}

.bi-chevron-down, .bi-chevron-up {
	cursor: pointer;
}

.orderlist_table_tr {
	display: none;
}

.orderlist_table_img {
	width: 80px;
	height: 100px;
	vertical-align: middle;		
	border: 1px solid #DFDFDF;		
}

.orderlist_table_col1  {
	width: 120px;
	height: 150px;
	text-align: center;	
	vertical-align: middle;	
	border-bottom: 1px solid #DFDFDF;
}

.orderlist_table_col2 {
	width: 380px;
	padding: 0px 0px 0px 20px ;
	vertical-align: middle;	
	border-bottom: 1px solid #DFDFDF;		
}

.orderlist_table_col3, .orderlist_table_col4 {
	width: 150px;
	padding: 0px 20px;
	text-align: center;	
	vertical-align: middle;		
	border-bottom: 1px solid #DFDFDF;	
}




/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! address !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

.address {
	width: 850px;
	height:auto;
	padding: 0px 25px;
	margin-bottom: 30px;	
}

.address_table {
	width: 800px;
	height: auto;
	min-height: 300px;
	border: 1px solid #DFDFDF;	
}

.address_table_th1 {
	width: 200px;
	height: 120px;
	vertical-align: middle;
	padding: 0px 30px;

	font-size: 16px;	
	font-weight: bold;
	border: 1px solid #DFDFDF;	
}

.address_table_th2 {
	height: 80px;
	vertical-align: middle;
	padding: 0px 30px;

	font-size: 16px;	
	font-weight: bold;	
	border: 1px solid #DFDFDF;		
}

.address_table_col1 {
	vertical-align: middle;	
	padding: 0px 30px;	
	border: 1px solid #DFDFDF;		
}

.address_table_col2 {
	vertical-align: middle;	
	padding: 0px 30px;	
	border: 1px solid #DFDFDF;		
}

.address_search_btn, .address_insert_btn, .delivery_request_btn  {
	width: 100%;
	
	font-size: 12px;
	font-weight: bold;
}

.address_info_table {
	width: 100%
}

.address_info_table_col2 {
	height:50px;
	text-align:right;
	vertical-align: middle;
}
.modal_footer_left {
	height: 20px;
	line-height: 20px;

	margin-right: 220px;
	font-size:14px;
}

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! address modal !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

.address_list_modal {
	height: 800px;
	padding: 10px 20px;
}

.address_list_table {
	width: 100%;
	margin-top: 20px;
	font-size: 12px;
	border: 1px solid #DFDFDF;
}

.address_list_table_col1 {
	width: 50px;
	height: 130px;
	
	vertical-align: middle;
	text-align: center;	
}

.address_list_table_col2 {
	vertical-align: middle;
}

.address_list_table_col3 {
	width: 50px;
	vertical-align: middle;
	text-align: center;	
}

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! address insert modal !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

.address_insert_modal {
	height: 800px;
	padding: 10px 20px;	
}

.address_input {
	margin: 0px 0px 15px 0px;
	font-size: 14px;
} 

.form-label {
	width:100%;
	margin: 10px 0px 15px 0px;
	font-size: 14px;	
	font-weight: bold;
	line-height: 30px;
}

.address_insert_search_btn {
	width: 100px;
	height: 30px;
	margin-left:20px;
	font-size: 10px;
	font-weight: bold;
	float: right;
}

.address_insert_dummy {
	margin-top: 30px;
}

.address_update_modal_btn, .address_insert_modal_btn {
	display: none;
}


/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 배송요청사항 모달 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
.delivery_request {
	height: 350px;
	padding: 10px 20px;
}

.delrivery_reqeust_insert {
	margin-top: 20px;
}

.address_search_btn_two, .delivery_request_btn_two {
	font-size: 12px;
	font-weight: bold;
	float: right;
}



/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 포인트  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

.point {
	width: 850px;
	height:auto;

	padding: 0px 25px;
	margin-bottom: 30px;	
}

.point_table {
	width: 800px;
	height: auto;
	border: 1px solid #DFDFDF;
}

.point_table_none {
	background-color: #f7f7f7;
	display: none;
}

.point_table_th1, .point_table_th2 {
	width: 200px;
	height: 80px;
	padding: 0px 30px;
	
	border: 1px solid #DFDFDF;
	vertical-align: middle;
	 
}

.point_table_col1 {
	width: 200px;
	padding: 0px 30px;

	text-align: right;		 
	vertical-align: middle;
	
	font-size: 14px;
	border: 1px solid #DFDFDF;	
}

.point_table_col2, .point_table_col3  {
	padding: 0px 30px;
	text-align: right;
	vertical-align: middle;
}

.point_table_col4 {
	padding: 25px 0px;
	
}


.point_table_use_point_input {
	display:inline;
	width: 200px;
	height: 30px;	
	
	text-align: right;
	vertical-align: middle;

}

.point_table_full_use_btn {
	height: 30px;
	font-weight:bold;
	font-size: 12px;
}


/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 결제창  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
.side {
	width: 300px;
	height: 500px;
	
	margin-right: 10px;
	float: right;
	
	border: 1px solid #DFDFDF;
		
}

.side_count {
	float: right;
}

.side_pay {
	padding: 0px 30px;
}

</style>

</head>
<body>

	<jsp:include page="/views/inc/header.jsp" />
	
	<div class="container">

			<!-- dummy box -->
			<div style="height: 100px">
				<!-- dummy -->
			</div>
					
		<!-- -----------------------top_bar-------------------- -->
			<div class="top_bar">
				<h2></h2>
			</div>				
				
			<div class="main">
			
		<!-- ------------------slide box---------------------- -->
		
				 <div class="side">
					<span class="fw-bold text-primary">Total</span> 
					<span class="badge bg-primary rounded-pill side_count">${orderitemCount.total_count}</span>	
					
					<div class="side_pay">
						<ul>
							<li>
								상품 금액
								<span class="side_total_price"><fmt:formatNumber value="${orderitemCount.total_price}" pattern="###,###"/> 원</span>
								<input type="hidden" id="total_price_value" value="${orderitemCount.total_price}">
							</li>
							
	
							<li>
								배송비
								<c:set var="delivery" value="3000" />
								<c:choose>
									<c:when test="${orderitemCount.total_price ge 30000 }">
										<c:set var="delivery" value="0" />					
										<span class="">(+) ${delivery} 원</span>						
									</c:when>
								
									<c:otherwise>
										<span class="">(+)<fmt:formatNumber value="${delivery}" pattern="###,###"/> 원</span>
									</c:otherwise>
								</c:choose>	
								<input type="hidden" id="delivery_value" value="${delivery}">										
							</li>	
							
							<li>
								포인트
								(-) <span id="use_point_value">0</span> 원
							</li>																			
						</ul>
						
						<hr>
						
						<div>최종결제금액</div>
						<c:set var="fanal_price" value="${orderitemCount.total_price + delivery}"/>
						<div id="fanal_price"><fmt:formatNumber value="${fanal_price}" pattern="###,###"/></div> 원
						<input type="hidden" id="fanal_price_value" value="${fanal_price}">
						</div>
				</div>
		<!-- ------------------ orderList ---------------------- -->

				<div class="orderlist">
					<table class="orderlist_table">
					
						<tr>
							<td class="orderlist_table_th1" >주문 상품
									<span class="orderlist_table_th_right"><i class="bi bi-chevron-down" id="orderlist_table_toggle"></i></span>
							</td>
						</tr>
						
						<c:forEach items="${orderitemList}" var="orderitem" varStatus="i">
						
							<tr class="orderlist_table_tr" id="orderlist_table_tr">
								
								<td class="orderlist_table_col1">
									<a href="/getBook?book_no=${orderitem.bookVO.book_no}"><img class="orderlist_table_img" alt="book_img" src="${orderitem.bookVO.book_img }"></a>
								</td>
								
								<td class="orderlist_table_col2">
									${ orderitem.bookVO.title }
								</td>
								
								<td class="orderlist_table_col3">
									<span style="font-weight: bold;">${ orderitem.product_count }</span>개
								</td>
								
								<td class="orderlist_table_col4">
									<span style="font-weight: bold;">
										<fmt:formatNumber value="${orderitem.bookVO.book_price}" pattern="###,###"/>
									</span>원									
								</td>
							</tr>
														
						</c:forEach>
						
						<c:set var="twoDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*2)%>"/>
						
							<tr>
								<th class="orderlist_table_th2"><fmt:formatDate value="${twoDayAfter}" pattern="MM dd(E) "/>도착예정</th>
							</tr>
					</table>
				</div>
				
				<div class="address">	
					<table class="address_table">
						<tr>
							<th class="address_table_th1">배송지 정보</th>
							<td class="address_table_col1" id="address_table_col1"></td>
						</tr>
						
						<tr>
							<th class="address_table_th2">배송요청사항</th>
							<td class="address_table_col2" id="address_table_col2">
								<button class="btn btn-outline-secondary delivery_request_btn" id="delivery_request_btn"><i class="bi bi-chat-dots"></i> 배송요청사항</button>
							</td>

						</tr>
					</table>

				
					<!--   **************************** 배송지 목록 모달 **************************** -->
					<div class="modal fade" id="address_list_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content address_list_modal">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 목록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <div class="modal-body">
					      	<button class="btn btn-outline-secondary address_insert_btn" id="address_insert_btn"><i class="bi bi-plus-lg"> </i> 배송지 추가</button>
					      	
					      	<table class="address_list_table" id="address_list_table">
					      	
					      	</table>
					      
					      </div>
					      
					      <div class="modal-footer">
  							<div class="modal_footer_left">
  								<input class="form-check-input" type="checkbox" id="address_list_default_set">
  								<label class="form-check-label" for="address_list_default_set">기본 배송지로 설정</label>
  							</div>				      		
					        <button type="button" class="btn btn-primary" id="address_list_change_btn">등록</button>
					      </div>
					    </div>
					  </div>
					</div>


					<!--   **************************** 배송지 입력 모달 **************************** -->

					<div class="modal fade" id="address_insert_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content address_insert_modal">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 입력</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <div class="modal-body">
					      
							<div class="mb-3">
				  				<label for="address_insert_alias" class="form-label">배송지 이름</label>
				  				<input class="form-control address_input" id="address_insert_alias" placeholder="배송지 이름을 입력해주세요.">
							</div>		
				
				
							<div class="mb-3">
				  				<label for="address_insert_name" class="form-label">받는 사람</label>
				  				<input class="form-control address_input" id="address_insert_name" placeholder="이름을 입력해주세요.">
				  				<input class="form-control address_input" id="address_insert_tel"  placeholder="휴대번호를 -없이 입력해주세요.">
							</div>				
							
							<div class="address_insert_dummy"></div>
							
							<label class="form-label">주소<button class="btn btn-outline-secondary address_insert_search_btn" onclick="execDaumPostcode()"><i class="bi bi-search"></i>&nbsp;&nbsp;주소찾기</button></label>	

				
							<div class="mb-3">
				  				<input class="form-control address_input" id="zonecode"  placeholder="우편번호" readonly>
				  				<input class="form-control address_input" id="roadAddr"  placeholder="도로명주소" readonly>
				  				<span  id="guide" style="color: #999; display: none"></span>
				  				<input class="form-control address_input" id="detailAddress" placeholder="상세주소" >
								<input type="hidden" id="extraAddress" placeholder="참고항목" readonly="readonly">			
								<input type="hidden" id="address_insert_address_no">	
							</div>					      	
					      	
					      
					      </div>
					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary address_insert_modal_btn" id="address_insert_modal_btn">저장</button>
					        <button type="button" class="btn btn-primary address_update_modal_btn" id="address_update_modal_btn">수정</button>
					      </div>
					    </div>
					  </div>
					</div>

					<!--   **************************** 배송요청사항 모달 **************************** -->
					<div class="modal fade" id="delivery_request" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content delivery_request">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송요청사항</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <div class="modal-body">
							<select class="form-select" id="delrivery_reqeust_select">
			  					<option selected>배송요청사항을 입력해주세요.</option>
								<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
			 					<option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
			 					<option value="부재시 전화 주시거나 문자 남겨 주세요.">부재시 전화 주시거나 문자 남겨 주세요.</option>
			 					<option value="message">요청사항을 직접 입력합니다.</option>
							</select>
							
							<input class="form-control delrivery_reqeust_insert" id="delrivery_reqeust_message" placeholder="요청사항을 직접 입력시 활성화 됩니다." disabled>
							
							
					      </div>
					      
					      <div class="modal-footer">		      		
					        <button type="button" class="btn btn-primary" id="delivery_request_change_btn">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>	
				
				<!-- ------------------ point ---------------------- -->
				<div class="point">
					<table class="point_table">
						<tr>
							<th class="point_table_th1">포인트
							</th>
							
							<td class="point_table_col1">
								보유 <fmt:formatNumber value="${userPoint.userVO.user_point}" pattern="###,###"/> 원
							</td>
							
							<td class="point_table_col2">
								<span class=""><i class="bi bi-chevron-down" id="point_table_toggle"></i></span>							
							</td>
						</tr>
						
						<tr class="point_table_none" id="point_table_none">
							<th class="point_table_th2">통합포인트</th>
							<td class="point_table_col3">
								<fmt:formatNumber value="${userPoint.userVO.user_point}" pattern="###,###"/> 원
								<input type="hidden" id="max_point_value" value="${userPoint.userVO.user_point}" >
							</td>
	
							<td class="point_table_col4">
				  				<input class="form-control point_table_use_point_input" id="point_table_use_point_input" value="0" />														
								<button type="button" class="btn btn-outline-secondary point_table_full_use_btn" id="point_table_full_use_btn" data-bs-toggle="button" aria-pressed="true">전액사용</button>													
							</td>
						</tr>
					</table>
				</div>
	
		
			</div>		


	</div>

	<jsp:include page="/views/inc/footer.jsp" />

	<script type="text/javascript" src="/resources/js/orderitemtest.js"></script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>


</body>
</html>


