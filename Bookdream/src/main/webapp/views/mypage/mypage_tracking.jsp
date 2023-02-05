<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
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

<title>마이페이지 - 배송조회</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage_tracking.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<jsp:include page="/views/inc/header.jsp" />	
		
	<div class="main">
		<div class="side"></div>
	
		<div class="main_tracking">
			
			<div class="tracking">

				<div class="tracking_main">
					<div class="tracking_title">주문 / 배송 목록</div>
					<table class="tracking_main_table">
						<tr>
							<td class="tracking_main_table_col1">주문내역</td>
							<td class="tracking_main_table_col2">결제완료<br><span id="tracking_main_table_col2"></span></td>
							<td class="tracking_main_table_col3">배송중<br><span id="tracking_main_table_col3"></span></td>
							<td class="tracking_main_table_col4">배송완료<br><span id="tracking_main_table_col4"></span></td>
							<td class="tracking_main_table_col5">반품/취소<br><span id="tracking_main_table_col5"></span></td>
						</tr>
					</table>
				</div>
			</div>
			<hr class="trackinglist_table_hr">


			
			<div class="trackinglist" id="trackinglist">

			</div>
					
		</div>	




 
<!----------------------------------------- 결제취소 -------------------------------------->
	<div class="modal fade" id="pay_cencel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cencel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">결제 취소</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					결제취소를 하시겠습니까?
      			</div>
      			<input type="hidden" id="pay_cencel_order_no">
      			<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_pay_cencel">결제취소</button>         			
    		</div>
  		</div>
	</div>

<!----------------------------------------- 반품요청 -------------------------------------->
	<div class="modal fade" id="return_reqeust" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cencel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">반품 요청</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					반품요청을 하시겠습니까?
      			</div>
      			<input type="hidden" id="return_request_order_no">
      			<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_return_request">반품신청</button>         			
    		</div>
  		</div>
	</div>


<!----------------------------------------- Modal -------------------------------------->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
   			<div class="modal-content tracking_detail">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">	상세 조회</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body" id="tracking_detail_list">
 					
      			</div>

    		</div>
  		</div>
	</div>
	
	</div>
			
	<jsp:include page="/views/inc/footer.jsp" />
	</div>
	
	<script type="text/javascript" src="/resources/js/mypage_tracking.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>	


</body>
</html>