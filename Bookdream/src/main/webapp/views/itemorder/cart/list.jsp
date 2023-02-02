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
	
	<!-- Favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-touch-icon.png" />
	<link rel="icon" type="/image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png" />
	<link rel="icon" type="/image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png" />
	<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
	<link rel="stylesheet" href="/resources/css/styles.css" />
	
	<title>결제/주문 페이지</title>
	
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	
	<!-- CSS -->
	<style type="text/css">
		input[type='number']::-webkit-outer-spin-button, 
		input[type='number']::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		
		input[type='checkbox'] {
			width: 20px;
			height: 20px;
		}
	</style>

</head>

<body>

	<!-- ---------------------------<header> header------------------------- -->
	<header>
		<% int book_no = (int) (Math.random() * 100) + 1; %>
		<div class="header-nav-list">
			<ul class="nav header-nav">
				<li class="nav-item">
					<a class="nav-link header-nav-link" aria-current="page" href="user/join.jsp">회원가입</a>
				</li>
				<span class="nav-bar-line"></span>
				<li class="nav-item">
					<a class="nav-link header-nav-link" href="user/login.jsp">로그인</a>
				</li>
				<span class="nav-bar-line"></span>
				<li class="nav-item">
					<a class="nav-link header-nav-link" href="#">고객센터</a>
				</li>
				<span class="nav-bar-line"></span>
				<li class="nav-item">
					<a class="nav-link header-nav-link disabled" href="#" tabindex="-1" aria-disabled="true"> 관리자 </a>
				</li>
			</ul>
		</div>
		
		<div class="row d-flex header-row">
			<div class="col-lg-1 p-2 header-col-home mr-2 mb-1">
				<a href="#"> 
					<img class="header-row-logo ms-4 mb-1" src="/resources/images/logo/logo_white.png" alt="logo_white" /> 
					<img class="header-row-logo_text" src="/resources/images/logo/logo_text.png" alt="logo_text" />
				</a>
			</div>
			<div class="col-lg-6 p-2 ms-5 header-col-search">
				<div class="input-group mb-2 col-search">
					<button
						class="btn btn-outline-secondary dropdown-toggle search-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						통합검색</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">베스트</a></li>
						<li><a class="dropdown-item" href="#">신상품</a></li>
					</ul>
					<input type="text" class="form-control search-input"
						aria-label="Text input with dropdown button"
						placeholder="성공적인 프로젝트를 위하여!!👍" />
				</div>
			</div>
			<div class="col-lg-1 p-5 flex-grow-1 header-col-btn">
				<a href="cart.jsp">
					<div class="header-btn">
						<i class="fa-solid fa-cart-shopping"></i>
					</div>
				</a> 
				<a href="orderitem.jsp">
					<div class="header-btn btn-circle ms-3">
						<i class="fa-solid fa-user"></i>
					</div>
				</a>
			</div>
		</div>
		
		<div class="header-menu mb-1">
			<div class="btn-circle btn-circle-tint">
				<i class="fa-solid fa-bars"></i>
			</div>
			<ul class="nav header-menu-list">
				<li class="nav-item">
					<form action="/getBook" method="get">
						<button type="submit" name="book_no" value="<%=book_no%>">베스트</button>
					</form>
				</li>
				<div class="dot"></div>
				<li class="nav-item">
					<a class="nav-link menu-link" href="#">신상품</a>
				</li>
				<div class="dot"></div>
				<li class="nav-item">
					<a class="nav-link menu-link" href="#">이벤트</a>
				</li>
				<div class="dot"></div>
				<li class="nav-item">
					<a class="nav-link menu-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
				</li>
			</ul>
		</div>
		
	</header>

	<div class="container">

		<main>
			
			<!-- dummy box -->
			<div style="height: 100px">
				<!-- dummy -->
			</div>
			
			<!-- ---------------------------top------------------------- -->
			<div class="top py-3 text-center fw-bold fs-1">
				<h2></h2>
			</div>

			<div class="row g-4 justify-content-md-evenly">
	
				<!-- ------------------cartList---------------------- -->
				<div class="col-md-8 col-lg-8 order-md-first">
					<div class="row">
						<table class="table ">
								<thead class="">
										<tr>
											<th colspan="5" >
												<div class=" d-md-flex justify-content-md-between g-2 align-items-center">
													<span class="allCheck">
														<input class="form-check-input border rounded-circle m-1" 
																type="checkbox" name="allCheck" id="allCheck"> 
														<label class="text-muted pt-2 px-0 badge fw-bold lh-sm" for="allCheck">전체</label> 
														
														<script>
															$("#allCheck").click(function(){
																 var chk = $("#allCheck").prop("checked");
																 if(chk) {
																  $(".chBox").prop("checked", true);
																 } else {
																  $(".chBox").prop("checked", false);
																 }
															});
														</script>
														
													</span>
													<span class="delBtn">
												   		<button type="button" 
												   				class="selectDelete_btn 
												   						btn btn-sm btn-secondary rounded-pill" >선택 삭제</button> 
												   		
														
												   		<button type="button" 
												   				class="btn btn-sm btn-secondary rounded-pill" >버튼 버튼</button> 
												  	</span>
												</div>
											</th>
										</tr>
								</thead>
								
								<c:forEach items="${cartList}" var="cart" varStatus="status">
									<tbody class="">
										<tr class="border-top border-bottom ">
			
												<!-- -----------------------체크박스----------------------- -->
												<td class="align-middle">
													<div class="checkBox 
																form-check checkBox">
														<input id="" class="chBox 
																			form-check-input border rounded-circle"
																type="checkbox" name="chBox" data-cartNum="${cart.cart_no }" > 
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
													<div class="d-flex justify-content-start align-items-end mt-2 ms-3 ">
														<span class="text-muted fw-bold me-1 lh-sm pb-1" >
															<fmt:formatNumber type="percent" value="0.1" />
														</span>
														<span class="fs-3 fw-bold lh-sm ">
															<fmt:formatNumber type="currency" pattern="###,###,###원" 
																value="${cart.bookVO.book_price-(cart.bookVO.book_price*0.1)} " />
														</span>
														<span class="text-muted ms-1 lh-sm pb-1 text-decoration-line-through" >
															<fmt:formatNumber type="currency" pattern="###,###,###원" value="${cart.bookVO.book_price}" />
														</span>
													</div>
													
													<%-- <span class="text-muted ms-3 lh-sm" >
															<fmt:formatNumber pattern="재고 : ###,###,### 권" value="${cart.bookVO.stock }" />
													</span> --%>
												</td>
												
												<!-- -------장바구니 삭제------ -->
												<td class="delete border-end m-1 " >
													<button class="delete_btn close
																	align-middle align-items-center
																	btn btn-light rounded-circle "
														data-cartNum="${cart.num }" type="button" aria-label="Close">
														<span class="" aria-hidden="true">&times;</span>
													</button>
												</td>
												
												<!-- -----------------------금액 , 수량----------------------- -->
												
												<td class="col-3 align-middle">
													<div class="p-3">
													<!-- justify-content-center  text-center align-middle-->
														<div class="d-flex justify-content-center  mx-auto"> 
															<span id="test" class="fs-5 lh-sm  fs-4">
																<fmt:formatNumber  pattern="###,###,###원" value="${(cart.bookVO.book_price * cart.product_count)}" />
															</span>
														</div>
															<%-- <input type="hidden" name="book_pirce" value="${cart.bookVO.book_price-(cart.bookVO.book_price*0.1)}"> --%>
															
														<div class="input-group input-group-sm w-75 m-auto
																	border border-dark-subtle rounded-3 border-2">
															<button class="minus btn fw-bold" type="button">-</button>
															<input id="product_cnt" class=" qty form-control text-center border-0 "
																	type="number" name="product_cnt" min="1" max="${cart.bookVO.stock}" 
																	value="${cart.product_count}">
															<input type="hidden" name="book_pirce" value="${cart.bookVO.book_price }">
															<input type="hidden" name="stock" value="${cart.bookVO.stock }">
															<button class="plus btn fw-bold" type="button">+</button>
														</div>
													</div>
												</td>
												
											</tr>
									</tbody>	
								</c:forEach>
								
							</table>
							
						</div>
				
				</div>
				
				<!-- ------------------slide box---------------------- -->
				<div class="slideBox col-md-3 col-lg-3">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="fw-bold text-primary">Total</span> 
						<span class="badge bg-primary rounded-pill">${cartListCount}<%-- ${cartListCount} --%></span>
					</h4>
	
					<ul class="list-group mb-3">
					
						<!-- 상품 금액 -->
						<li class="list-group-item d-flex justify-content-between lh-sm border-bottom-0">
							<div class="mt-3 ms-3">
								<h6 class="fw-bold">상품 금액</h6>
							</div> 
							<span class="text-muted mt-3 me-3">
								<fmt:formatNumber pattern=" ###,###,### 원" value="10000" />	
							</span>
						</li>
						
						<!-- 할인 금액 -->
						<li class="list-group-item d-flex justify-content-between lh-sm border-bottom-0">
							<div class="ms-3">
								<h6 class="fw-bold">할인 금액</h6>
							</div> 
							<span class="text-muted me-3">
								<fmt:formatNumber pattern="- ###,###,### 원" value="3000" />
							</span>
						</li>
						
						<!-- 배송비 -->
						<li class="list-group-item lh-sm border-bottom-0">
							<div class="d-flex justify-content-between lh-sm">
								<div class="ms-3">
									<h6 class="fw-bold">배송비</h6>
								</div> 
								<span class="text-muted me-3" >
									<fmt:formatNumber pattern="+ ###,###,### 원" value="3000" />
								</span>
							</div>
							<div class="d-flex progress lh-sm mt-1 mx-3" style="height: 10px;">
								<div class="progress-bar " role="progressbar" style="width: 33.33%;" aria-valuenow="10000" aria-valuemin="0" aria-valuemax="30000">
									<%-- <fmt:formatNumber pattern="###,###,### 원" value="10000" /> --%>
								</div>
							</div>
							<div class="d-flex justify-content-end lh-sm">
								<span class="text-muted mt-1 mx-3 " >
									<small class="fw-light fs-6 text-align-end">*3만원 이상 구매 시, 무료배송</small>
								</span>
							</div> 
						</li>
						
						<!-- 구분선 -->
						<li class="list-group-item lh-sm border-bottom-0 ">
							<hr class="my-2 mx-3">
						</li>
						
						<!-- 결제 예정 금액 -->
						<li class="list-group-item lh-sm">
							<span class="d-flex justify-content-between lh-sm mx-3">
								<h6 class="my-1 fw-bold fs-6">결제 예정 금액</h6>
							</span>
							<span class="d-flex justify-content-end align-items-end lh-sm mb-4 mx-3 fw-bold fs-3 ">
								<fmt:formatNumber pattern="###,###,### " value="100000" />
								<h6 class="fs-6 ms-1 my-1"> 원</h6>
							</span>  
						</li>
					</ul>
					
					<!-- 결제 버튼 -->
					<form class="card p-0 border-0">
						<div class="input-group">
							<button class="w-100 btn btn-primary btn-lg fw-bold" type="submit" 
									onclick="location.href='/detail/cart/orderitem'"> 결제하기</button>
						</div>
					</form>
				</div>
				
			</div>
			
			<!-- dummy box -->
			<div style="height: 100px">
				<!-- dummy -->
			</div>
		
		
		</main>
		
		
	</div>
	
	<!-- ---------------------------<footer> footer-------------------------- -->
	<footer>
		<div>
			<a class="footer-logo" href="#"> <img class="footer-logo-img"
				src="/resources/images/logo/logo_white.png" alt="logo_white" /> <img
				class="footer-logo-text"
				src="/resources/images/logo/logo_text--white.png"
				alt="logo_text--white" />
			</a>
		</div>
		<div class="footer-section">
			<div class="footer-profile-box">
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">윤동환</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">양현정</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">백기렬</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">차승윤</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">안성연</a>
					</div>
				</div>
			</div>
			<div class="footer-document">
				<div class="doucumnet-text">Project 설명이 포함되어 있습니다.</div>
				<span>© BOOKDREAM BUKDACK-BUCKDACK</span>
			</div>
		</div>
	</footer>
	
	
	
	<script>
	 $(".selectDelete_btn").click(function(){
		  var confirm_val = confirm("장바구니를 삭제할까요?");
		  
		  if(confirm_val) {
		  	var checkArr = new Array();
		   	$("input[class='chBox']:checked").each(function(){
		    	checkArr.push($(this).attr("data-cartNum"));
		  });
		    
		   $.ajax({
			    url : "/itemorder/cart/delete",
			    type : "POST",
			    data : { chbox : checkArr },
			    success : function(result){ // 1 : 장바구니 삭제 성공, 0 : 장바구니 삭제 실패
			    	
			    	if (result == 1) {
					    location.href = "/itemorder/cart/list";
					    alert("삭제 성공");
					} else {
						alert("삭제 실패");
					}
			    }
		   });
		 } 
	});
