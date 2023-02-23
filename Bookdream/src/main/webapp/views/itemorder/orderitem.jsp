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

<!-- 주소찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/orderitem.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>
<body>
	 <div class="wrapper">
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
					<span class="fw-bold">Total</span> 
					<span class="badge bg-primary rounded-pill side_count">${orderitemCount.TOTAL_COUNT}</span>	
					
					<div class="side_pay">
						<ul>
							<li class="side_li">
								<span class="side_title">상품 금액</span>
								<span class="side_total_price"><fmt:formatNumber value="${orderitemCount.TOTAL_PRICE}" pattern="###,###"/> 원</span>
							</li>
							
	
							<li class="side_li">
								<span class="side_title">배송비</span>
								<c:set var="delivery" value="3000" />
								<c:choose>
									<c:when test="${orderitemCount.TOTAL_PRICE ge 30000 }">
										<c:set var="delivery" value="0" />					
										<span class="side_delivery_price">(+) ${delivery} 원</span>						
									</c:when>
								
									<c:otherwise>
										<span class="side_delivery_price">(+)<fmt:formatNumber value="${delivery}" pattern="###,###"/> 원</span>
									</c:otherwise>
								</c:choose>	
							</li>	
							
							<li class="side_li"> 
								<span class="side_title">포인트</span>
								<span class="side_use_point">(-) <span id="use_point_value">0</span> 원</span>
							</li>																			
						</ul>
						
						<hr>
								
					<div class="side_title">결제 금액 예정</div>
						<c:set var="final_price" value="${orderitemCount.TOTAL_PRICE + delivery}"/>
						<div class="side_final_price"><span class="side_final_price_value" id="final_price"><fmt:formatNumber value="${final_price}" pattern="###,###"/></span>원</div> 
						
						<br>
						<div class="side_save_point">적립포인트 : <span id="save_point_value"><fmt:formatNumber value="${final_price * 0.05}" type="number"/></span> 원</div>				

							
					</div>						
						<button type="button" class="btn btn-primary side_pay_now_btn" id="side_pay_now_btn">결제하기</button>
						
						<!-- VALUE  -->
						<input type="hidden" id="total_price_value" value="${orderitemCount.TOTAL_PRICE}">
						<input type="hidden" id="final_price_value" value="${final_price}">
						<input type="hidden" id="delivery_value" value="${delivery}">										
													
				</div>
		<!-- ------------------ orderList ---------------------- -->

				<div class="orderlist">
					<table class="orderlist_table">
					
						<tr>
							<th class="orderlist_table_th1">주문 상품</th>

							<th class="orderlist_table_th2" colspan="3">
								<span class="ordferlist_count">${orderitemCount.TOTAL_COUNT} </span>개
								<span class="orderlist_table_th_right"><i class="bi bi-chevron-down" id="orderlist_table_toggle"></i></span>
							</th>
							
						</tr>
						
					<c:choose>
						<c:when test="${orderitem.BUY_NOW == 'Y'}">
							<tr class="orderlist_table_tr" id="orderlist_table_tr">

								<td class="orderlist_table_col1">
									<a href="/getBook?book_no=${orderitem.BOOK_NO}"><img class="orderlist_table_img" alt="book_img" src="${orderitem.BOOK_IMG }"></a>
								</td>
								
								<td class="orderlist_table_col2">
									${ orderitem.TITLE }
								</td>
								
								<td class="orderlist_table_col3">
									<span style="font-weight: bold;">${ orderitem.PRODUCT_COUNT }</span>개
								</td>
								
								<td class="orderlist_table_col4">
									<span style="font-weight: bold;">
										<fmt:formatNumber value="${orderitem.BOOK_PRICE}" pattern="###,###"/>
									</span>원									
								</td>
							</tr>					
						</c:when>
						
						<c:otherwise>
						<c:forEach items="${orderitemList}" var="orderitem" varStatus="i">					
							<tr class="orderlist_table_tr" id="orderlist_table_tr">
								
								<td class="orderlist_table_col1">
									<a href="/getBook?book_no=${orderitem.BOOK_NO}"><img class="orderlist_table_img" alt="book_img" src="${orderitem.BOOK_IMG }"></a>
								</td>
								
								<td class="orderlist_table_col2">
									${ orderitem.TITLE }
								</td>
								
								<td class="orderlist_table_col3">
									<span style="font-weight: bold;">${orderitem.PRODUCT_COUNT}</span>개
								</td>
								
								<td class="orderlist_table_col4">
									<span style="font-weight: bold;">
										<fmt:formatNumber value="${orderitem.BOOK_PRICE}" pattern="###,###"/>
									</span>원									
								</td>
							</tr>															
						</c:forEach>						
						</c:otherwise>
					</c:choose>	

						<c:set var="twoDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*2)%>"/>
						
							<tr>
								<th class="orderlist_table_th3" colspan="4"><fmt:formatDate value="${twoDayAfter}" pattern="MM월 dd일 (E) "/>도착예정</th>
							</tr>
					</table>
					
					<!-- JS 전송 -->	
					<!-- 상품의 종류가 2개 이상일 경우 첫번째 상품이름 + 나머지 종류의 개수  -->
					<c:choose>
						<c:when test="${orderitem.BUY_NOW == 'Y'}">
							<c:set var="order_name" value="${orderitem.TITLE}"></c:set>
						</c:when>
						<c:otherwise >
							<c:choose>
								<c:when test="${fn:length(orderitemList) != 1}">
									<c:set var="order_name" value="${orderitemList[0].TITLE} 외  ${orderitemCount.COL_COUNT - 1} 종"></c:set>
								</c:when>	
								<c:otherwise>
									<c:set var="order_name" value="${orderitemList[0].TITLE}"></c:set>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>	
					<input type="hidden" id="order_name" value="${order_name}"/>					
					
				</div>
				
				<!--   **************************** 배송지 표시 **************************** -->
				<div class="address">	
					<table class="address_table">
						<tr>
							<th class="address_table_th1">배송지 정보</th>
							<td class="address_table_col1" id="address_table_col1"></td>
						</tr>
						
						<tr>
							<th class="address_table_th2">배송요청사항</th>
							
							<td class="address_table_col2" id="address_table_col2">
								<span id="delivery_request_value"></span>
								<button class="btn btn-outline-secondary delivery_request_btn" id="delivery_request_btn"><i class="bi bi-chat-dots"></i> 배송요청사항</button>
							</td>
							
							<td>
							
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
				  				<input class="form-control address_input" id="address_insert_alias" maxlength="10" placeholder="배송지 이름을 입력해주세요.">
							</div>		
				
				
							<div class="mb-3">
				  				<label for="address_insert_name" class="form-label">받는 사람</label>
				  				<input class="form-control address_input" id="address_insert_name" maxlength="10" placeholder="이름을 입력해주세요.">
				  				<input class="form-control address_input" id="address_insert_tel"  maxlength="11" placeholder="휴대번호를 -없이 입력해주세요.">
							</div>				
							
							<div class="address_insert_dummy"></div>
							
							<label class="form-label">주소<button class="btn btn-outline-secondary address_insert_search_btn" onclick="execDaumPostcode()"><i class="bi bi-search"></i>&nbsp;&nbsp;주소찾기</button></label>	

				
							<div class="mb-3">
				  				<input class="form-control address_input" id="zonecode"  placeholder="우편번호" readonly>
				  				<input class="form-control address_input" id="roadAddr"  placeholder="도로명주소" readonly>
				  				<span  id="guide" style="color: #999; display: none"></span>
				  				<input class="form-control address_input" id="detailAddress" maxlength="20" placeholder="상세주소" >
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
							<th class="point_table_th1">
								포인트
							</th>
							
							<td class="point_table_col1">
								보유 <span class="user_point_value"><fmt:formatNumber value="${userPoint}" pattern="###,###"/></span> 원
							</td>
							
							<td class="point_table_col2">
								<span class=""><i class="bi bi-chevron-down" id="point_table_toggle"></i></span>							
							</td>
						</tr>
						
						<tr class="point_table_none" id="point_table_none">
							<th class="point_table_th2">통합포인트</th>
							<td class="point_table_col3">
								<fmt:formatNumber value="${userPoint}" pattern="###,###"/> 원
								<input type="hidden" id="max_point_value" value="${userPoint}" >
							</td>
	
							<td class="point_table_col4">
				  				<input class="form-control point_table_use_point_input" id="point_table_use_point_input" value="0" />														
								<button type="button" class="btn btn-outline-secondary point_table_full_use_btn" id="point_table_full_use_btn" data-bs-toggle="button" aria-pressed="true">전액사용</button>													
							</td>
						</tr>
					</table>
				</div>
				
				
				<!-- ------------------ pay ---------------------- -->
				<div class="pay">			
					<table class="pay_table">
						
						<tr>
							<th class="pay_table_th1">결제수단</th>
						</tr>

						<c:if test="${null ne lastPayment}">
							<tr>
								<td class="pay_table_col_lastpay">
									<span>최근결제수단</span>
									<input type="radio" class="btn-check" name="pay_radio" id="pay_radio0" autocomplete="off" value="${lastPayment.PAY_METHOD}" checked>
									<label class="btn btn-outline-secondary pay_radio_label_last" for="pay_radio0">${lastPayment.PAY_METHOD}</label>								
								</td>
							</tr>						
						</c:if>
	
					
						<tr>
							<td class="pay_table_col1">
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio1" autocomplete="off" value="카드">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio1">카드</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio2" autocomplete="off" value="토스페이">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio2">토스페이</label>
							
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio3" autocomplete="off" value="가상계좌">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio3">가상계좌</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio4" autocomplete="off" value="계좌이체">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio4">계좌이체</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio5" autocomplete="off" value="휴대폰">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio5">휴대폰</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio6" autocomplete="off" value="문화상품권">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio6">문화상품권</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio7" autocomplete="off" value="도서문화상품권">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio7">도서문화상품권</label>
								
								<input type="radio" class="btn-check" name="pay_radio" id="pay_radio8" autocomplete="off" value="게임문화상품권">
								<label class="btn btn-outline-secondary pay_radio_label" for="pay_radio8">게임문화상품권</label>
							</td>
						</tr>		
					</table>
				
				
				</div>
		
		
			</div>		

	</div>
	
	<jsp:include page="/views/inc/footer.jsp" />
	</div>
	

	
	<script type="text/javascript" src="/resources/js/orderitem.js"></script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>
	
   <!-- 아래 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
  	   <script>
   		let user_no = <%= (int)session.getAttribute("user_no") %>;
   		<%@include file="/resources/js/cartLIstCount.js"%>
	   </script> 

</body>
</html>


