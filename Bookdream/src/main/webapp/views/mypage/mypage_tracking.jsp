	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
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

<title>마이페이지 - 배송조회</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage_tracking.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />     

</head>
<body>

 <div class="wrapper">
 
	<jsp:include page="/views/inc/header.jsp" />	
		
	<div class="main">
	
		<jsp:include page="/views/inc/mypage_side.jsp" />	
	
		<div class="main_tracking">
			
			<div class="tracking">

				<div class="tracking_history">
					<div class="tracking_title">
						주문 / 배송 목록 
						<span class="order_search_title">최근 1개월 주문내역 입니다.
							<button type="button" class="btn btn-outline-secondary order_search_btn" id="order_search_btn">
							<i class="bi bi-calendar"></i> 상세조회</button>
						</span>
					</div>
	

					<!-- 오프캔버스.... 뭐가좋을려나.. -->
					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header">
					    <h5 class="offcanvas-title" id="offcanvasRightLabel">상세조회</h5>
					    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  </div>
					  <div class="offcanvas-body">
					  		<div class="offcanvas_text">
					   			조회기간 설정은 6개월 단위이며, 주문정보 조회는 5년까지 가능합니다.
								필터 이용 시 선택한 주문정보만 조회 가능합니다.					  	
					  		</div>
			
							<div>검색기간</div>
							<div class="srch_date" id="reportrange">
								<i class="fa fa-calendar" style="float: left; margin: 9.5px 0px 0px 10px"></i>&nbsp;
								<span id="scrh_date"></span> <i class="fa fa-caret-down" style="float: right; margin: 9.5px 10px 0px 0px;"></i>
							</div>
							
							<div>
								<label class="form-check-label order_status_select_label" for="order_status_select_btn">주문배송 상태</label>
									<select class="form-select order_status_select" aria-label="Default select example" id="order_status_select_btn">
									  <option selected value="100">전체</option>
									  <option value="0">결제완료</option>
									  <option value="1">배송중</option>
									  <option value="2">배송완료</option>
									  <option value="3">구매확정</option>
									  <option value="10">결제취소중</option>
									  <option value="11">결제취소</option>
									  <option value="12">반품요청중</option>
									  <option value="13">반품완료</option>
									</select>

							</div>							
							
							<div>
								<button type="button" class="btn btn-outline-secondary order_search_reset_btn" id="order_search_reset_btn">초기화</button>							
								<button type="button" class="btn btn-primary order_search_view_btn" id="order_search_view_btn">적용</button>
							</div>
							
					  </div>
					</div>
							
					<table class="tracking_main_table">
						<tr>
							<td class="tracking_main_table_col1">주문내역</td>
							<td class="tracking_main_table_col2"><span class="order_count" id="order_count0">0</span><br><p class="">결제완료</p></td>
							<td class="tracking_main_table_col3"><span class="order_count" id="order_count1">0</span><br><p class="">배송중</p></td>
							<td class="tracking_main_table_col4"><span class="order_count" id="order_count2">0</span><br><p class="">배송완료</p></td>
							<td class="tracking_main_table_col5"><span class="order_count" id="order_count10">0</span><br><p>반품/취소</p></td>
						</tr>
					</table>
					</div>
				</div>	
					
				<!-- 페이징 -->
				<div style="height: 30px;">
					<div id="paging" style="display: inline-block;"></div>					
					<div style="display: inline-block;  float:right; ">
						<div id="cnt" style="font-size: 24px; font-weight: bold; padding-right: 20px;"></div>
					</div>
				</div>
				
				<!-- 주문목록 -->	
				<div class="trackinglist" id="trackinglist">

					<div class="text-center" style="margin-top: 100px">
					  <div class="spinner-border text-secondary"  style="width: 3rem; height: 3rem;" role="status">
					    <span class="visually-hidden">Loading...</span>
					  </div>
					</div>

			</div>


				
			<!-- ****************************** 페이징 처리 ****************************** 

			<div class="text-center">
				<ul class="pagination justify-content-center">
				
					<c:if test="${pageMaker.prev}">
						<li class="page-item paginate_button previous">
							<a class="page-link" href="tracking?p=${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
										
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
					
						<c:set var="active" value="${pageMaker.cri.pageNum == num ? 'active' : ''}" />
						
							<li class="page-item paginate_button ${active}" >								
							<a class="page-link" href="tracking?p=${num}" >${num}</a>
							</li>

					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="page-item paginate_button next">
							<a class="page-link" href="tracking?p=${pageMaker.endPage +1 }">Next</a>
						</li>
					</c:if>
					
				</ul>
			</div>
			
			-->
		
		</div>	

<!----------------------------------------- 상세조회 모달 -------------------------------------->
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
	
	<!-- 아래 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 	<!-- 달력 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> 	
	   
   <script>
   		let user_no = <%= (int)session.getAttribute("user_no") %>;
   		<%@include file="/resources/js/cartLIstCount.js"%>
   </script>
 	
 

</body>
</html>