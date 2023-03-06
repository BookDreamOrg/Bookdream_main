<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>	
	
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	
	<!-- Favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-touch-icon.png" />
	<link rel="icon" type="/image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png" />
	<link rel="icon" type="/image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png" />
	<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
	<link rel="stylesheet" href="/resources/css/styles.css" />
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
	<title>결제/주문 페이지</title>
	
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- CSS -->
	<style type="text/css">
		input[type='number']::-webkit-outer-spin-button, 
		input[type='number']::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		input[type="checkbox"]:checked ,
		.color_badge,
		.color_btn {
			background-color:var(--main-color);
			color: white;
		}
		
		input[type='checkbox'] {
			width: 20px;
			height: 20px;
		}
		
		a:hover{
			color: var(--main-color);
		}
		a:hover::after{
			color: var(--main-color);
		}
		
		.color_btn:hover{
			background-color:var(--main-color-tint5);
			color: white;
		}
	</style>

</head>

<body>
	<div class="wrapper">
	<!-- ---------------------------<header> header------------------------- -->
	<jsp:include page="/views/inc/header.jsp" />
	

	<div class="container"><main>
		<!-- dummy box -->
		<div style="height: 100px">
				<!-- dummy -->
			</div>

		<!-- ---------------------------top-------------------------  -->
		<div class="top py-3 text-center fw-bold fs-1">
		</div>

		<form class="row g-4 justify-content-md-evenly" method="POST" action="/detail/cart/orderitem" >
		
		
		
		
			<!-- ------------------cartList---------------------- -->
			<div class=" d-flex align-items-stretch justify-content-center 
						col-md-8 col-lg-8 order-md-first">
				<c:if test="${cartListCount == 0 }">
					<div class="d-flex flex-column align-self-center rounded p-3 fw-bold  ">
							<span class=" p-3 text-center fs-5">
								<p>장바구니에 아무것도 없어요</p></span>
							<span class=" p-3 text-center fs-1">
								<p>🤔🤔🤔</p></span>
					</div>
				</c:if>
					
					<div class="row">
								
					<c:set var = "sum" value = "0" />
					<c:set var = "discountSum" value = "0" />
					<c:set var = "totalPrice" value = "0" />
					<c:set var = "deliveryFee" value = "3000" />
								
					<c:if test="${cartListCount != 0 }">
						<table class="table ">
								
								<thead><tr><th colspan="5" >
									<div class=" d-md-flex justify-content-md-between g-2 align-items-center">
										<span class="allCheck">
											<input class="form-check-input border rounded-circle m-1" 
													type="checkbox" name="allCheck" id="allCheck"> 
											<label class="text-muted pt-2 px-0 badge fw-bold lh-sm" for="allCheck">전체</label> 
											<!-- 전체 체크----------------- -->
											<script>
												$(function() {
													$("#allCheck").prop("checked", true);
													$(".chBox").prop("checked", true);
														
													$("#allCheck").click(function(){
														 var chk = $("#allCheck").prop("checked");
														 if(chk) {
														  $(".chBox").prop("checked", true);
														 } else {
														  $(".chBox").prop("checked", false);
													}});
												});
											</script>
										</span>
										<span class="delBtn">
											 <button type="button" 
											 		class="selectDelete_btn btn btn-sm rounded-pill color_btn" >선택 삭제</button> 
										</span>
									</div>
								</th></tr></thead>
								
								<c:forEach items="${cartList}" var="cart" varStatus="status">
									<tbody><tr class="border-top border-bottom ">
										<c:set var = "discountRate" value = "${cart.bookVO.discount/100 }" />
										<c:set var = "costPrice" value = "${cart.bookVO.book_price}" />
										<c:set var = "salePrice" value = "${costPrice - (costPrice*discountRate)}" />
										<c:set var = "cnt" value = "${cart.product_count}" />
										
										<c:set var= "sum" value="${sum + (cnt*salePrice) }"/>
										<c:if test="${discountRate != 0 }">
											<c:set var= "discountSum" value="${discountSum + (discountRate*costPrice*cnt) }"/>
										</c:if>
										<c:if test="${(sum - discountSum) >= 30000 }">
											<c:set var = "deliveryFee" value = "0" />
										</c:if>
										<c:set var= "totalPrice" value="${sum - discountSum + deliveryFee }"/>

										<!-- -----------------------체크박스----------------------- -->
										<td class="align-middle">
											<div class="checkBox form-check checkBox">
												<input class="chBox chBox${cart.cart_no} form-check-input border rounded-circle" onchange="ckBox()"
														type="checkbox" name="chBox[]" value="${cart.cart_no}" data-cartNo="${cart.cart_no}"
														data-discountRate="${cart.bookVO.discount/100 }"
														data-costPrice="${cart.bookVO.book_price}"
														data-salePrice="${costPrice - (costPrice*discountRate)}"
														> 
														<%-- data-cnt="${cart.product_count}"  --%>
												<input type="hidden" class="product_cnt${cart.cart_no}" value="${cart.product_count }" disabled>
												<!-- 체크 ----------------- -->
												<script>
													$(".chBox").click(function(){
													  	$("#allCheck").prop("checked", false);
													 });
												</script>
											</div>
										</td>
											
										<!-- -----------------------책 이미지----------------------- -->
										<td class="col-2 align-middle">
											<a href="/getBook?book_no=${ cart.bookVO.book_no }"> 
												<img class="my-2 img-thumbnail" src="${cart.bookVO.book_img }">
											</a>
										</td>
			
										<!-- -----------------------책제목, 가격----------------------- -->
										<td class="align-middle my-3" align="left">
											<p class="fw-bold fs-6 lh-sm ms-3">
												<a class="text-decoration-none " 
													href="/getBook?book_no=${cart.bookVO.book_no}">${cart.bookVO.title}</a>
											</p>
											<c:choose>
												<c:when test="${discountRate == 0 }"><!-- 할인하지 않는 제품 -->
													<div class="d-flex justify-content-start align-items-end mt-2 ms-3 ">
														<span class="fs-3 fw-bold lh-sm ">
															<fmt:formatNumber type="currency" pattern="###,###,###원" value="${salePrice} " />
														</span>
													</div>
												</c:when>
												<c:when test="${discountRate != 0 }"><!-- 할인 제품 -->
													<div class="d-flex justify-content-start align-items-end mt-2 ms-3 ">
														<span class="text-muted fw-bold me-1 lh-sm pb-1" >
															<fmt:formatNumber type="percent" value="${discountRate}" />
														</span>
														<span class="fs-3 fw-bold lh-sm ">
															<fmt:formatNumber type="currency" pattern="###,###,###원" value="${salePrice} " />
														</span>
														<span class="text-muted ms-1 lh-sm pb-1 text-decoration-line-through" >
															<fmt:formatNumber type="currency" pattern="###,###,###원" value="${costPrice}" />
														</span>
													</div>
												</c:when>
											</c:choose>
										</td>
										
										<!-- -----------------------장바구니 삭제------------------------ -->
										<td class="delete border-end m-1 " >
											<button class="delete${cart.cart_no}btn 
															close align-middle align-items-center
															btn btn-light rounded-circle "
												data-cartNo="${cart.cart_no}" type="button" aria-label="Close">
												<span class="" aria-hidden="true">&times;</span>
											</button>
												
											<script>
												$(".delete${cart.cart_no}btn").click(function(){
													
													const Toast = Swal.mixin({
							         				    toast: true,
							         				    position: 'center-center',
							         				    showConfirmButton: false,
							         				    timer: 2000,
							         				    timerProgressBar: true,
							         				    didOpen: (toast) => {
							         				        toast.addEventListener('mouseenter', Swal.stopTimer)
							         				        toast.addEventListener('mouseleave', Swal.resumeTimer)
							         				    }
							         				});
													
													let checkArr = [];
													
													checkArr.push($(this).attr("data-cartNo"));
													console.log("checkArr : " + checkArr)
													
													
													
													$.ajax({
															url : "/itemorder/cart/delete",
															type : "POST",
															data : { chbox : checkArr },
															success : function(result){
																if(result == 1) {          
																	location.href = "/itemorder/cart/list";
																} else {
																	Toast.fire({
									    							    icon: 'error',
									    							    title: '삭제 실패'
									    							});
																}
															},complete: function(){
								    							Toast.fire({
								    							    icon: 'success',
								    							    title: '삭제되었습니다!'
								    							});
								    							    location.href = "/itemorder/cart/list";
								    							
								    						},error : function(){
								    							Toast.fire({
								    							    icon: 'error',
								    							    title: 'error : 삭제 실패'
								    							});
								    						}	
													});
													
													
													});
											</script>
										</td>
												
										<!-- -----------------------금액 , 수량----------------------- -->
										<td class="col-3 align-middle"  >
													<div class="p-3">
													<!-- justify-content-center  text-center align-middle-->
														<div class="d-flex justify-content-center  mx-auto"> 
															<span class="total${cart.cart_no} fs-5 lh-sm  fs-4">
																<fmt:formatNumber  type="currency" pattern="###,###,###원" value="${salePrice * cnt } " />
															</span>
														</div>
															
														<div class="input-group input-group-sm w-75 m-auto
																	border border-dark-subtle rounded-3 border-2">
															<input type="hidden" class="book_pirce${cart.cart_no}" value="${cart.bookVO.book_price }" disabled>
															<input type="hidden" class="stock${cart.cart_no}" value="${cart.bookVO.stock }" disabled>
															<input  class="product_cnt${cart.cart_no} qty form-control text-center border-0 " type="number" min="1" max="${cart.bookVO.stock}"  
																	value="${cart.product_count}" readonly="readonly">
	
															<button class="minus${cart.cart_no} btn fw-bold order-first" type="button" data-cartNo="${cart.cart_no}">-</button>
															<script >
															$(".minus${cart.cart_no}").click(function() {
																let product_count = $(".product_cnt${cart.cart_no}").val(); // input 수량값
																let price = $("input[class='book_pirce${cart.cart_no}']").val(); // bookPrice값
																
																const Toast = Swal.mixin({
										         				    toast: true,
										         				    position: 'center-center',
										         				    showConfirmButton: false,
										         				    timer: 2000,
										         				    timerProgressBar: true,
										         				    didOpen: (toast) => {
										         				        toast.addEventListener('mouseenter', Swal.stopTimer)
										         				        toast.addEventListener('mouseleave', Swal.resumeTimer)
										         				    }
										         				});
													
																if (product_count > 1) {
																		$(".product_cnt${cart.cart_no}").val(--product_count);
																		<%@include file="/resources/js/modifyCart.js"%>
																		   
																} else {
																	
																	let checkArr = [];
																	
																	checkArr.push($(this).attr("data-cartNo"));
																	console.log("checkArr : " + checkArr)
																	
																	
																	Swal.fire({
															         	      title: '장바구니에서 삭제할까요??',
															         	      text: '책 한 권 이하로 담을 수 없어요..',
															         	      icon: 'warning',
															         	      showCancelButton: true,
															         	      confirmButtonColor: '#3085d6',
															         	      cancelButtonColor: '#d33',
															         	      confirmButtonText: '삭제하기',
															         	      cancelButtonText: '취소',
															         	      reverseButtons: true, // 버튼 순서 거꾸로
															         	    
																			
															          }).then((result) =>{
															         	    	if (result.value) { 
															         	    		
															         	    		let checkArr = [];
															         	    		
															         	    		const Toast = Swal.mixin({
															         				    toast: true,
															         				    position: 'center-center',
															         				    showConfirmButton: false,
															         				    timer: 2000,
															         				    timerProgressBar: true,
															         				    didOpen: (toast) => {
															         				        toast.addEventListener('mouseenter', Swal.stopTimer)
															         				        toast.addEventListener('mouseleave', Swal.resumeTimer)
															         				    }
															         				});
															         													  	    
															    					$.ajax({
															    						url : "/itemorder/cart/delete",
															    						type : "POST",
															    						data : { chbox : checkArr },
															    						success : function(result){
															    							if(result != 1) { 
															    								Toast.fire({
															    									icon: 'error',
																    							    title: '삭제 실패'
															    								});
															    							    ("삭제 실패");
															    							}
															    						},complete: function(){
															    							Toast.fire({
															    							    icon: 'success',
															    							    title: '삭제되었습니다!'
															    							});
															    							    location.href = "/itemorder/cart/list";
															    							
															    						},error : function(){
															    							Toast.fire({
															    							    icon: 'error',
															    							    title: 'error : 삭제 실패'
															    							});
															    						}
															    					});
															         	    	}
																		
																			});
																		}
															}); 
															</script>
															
															<button class="plus${cart.cart_no} btn fw-bold order-last" type="button" data-cartNo="${cart.cart_no}">+</button>
															<script >
															$(".plus${cart.cart_no}").click(function() {
																let product_count = $(".product_cnt${cart.cart_no}").val(); // input 수량값
																let price = $(".book_pirce${cart.cart_no}").val(); // bookPrice값
																let stock = $(".stock${cart.cart_no}").val(); // bookPrice값
																
																	if (product_count === stock) {
																		const Toast = Swal.mixin({
												         				    toast: true,
												         				    position: 'center-center',
												         				    showConfirmButton: false,
												         				    timer: 2000,
												         				    timerProgressBar: true,
												         				    didOpen: (toast) => {
												         				        toast.addEventListener('mouseenter', Swal.stopTimer)
												         				        toast.addEventListener('mouseleave', Swal.resumeTimer)
												         				    }
												         				});
																		
																		Toast.fire({
										    							    icon: 'warning',
										    							    title: "[재고] : "+stock +"권\n재고가  부족합니다."
										    							});
																		
																	} else {
																		$(".product_cnt${cart.cart_no}").val(++product_count);
																		<%@include file="/resources/js/modifyCart.js"%>
																	}
															}); 
															</script>
															
														</div>
													</div>
												</td>
								
								</tr></tbody></c:forEach>
						</table></c:if>
					</div>
			</div>
				
			<!-- ------------------slide box---------------------- -->
			<div class="slideBox col-md-3 col-lg-3">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="fw-bold">Total</span> 
					<span class="badge rounded-pill color_badge">${cartListCount}</span>
				</h4>
					
				<ul class="list-group mb-3 reload">
					<!------------------- 상품 금액 ------------------->
					<li class="list-group-item d-flex justify-content-between lh-sm border-bottom-0">
						<div class="mt-3 ms-3">
							<h6 class="fw-bold">상품 금액</h6>
						</div> 
						<span class="text-muted mt-3 me-3">
							<fmt:formatNumber pattern=" ###,###,### 원" value="${sum }" />	
						</span>
					</li>
					<!------------------- 할인 금액 ------------------->
					<li class="list-group-item d-flex justify-content-between lh-sm border-bottom-0">
						<div class="ms-3">
							<h6 class="fw-bold">할인 금액</h6>
						</div> 
						<span class="text-muted me-3">					
							<fmt:formatNumber pattern=" (-) ###,###,### 원" value="${discountSum }" />	
						</span>
					</li>
					<!------------------- 배송비 ------------------->
					<li class=" list-group-item lh-sm border-bottom-0">
						<div class="d-flex justify-content-between lh-sm">
							<div class="ms-3">
								<h6 class="fw-bold">배송비</h6>
							</div> 
							<span class=" text-muted me-3" >
								<fmt:formatNumber pattern="(+) ###,###,### 원" value="${deliveryFee }" />
							</span>
						</div>							
						<c:choose>
							<c:when test="${ 25000 > (sum-discountSum)}">
								<div class="d-flex progress lh-sm mt-3 mx-3" style="height: 10px;">
									<div class="progress-bar" role="progressbar" style="width: ${100/(30000/(sum-discountSum))}%;" aria-valuenow="10000" aria-valuemin="0" aria-valuemax="30000"></div>
								</div>
								<div class="d-flex justify-content-end lh-sm">
									<span class="text-muted mt-1 mx-3 " >
											<small class="fw-light fs-6 text-align-end">*3만원 이상 구매 시, 무료배송</small>
									</span>
								</div> 
							</c:when>
							<c:when test="${ 25000 <= (sum-discountSum) and (sum-discountSum) < 30000 }">
								<div class="d-flex progress lh-sm mt-3 mx-3" style="height: 10px;">
									<div class="progress-bar" role="progressbar" style="width: ${100/(30000/(sum-discountSum))}%;" aria-valuenow="10000" aria-valuemin="0" aria-valuemax="30000"></div>
								</div>
								<div class="d-flex justify-content-end lh-sm">
									<span class="text-muted mt-1 mx-3 " >
										<small class="fw-light fs-6 text-align-end">
											<fmt:formatNumber pattern="###,###,###원" value="${30000-(sum-discountSum)}"/> 더 채우면 , 무료배송
										</small>
									</span>
								</div> 
							</c:when>
							<c:when test="${(sum-discountSum) >= 30000}">
								<div class="d-flex justify-content-end lh-sm">
									<span class="text-muted mt-3 mx-3 " >
										<small class="fw-light fs-6 text-align-end">*3만원 이상 구매 시, 무료배송</small>
									</span>
								</div> 
							</c:when>
						</c:choose>
					</li>
					<!------------------- 구분선 ------------------->
					<li class="list-group-item lh-sm border-bottom-0 ">
							<hr class="my-2 mx-3">
						</li>
					<!------------------- 결제 예정 금액 ------------------->
					<li class="list-group-item lh-sm">
						<span class="d-flex justify-content-between lh-sm mx-3">
							<h6 class="my-1 fw-bold fs-6">결제 예정 금액</h6>
						</span>
						<span class="d-flex justify-content-end align-items-end lh-sm mb-4 mx-3 fw-bold fs-3 ">					
							<fmt:formatNumber pattern=" ###,###,### " value="${totalPrice }" />	
							<h6 class="fs-6 ms-1 my-1"> 원</h6>
						</span>  
					</li>
				</ul>
					
				<!-- 결제 버튼 -->
				<div class="card p-0 border-0">
					<div class="input-group">
						<c:if test="${cartListCount == 0 }">
							<button class="payNow_btn w-100 btn btn-lg fw-bold color_btn" disabled="disabled"> 결제하기</button>
						</c:if>
						<c:if test="${cartListCount != 0 }">
							<button class="payNow_btn w-100 btn btn-lg fw-bold color_btn" > 결제하기</button>
						</c:if>	
					</div>
				</div>
			</div>
		
		
		
		
		
		</form>

		<!-- dummy box -->
		<div style="height: 100px">
				<!-- dummy -->
			</div>
	</main></div>
	
	<!-- ---------------------------<footer> footer-------------------------- -->
	<jsp:include page="/views/inc/footer.jsp" />
	</div>


	<!-- ------------------------장바구니 선택(체크) 삭제------------------------------- -->
	<script type="text/javascript">/* 장바구니  삭제 */
		$(".selectDelete_btn").click(function(){
			// 선택(체크)된 아이템 갯수
			let i = $('input:checkbox[name="chBox[]"]:checked').length; 
			
			
			if (i > 0) {
				
			var checkArr = [];
				$('input:checkbox[name="chBox[]"]').each(function() {
					if($(this).is(":checked")==true){
				    	checkArr.push($(this).attr("data-cartNo"));
				    }
			}); console.log("checkArr : " + checkArr)
			
				Swal.fire({
	         	      title: '선택된 항목을 삭제할까요?',
	         	      text: '',
	         	      icon: 'warning',
	         	      showCancelButton: true,
	         	      confirmButtonColor: '#3085d6',
	         	      cancelButtonColor: '#d33',
	         	      confirmButtonText: '삭제하기',
	         	      cancelButtonText: '취소',
	         	      reverseButtons: true, // 버튼 순서 거꾸로
	         	    
					
	         	    }).then((result) =>{
	         	    	if (result.value) { 
	         	    		
	         	    		const Toast = Swal.mixin({
	         				    toast: true,
	         				    position: 'center-center',
	         				    showConfirmButton: false,
	         				    timer: 2000,
	         				    timerProgressBar: true,
	         				    didOpen: (toast) => {
	         				        toast.addEventListener('mouseenter', Swal.stopTimer)
	         				        toast.addEventListener('mouseleave', Swal.resumeTimer)
	         				    }
	         				});
	         													  	    
	    					$.ajax({
	    						url : "/itemorder/cart/delete",
	    						type : "POST",
	    						data : { chbox : checkArr },
	    						success : function(result){
	    							if(result != 1) { 
	    								Toast.fire({
	    									icon: 'error',
		    							    title: '삭제 실패'
	    								});
	    							   alert("삭제 실패");
	    							}
	    						},complete: function(){
	    							Toast.fire({
	    							    icon: 'success',
	    							    title: '삭제되었습니다!'
	    							});
	    							    location.href = "/itemorder/cart/list";
	    							
	    						},error : function(){
	    							Toast.fire({
	    							    icon: 'error',
	    							    title: 'error : 삭제 실패'
	    							});
	    						}
	    					});
	         	    	}
	         	  });
				
			} else {
				const Toast = Swal.mixin({
 				    toast: true,
 				    position: 'center-center',
 				    showConfirmButton: false,
 				    timer: 2000,
 				    timerProgressBar: true,
 				    didOpen: (toast) => {
 				        toast.addEventListener('mouseenter', Swal.stopTimer)
 				        toast.addEventListener('mouseleave', Swal.resumeTimer)
 				    }
 				});
				Toast.fire({
				    icon: 'warning',
				    title: '선택된 항목이 없어요ㅜ'
				});
			}
		});
	</script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

	<script type="text/javascript">
		<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	
	 <!-- 아래 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
</body>

</html>