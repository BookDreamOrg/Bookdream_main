<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Favicon -->
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="/resources/images/favicon/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="/resources/images/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/resources/images/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <link rel="stylesheet" href="/resources/css/admin_screen.css" />
    
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS  -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">
<link rel="stylesheet" type="text/css" href="/resources/css/order_mngmn.css">
 
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />      
      
<title>주문 관리</title>

<style type="text/css">

/* 기간검색 */
.daterangepicker {
  color: black;
}

</style>


</head>
<body class="admin_body">

	<jsp:include page="/views/inc/admin_aside.jsp"/>
	<main class="container-fluid main_container">
	<section class="mb-3 mt-3">
      <div class="h3 mb-3" id="admin_section_title">주문현황</div>
      <hr>
    </section>
	<div class="container" >
		
		<div class="test">
			<div class="btn-group " role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check " name="orderclsfc_btn" id="all" value="100" autocomplete="off" >
			  <label class="btn btn-outline-primary orderclsfc_btn" for="all">전체</label>
			
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="pymntCmplt" value="0" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="pymntCmplt">결제완료</label>
			
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="delivery" value="1" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="delivery">배송중</label>
			  
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="cmpltDlvry" value="2" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="cmpltDlvry">배송완료</label>
			  
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="test" value="3" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="test">구매확정</label>
			  
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="pymcnRqst" value="10" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="pymcnRqst">결제취소요청</label>
	
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="cnclPymnt" value="11" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="cnclPymnt">결제취소</label>
			  			  
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="rqstRtrn" value="12" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="rqstRtrn">반품요청</label>
			  
			  <input type="radio" class="btn-check" name="orderclsfc_btn" id="cmpltRtrn" value="13" autocomplete="off">
			  <label class="btn btn-outline-primary orderclsfc_btn" for="cmpltRtrn">반품완료</label>
			</div>
		</div>
		<br>

			<div style="text-align: right; width: 1240px; height:30px; margin: auto;">
				<button class="btn btn-outline-secondary reset_btn" id="reset_btn">
				<i class="fas fa-undo"></i></button>

				<!-- 달력 -->
				<div class="srch_date" id="reportrange">
					<i class="fa fa-calendar" style="float: left;"></i>&nbsp;
					<span id="scrh_date"></span> <i class="fa fa-caret-down" style="float: right;"></i>
				</div>
			</div>
					
		<div class="btn_box">
							
			<div class="paging" id="paging"></div>
												
			<div class="right">

	
			
				<select class="form-select srch_crtr" id="srch_crtr" aria-label="Default select example">
				  <option selected value="all">전체</option>
				  <option value="order_no">주문번호</option>
				  <option value="user_id">아이디</option>
				  <option value="order_name">주문명</option>
				  <option value="pay_method">결제수단</option>
				</select>
				
				
				<input class="form-control srch_key" id="srch_key" type="search" placeholder="Search..." aria-label="Search">
		        <button class="btn btn-primary srch_btn" id="srch_btn" type="button"><i class="bi bi-search"></i></button>
	        </div>
		</div>
				
		<div class="order_mngmn" id="order_mngmn"></div>
		
		<div class="dtls-box" id="dtls-box">
			<div class="info-box" id="info-box"></div>


			<div class="dummy">
				<div class="table-box-wrap" id="table-box-wrap">
					<div class="table-box" id="table-box"></div>
				</div>
			</div>
			
			<div class="dlvy-box" id="dlvy-box"></div>

		</div>

		
		
	</div>		
	
	<input id="load_status" type="hidden" value="${status}">
	</main>



	<script type="text/javascript" src="/resources/js/order_mngmn.js"></script>




	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>
		
	<!-- 달력 -->	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

			
</body>
</html>