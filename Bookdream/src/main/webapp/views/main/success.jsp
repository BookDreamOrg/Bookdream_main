<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<title>주문완료 페이지</title>



<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/success.css">


</head>

<body>

	<jsp:include page="/views/inc/header.jsp" />
	<div class="container">
		<div class="main">
		
			<div class="topbar">
				 <div>
				 	<span class="topbar_title">주문&nbsp;완료</span>
				 </div>
			</div>
			
			<div class="center">
				<div class="center_info">
					<i class="bi bi-check2-circle">&nbsp;주문이 완료 되었습니다.</i>
				</div>	
				<hr>
				<br>
					<table class="center_table">
						<tr >
							<th class="center_table_th">주문 번호</th>
							<td class="center_table_td">${payData.pay_no}</td>							
						</tr>	
						
						<tr>
							<th class="center_table_th col2">배송지 정보</th>
							<td class="center_table_td">${order.order_receiver}<br>${order.order_tel}<br>${order.order_address}</td>
						</tr>
						
						<tr>
							<th class="center_table_th">포인트 적립</th>
							<td class="center_table_td"><fmt:formatNumber value="${order.save_point}" pattern="###,###"/>P</td>							
						</tr>						
												
						<tr>
							<th class="center_table_th col4">결제 정보</th>
							<td class="center_table_td">결제방법 : ${order.pay_method}<br>결제시간 : ${payData.pay_date}</td>							
						</tr>

														
					</table>						
	
			</div>

			<div class="sidebar">
				<div class="sidebar_item">
						<div class="sidebar_item_title_down" id="sidebar_item_title_down">주문상세열기&nbsp;<i class="bi bi-caret-down-fill" ></i></div>
						<div class="sidebar_item_title_up" id="sidebar_item_title_up">주문상세닫기&nbsp;<i class="bi bi-caret-up-fill" ></i></div>
					<hr>
					<div class="sidebar_item_icon" id="sidebar_item_icon"><i class="bi bi-question"></i></div>
					<table class="sidebar_item_table" id="sidebar_item_table">
						<c:forEach items="${purchase}" var="pur" varStatus="i">
						
							<tr>
								<td class="sidebar_item_table_td col1" rowspan="3"><img class="sidebar_item_table_td_img" alt="" src="${pur.bookVO.book_img}"></td>
								<td class="sidebar_item_table_td col2" >${pur.bookVO.title}</td>
							</tr>


							<tr>
								<td class="sidebar_item_table_td" ><fmt:formatNumber value="${pur.bookVO.book_price}" pattern="###,###"/>원</td>							
							</tr>

							<tr>
								<td class="sidebar_item_table_td" >${pur.product_count}개</td>
							</tr>
					
						</c:forEach>	
												
					</table>
				</div>
				<hr>
				<div class="sidebar_pay">
					<div class="sidebar_pay_main">결제금액<span class="sidebar_pay_right"><b><fmt:formatNumber value="${order.final_price}" pattern="###,###"/></b>&nbsp;원</span></div>
					<div class="sidebar_pay_left">ㄴ 상품금액<span class="sidebar_pay_right"><fmt:formatNumber value="${order.total_price}" pattern="###,###"/>&nbsp;원</span></div>
					<div class="sidebar_pay_left">ㄴ 배송비<span class="sidebar_pay_right">(+)&nbsp;<fmt:formatNumber value="${order.pay_fee}" pattern="###,###"/>&nbsp;원</span></div>
					<div class="sidebar_pay_left">ㄴ 할인금액<span class="sidebar_pay_right">(-)&nbsp;<fmt:formatNumber value="${order.discount_price}" pattern="###,###"/>&nbsp;원</span></div>					
					<div class="sidebar_pay_left">ㄴ 포인트사용<span class="sidebar_pay_right">(-)&nbsp;<fmt:formatNumber value="${order.use_point}" pattern="###,###"/>&nbsp;원</span></div>
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
	
	<script type="text/javascript">
	
	$("#sidebar_item_title_down").click(function() {
		$('#sidebar_item_table').fadeIn();
		$('#sidebar_item_title_up').show();		
		$('#sidebar_item_title_down').hide();
		$('#sidebar_item_icon').hide();		

	
	})
	
	$("#sidebar_item_title_up").click(function() {
		$('#sidebar_item_table').hide();
		$('#sidebar_item_title_up').hide();
		$('#sidebar_item_title_down').show();
		$('#sidebar_item_icon').show();
	
	})	
	
	</script>
	
	

</body>
</html>