</script>
	<script>
	
	$(".minus").on("click", function() {
		var cnt = $(this).siblings("input[name='product_cnt']").val(); // input 수량값
		var price = $(this).siblings("input[name='book_pirce']").val(); // bookPrice값
		
		console.log("minus---> if문 실행 전");
		console.log(cnt, price, (cnt>1));	

			if (cnt > 1) {
				$(this).siblings("div").find("input[name='product_cnt']").val(--cnt);	
				$(this).siblings("input[name='book_pirce']").val(price);
				console.log(cnt, price, (cnt>1));	
				//$(this).parent("div").siblings("div").find("fmt:formatNumber").val(cnt*price);
				alert("수량 변경");
			} else {
				alert("장바구니에 책 1권 이하로 담을 수 없어요");
			}
	}); 
	
	$(".plus").on("click", function() {
		var cnt = $(this).siblings("input[name='product_cnt']").val();// input 수량값
		var stock = $(this).siblings("input[name='stock']").val(); // bookStock값
		var price = $(this).siblings("input[name='book_pirce']").val(); // bookPrice값
		
		console.log("plus---> if문 실행 전");
		console.log( cnt , stock, price, (cnt<stock));	// 2 < 10 -> false??????????? 	
				
			if (stock >= cnt) {
				$(this).siblings("div").find("input[name='product_cnt']").val(++cnt);
				$(this).siblings("input[name='stock']").val(stock);
				$(this).siblings("input[name='book_pirce']").val(price);
				console.log( cnt , stock, price, (cnt<stock));
				//$(this).parent("div").parent("div").find("fmt:formatNumber").val(cnt*price);
				alert("수량 변경");
			} else {
				alert("현재 재고가 부족합니다.");
			}
	});
	

	</script>
	
	<script>
	 /*
	 
	  $(".plus").click(function(){
		   var num = $(".numBox").val();
		   var plusNum = Number(num) + 1;
		   
		   if(plusNum >= ${view.gdsStock}) {
		    $(".numBox").val(num);
		   } else {
		    $(".numBox").val(plusNum);          
		   }
		  });
		  
		$(".minus").click(function(){
		   var num = $(".numBox").val();
		   var minusNum = Number(num) - 1;
		   
		   if(minusNum <= 0) {
		    $(".numBox").val(num);
		   } else {
		    $(".numBox").val(minusNum);          
		   }
		  });
		*/
	
		</script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

</body>

</html>