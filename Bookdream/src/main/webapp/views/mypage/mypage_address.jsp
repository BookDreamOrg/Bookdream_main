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

<title>마이페이지 - 주소록</title>

<!-- 주소찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!--  CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage_address.css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	
	<jsp:include page="/views/inc/header.jsp" />	
	<div class="main">
		<div class="side"></div>
	
		<div class="main_address">
			
			<div class="address">
				<div class="address_title">배송주소록</div>
				<div class="address_main" id="address_main"></div>
				<div class="address_sub">기본배송지 기준으로 배송일자가 안내됩니다.<br>기본 배송지는 삭제 불가합니다.</div>
			</div>

			<div class="addresslist">
				<span class="addresslist_title" id="addresslist_title"></span><span>&nbsp;개</span>
				<button type="button" class="btn btn-outline-secondary addresslist_button" id="modal_open" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-plus"> 배송지 입력</i></button>
				<hr>
				<div class="addresslist_main" id="addresslist_main"></div>
			</div>
						
			<div class="address_change">
				<button class="btn btn-primary address_change_button" id="address_change_button" >기본 배송지 설정</button>
			</div>
					
		</div>	
	</div>
	
	
	<!----------------------------------------- Modal -------------------------------------->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog  modal-dialog-centered">
   			<div class="modal-content address_insert_content" id="modal-backdrop">
      			<div class="modal-header">
       		 		<h4 class="modal-title" id="exampleModalLabel">배송지 입력하기</h4>
       		 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					<div class="mb-3">
  						<label for="address_alias" class="form-label">배송지 이름</label>
  						<input class="form-control address_input" id="address_alias" name="address_alias" placeholder="배송지 이름을 입력해주세요.">
					</div>		

					<div class="mb-3">
  						<label for="address_name" class="form-label">받는 사람</label>
  						<input class="form-control address_input" id="address_name" name="address_name" placeholder="이름을 입력해주세요.">
  						<input class="form-control address_input" id="address_tel" name="address_tel" placeholder="휴대번호를 -없이 입력해주세요.">
					</div>				
					

					<div class="d-grid gap-2 address_search"></div>

					<div class="mb-3">
					  	<label class="form-label">주소<button class="btn btn-outline-secondary address_search_button" onclick="execDaumPostcode()"><i class="bi bi-search"></i>&nbsp;&nbsp;주소찾기</button></label>
  						<input class="form-control address_input" id="zonecode" name="address_zonecode" placeholder="우편번호" readonly>
  						<input class="form-control address_input" id="roadAddr" name="address_roadAddr" placeholder="도로명주소" readonly>
  						<span  id="guide" style="color: #999; display: none"></span>
  						<input class="form-control address_input" id="detailAddress" name="address_detailAddress" placeholder="상세주소" >
						<input type="hidden" id="extraAddress" placeholder="참고항목" readonly="readonly">			
						<input type="hidden" id="address_no" name="address_no">	
					</div> 
					
					<div class="form-check">
  						<input class="form-check-input" type="checkbox" id="default_address_check">
  						<label class="form-check-label" for="default_address_check">기본 배송지로 설정</label>
					</div>					
					     
      			</div>



     		    <div class="d-grid gap-2 address_save">
					<button class="btn btn-primary" data-bs-dismiss="modal" id="modal_address_insert">저장</button>
					<button class="btn btn-primary" data-bs-dismiss="modal" id="modal_address_update">수정</button>				
				</div>	
     		    
     		    
    		</div>
  		</div>
	</div>
	
		
	<jsp:include page="/views/inc/footer.jsp" />
	</div>
	
	
	<script type="text/javascript" src="/resources/js/mypage_address.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>	

	




</body>
</html>