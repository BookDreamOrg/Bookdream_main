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
<link rel="stylesheet" type="text/css" href="/resources/css/purchase.css">


</head>

<body>

	<header>

	</header>
	
	<div class="container">
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  Modal  !!!!!!!!!!!!!!!!!!!!! -->		
	
	<div class="modal hidden" id="modal">
		<div class="modal_overlay" id="modal_overlay"></div>
		<div class="modal_content" id="modal_content">
			<span class="modal_title">배송지 변경</span>
			<span class="modal_close" id="modal_close">x</span>
			<hr>
			<div>
				<div class="modal_address_insert">
					<button class="modal2_open" id="modal2_open">배송지 입력하기</button>
				</div>
				
				<div class="moadl_address_list" id="moadl_address_list">
					<div id="root"></div>
				</div>
				
				<div><label><input type="checkbox" id="default_address_check">기본 배송지로 설정</label></div>
				<div><button class="modal_reg_check" id="modal_reg_check">저장</button></div>
			</div>
		</div>
	</div>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  주소입력창  !!!!!!!!!!!!!!!!!!!!! -->
	
	<div class="modal2 hidden" id="modal2">
		<div class="modal2_content">
			<span class="modal_title">주소 입력</span>
			<span class="modal2_close" id="modal2_close">x</span>		
			
			<hr>
			
			<div>배송지 이름</div>
			
			<input type="text" id="moadl2_address_alias" name="moadl2_address_alias" placeholder="배송지 이름을 입력해주세요.">			
			
			<div>받는 사람</div>
			
			<div><input type="text" id="moadl2_address_name" name="moadl2_address_name" placeholder="이름을 입력해주세요."></div>
			<div><input type="text" id="moadl2_address_tel" name="moadl2_address_tel" placeholder="휴대번호를 -없이 입력해주세요."></div>
			
			<div><button onclick="execDaumPostcode()">주소찾기</button></div>
				
			<div class="modal2_address" id="modal2_address">
				<div><input type="text" id="zonecode" name="moadl2_address_zonecode" placeholder="우편번호" readonly="readonly"></div>	
				<div><input type="text" id="roadAddr" name="moadl2_address_roadAddr" placeholder="도로명주소"readonly="readonly"></div>						
				<span  id="guide" style="color: #999; display: none"></span>
				<input type="text" id="detailAddress" name="moadl2_address_detailAddress" placeholder="상세주소">
				<input type="hidden" id="extraAddress" placeholder="참고항목" readonly="readonly">			
				<input type="hidden" id="modal2_address_no" name="modal2_address_no">			
			</div>
		
	
			<div>
				<button id="modal2_address_insert">저장</button>
				<button id="modal2_address_update">수정</button>
			</div>					
		</div>
	</div>
	
	
	
	
	<div class="main">
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  상단바  !!!!!!!!!!!!!!!!!!!!! -->	
	
		<div class="topbar">
			<span class="topbar_title">주문&nbsp;/&nbsp;결제</span>
			
		</div>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  상품목록  !!!!!!!!!!!!!!!!!!!!! -->	
			
		<div class="cart_list">
			<div class="title">
				<span>주문상품</span>
				
				<!-- 상품의 총 개수  -->
				<span class="cart_list_count">
					총<c:out value="${orderitemCount[0].total_count }"/>개	
				</span>
			
			</div>
			
			<hr>				
			
			<div>

				<form action="">
					<table>
						<c:forEach items="${orderitemList}" var="orderitem" varStatus="i">					
							<tr>
								<td class="col1"><img alt="" src="${orderitem.bookVO.book_img }"> </td>					
								<td class="col2">${ orderitem.bookVO.title }</td>
								<td class="col3"><b><fmt:formatNumber value="${orderitem.bookVO.book_price}" pattern="###,###"/></b> 원</td>
								<td class="col4">${ orderitem.product_count }개</td>
								<c:set var="total_price" value="${total_price + (orderitem.bookVO.book_price * orderitem.product_count) }"/>							
							</tr>																										
						</c:forEach>
					</table>
				</form>
				

						
			</div>	
		</div>
		
	<!-- !!!!!!!!!!!!!!!!!!!!!  사이드바 - 결제  !!!!!!!!!!!!!!!!!!!!! -->	
	
		<div class="sidebar">
			<div class="sidebar_col">
				<span class="">상품금액</span>
				<span class="sidebar_col_price"><b><fmt:formatNumber value="${total_price}" pattern="###,###"/></b> 원</span>
			</div>
			
			<div class="sidebar_col">
				<span>배송비</span>
				<c:set var="delivery" value="3000" />
				<c:choose>
					<c:when test="${total_price ge 30000 }">
						<c:set var="delivery" value="0" />					
						<span class="sidebar_col_price"><b>0</b> 원</span>						
					</c:when>
					<c:otherwise>
						<span class="sidebar_col_price"><b><fmt:formatNumber value="${delivery}" pattern="###,###"/></b> 원</span>				
					</c:otherwise>
				</c:choose>	
			</div>
				
			<div class="sidebar_col">
				<span>쿠폰할인</span>
				<span class="sidebar_col_price"><b>0</b> 원</span>
			</div>
			
			<hr>
			
			<div class="sidebar_col_last"> 
				<span class="sidebar_col_title">최종결제금액</span>
				<span class="sidebar_col_price final_price"><b><fmt:formatNumber value="${total_price + delivery}" pattern="###,###"/></b> 원	</span>			
			</div>
			
		
			<div class="payment">
				<button class="pay_button" id="pay_button">결제하기</button>
			</div>
		</div>		
		
		<!--  !!!!!!!!!!!!!!!!!!!!! 배송지 정보 !!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		
		<div class="user_info"> 
			<div class="title">배송지 정보	</div>
			
			<div class="user_info_address" id="user_info_address">
			
				<c:choose>
				
					<c:when test="${empty addressList }">
						<button class="user_info_button insert" id="modal_open">
						<span>배송지 입력하기</span>
						</button>			
					</c:when>

					<c:otherwise>
					
					<div>
						<div id="user_info_alias">${addressList[0].address_alias }</div>
						<span id="user_info_tel">${addressList[0].address_tel }&nbsp;/&nbsp;</span>
						<span id="user_info_name">${addressList[0].address_name }</span>
						<br>	
						<span id="user_info_zone_code">[${addressList[0].zone_code }]</span>
						<span id="user_info_road_add">${addressList[0].road_add }</span>
						<span id="user_info_detail_add">${addressList[0].detail_add }</span>
						<span><button id="modal_open">변경</button></span>	
					</div>									
					
					</c:otherwise>
					
				</c:choose>

			</div>				
		
			
			
			<hr>			
			
			<div class="title">배송요청사항
				<button class="user_info_button"><span>요청사항 메시지</span></button>				
			</div>
	
		</div>
		
		<!-- !!!!!!!!!!!!!!!!!!!!! 쿠폰  !!!!!!!!!!!!!!!!!!!!! -->	
		
		<div class="event"> 
			<div class="title">할인쿠폰</div>
			<hr>			
		</div>
		
		<!-- !!!!!!!!!!!!!!!!!!!!! 결제수단  !!!!!!!!!!!!!!!!!!!!! -->	
		
		<div class="pay">
			<div class="title">결제수단</div>
			<hr>


				<div class="pay_select">
					<div>
						<label for="pay_hide"><input type="radio" id="pay_hide" name="pay_select" onclick="pay_hide();" checked="checked"><span>&nbsp;드림페이 결제</span></label>
					</div>
					
					<br>
					
					<div>
						<label for="pay_show"><input type="radio" id="pay_show" name="pay_select" onclick="pay_show();"><span>&nbsp;다른 결제 수단</span></label>
					</div>
				</div>
			
			<div class="pay_labels" id="pay_labels">
				<label for="pay_radio1"><input type="radio" id="pay_radio1" name="pay_radio" value="CARD"><span class="pay_lable">신용카드</span></label>
				<label for="pay_radio2"><input type="radio" id="pay_radio2" name="pay_radio" value="TOSSPAY"><span class="pay_lable">토스페이</span></label>
				<label for="pay_radio3"><input type="radio" id="pay_radio3" name="pay_radio" value="VIRTUAL_ACCOUNT"><span class="pay_lable">가상계좌</span></label>
				<label for="pay_radio4"><input type="radio" id="pay_radio4" name="pay_radio" value="TRANSFER"><span class="pay_lable">계좌이체</span></label>
				<label for="pay_radio5"><input type="radio" id="pay_radio5" name="pay_radio" value="MOBILE_PHONE"><span class="pay_lable">휴대폰</span></label>
				<label for="pay_radio6"><input type="radio" id="pay_radio6" name="pay_radio" value="CULTURE_GIFT_CERTIFICATE"><span class="pay_lable">문화상품권</span></label>
				<label for="pay_radio7"><input type="radio" id="pay_radio7" name="pay_radio" value="BOOK_GIFT_CERTIFICATE"><span class="pay_lable">도서문화상품권</span></label>
				<label for="pay_radio8"><input type="radio" id="pay_radio8" name="pay_radio" value="GAME_GIFT_CERTIFICATE"><span class="pay_lable">게임문화상품권</span></label>		
			</div>
		</div>
	</div>
	</div>

	
	<!-- JS 전송 -->	

	<!-- 상품의 종류가 2개 이상일 경우 첫번째 상품이름 + 나머지 종류의 개수  -->
	<c:choose>
		<c:when test="${fn:length(orderitemList) != 1}">
			<c:set var="first_title" value="${orderitemList[0].bookVO.title} 외  ${orderitemCount[0].total_count - 1} 종"></c:set>
		</c:when>		
		<c:otherwise >
			<c:set var="first_title" value="${orderitemList[0].bookVO.title}"></c:set>
		</c:otherwise>
	</c:choose>	

	<input type="hidden" id ="first_title" name="first_title" value="<c:out value="${first_title}"/>">
	
	<footer></footer>
	
<script type="text/javascript" src="/resources/js/purchase.js"></script>



</body>

</html>