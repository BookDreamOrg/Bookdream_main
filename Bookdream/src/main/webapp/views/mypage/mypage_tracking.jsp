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
			
							<div>
								<label class="form-check-label order_search_select_label" for="order_search_select_btn">기간조회</label>
								<select class="form-select order_search_select" aria-label="Default select example" id="order_search_select_btn">
								  <option selected value="30">최근 1개월</option>
								  <option value="60">최근 2개월</option>
								  <option value="90">최근 3개월</option>
								  <option value="180">최근 6개월</option>
								</select>

							</div>
							
							<div>
								<label class="form-check-label order_status_select_label" for="order_status_select_btn">주문배송 상태</label>
									<select class="form-select order_status_select" aria-label="Default select example" id="order_status_select_btn">
									  <option selected value="100">전체</option>
									  <option value="0">결제완료</option>
									  <option value="1">배송중</option>
									  <option value="2">배송완료</option>
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
					

						
				<div class="trackinglist" id="trackinglist">

					<div class="text-center" style="margin-top: 100px">
					  <div class="spinner-border text-secondary"  style="width: 3rem; height: 3rem;" role="status">
					    <span class="visually-hidden">Loading...</span>
					  </div>
					</div>


				<!--  	
					<c:forEach items="${orderlist}" var="order" varStatus="i">
					 
						<table class="trackinglist_table">
						
							<tr>
								<th class="trackinglist_table_th1" colspan="3">
									<span class="trackinglist_table_title">
									<fmt:formatDate value="${order.order_date}" pattern="YY. MM. dd / HH:mm"/> (${order.order_no})</span>
									<br>
									<button type="button" class="btn btn-link trackinglist_table_detail_btn" 
											data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.order_no}">
											상세 조회<i class="bi bi-chevron-right"></i>
									</button>
								</th>	
								
								<th class="trackinglist_table_th2" >
									
								<c:choose>
									<c:when test="${order.order_status == 0}">
										<button type="button" class="btn btn-primary pay_cancel cancel_btn" 
										 		data-bs-toggle="modal" data-bs-target="#pay_cancel" 
										 		value="${order.order_no}">결제취소</button>									
									</c:when>
									
									<c:when test="${order.order_status == 2}">
										<button type="button" class="btn btn-primary return_request cancel_btn" 
												data-bs-toggle="modal" data-bs-target="#return_reqeust" 
												value="${order.order_no}">반품신청</button>									
									</c:when>								
									
									<c:otherwise>
									</c:otherwise>
								</c:choose>
	
								</th>
							</tr>	
									
							<tr>
								<td class="trackinglist_table_col1">
									<img class="trackinglist_table_img" alt="img" src="${order.bookVO.book_img}">
								</td>						
								<td class="trackinglist_table_col2">${order.order_name}</td>						
								<td class="trackinglist_table_col3">
									<fmt:formatNumber value="${order.payVO.final_price}" pattern="###,###"/> 원
								</td>						
						
								<c:if test="${order.order_status == 0}">
								<c:set value="결제 완료" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}">
										${status}
									</td>													
								</c:if>
								
								<c:if test="${order.order_status == 1}">
								<c:set value="배송 중" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}">
									
										${status}
									</td>													
								</c:if>
								
								<c:if test="${order.order_status == 2}">
								<c:set value="배송 완료" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}">
										${status}
									</td>
								</c:if>
								
								<c:if test="${order.order_status == 10}">
								<c:set value="결제 취소" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}" style="color: red">							
	
										${status}
									</td>													
								</c:if>
	
								<c:if test="${order.order_status == 11}">
								<c:set value="반품 신청 중" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}" style="color: blue">							
	
										${status}
									</td>													
								</c:if>
								
								<c:if test="${order.order_status == 12}">
								<c:set value="반품 완료" var="status"/>
									<td class="trackinglist_table_col4" id="order_status_text${order.order_no}" style="color: blue">	
										${status}
									</td>													
								</c:if>
	
							</tr>
							
						</table>
				</c:forEach>
			-->				
									

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




 
<!----------------------------------------- 결제취소 -------------------------------------->
	<div class="modal fade" id="pay_cancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cancel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">결제 취소</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					결제취소를 하시겠습니까?
      			</div>
      			
      			<div class="modal-footer">
  					<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_pay_cancel">결제취소</button>         			
      			</div>			
    		</div>
  		</div>
	</div>

<!----------------------------------------- 반품요청 -------------------------------------->
	<div class="modal fade" id="return_reqeust" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cancel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">반품 요청</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					반품요청을 하시겠습니까?
      			</div>
      			
      			<div class="modal-footer">
      				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_return_request">반품신청</button>         			
    			</div>
    		</div>
  		</div>
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
   
   <script>
   		let user_no = <%= (int)session.getAttribute("user_no") %>;
   		<%@include file="/resources/js/cartLIstCount.js"%>
   </script>

</body>
</html>