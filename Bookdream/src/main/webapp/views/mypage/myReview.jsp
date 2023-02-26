<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<!-- 별점 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.6/css/star-rating.min.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
  
<title>마이페이지 - 메인</title>

<style>


.wrapper {
	height: auto;
}

.main {
	line-height: 180%;
	position: relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;

	min-height: 1000px;
}

.myReview {
	height: auto;
	min-height: 1200px;
	padding: 0px 40px;	
	float: right;
}

.myReview_info {
	position: relative;
	width: 870px;
	height: auto;
	min-height: 300px;
}

.myReview_info_title {
    padding: 30px 0px;
    vertical-align: middle;
    height: 100px;
	margin-top: 30px;    
	padding-left: 30px;
    font-size: 20px;
    font-weight: bold;
}

.myReview_info_box {
	height:auto;
	min-height: 160px;
	border-radius: 20px;
	padding: 40px 40px 40px 40px;
	background-color: #f7f7f7;	
}
/* 현황 Table */
.myReview_info_table {
	width: 100%;
}

.myReview_info_table th {
	width: 263px;
	height: 40px;
	font-weight: bold;
	padding-left: 60px;
	vertical-align: middle;	
}

.myReview_info_table td:nth-child(1), 
.myReview_info_table td:nth-child(2) {
	width: 263px;
	height: 40px;
	font-size: 24px;
	color: #5c5d99;
	padding-left: 60px;
	font-weight: 600;
	vertical-align: middle;
}

.myReview_info_table td:nth-child(3) {
	vertical-align: middle;	
	padding-left: 60px;
}

/* 별점 */
.stars-inner {
    position: absolute;
    display: inline-block;
    top: 0;
    left: 0;
    white-space: nowrap;
    overflow: hidden;
    width: 0;
}

.star-outer {
    position: relative;
    display: inline-block;
}

.star-outer::before {
    content: "\f005 \f005 \f005 \f005 \f005";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    color: #ccc;
}

.stars-inner::before {
    content: "\f005 \f005 \f005 \f005 \f005";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
	color: #5c5d99;
	/* color: #5c5d99; */
}

/* 프로그래스 바,, (안쓸듯) 
.progress-container {
  height: 100px;
  width: 10px;
  background-color: #ccc;
  border-radius: 10px;
  margin: 10px;
  display: flex;
  justify-content: center;
  align-items: flex-end;
}

.progress-bar {
  height: 30%;
  width: 100%;
  background-color: #5c5d99;
  border-radius: 10px;
  transition: height 0.5s;
}
*/

/* */
.reviewlist {
	height: auto;
	min-height: 100px;
	margin-top: 50px;	
}

.reviewlist_table {
	width: 100%;
	margin-bottom: 50px;
	border-top: 2px dotted #DFDFDF;	
	border-bottom: 2px dotted #DFDFDF;		
}

.reviewlist_table th, td{
	vertical-align: middle;
	font-size: 14px;	
	padding: 0px 10px;	

}

.reviewlist_table tr:nth-child(1) th {
	height: 40px;
}

.reviewlist_table tr:nth-child(1) td {
	width: 100px;
	height: 100px;
	text-align: center;	
	border-bottom: 1px dotted #DFDFDF;	
}

.reviewlist_table tr:nth-child(2) td {
	height: 40px;
	width: 240px;
	border-bottom: 1px dotted #DFDFDF;
}

.reviewlist_table tr:nth-child(3) td:nth-child(1) {	
	width: 800px;
	height: 150px;
	padding: 0px 25px;
}

.reviewlist_table tr:nth-child(3) td:nth-child(2) {
	width: 70px;
	text-align: center;	

}

/* */
.paging {
	margin: 30px 0px;
}

.paging_btn {
	height: 30px;
	font-size: 12px;
	line-height: 12px;
}
</style>


</head>
<body>


	<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />
		
		<div class="main">

		<jsp:include page="/views/inc/mypage_side.jsp" />		

			<div class="myReview">
				<div class="myReview_info">
					<div class="myReview_info_title">내가 작성한 리뷰</div>
					
					<div class="myReview_info_box">
					
					<!------------------------ 별점  ------------------------>
						<table class="myReview_info_table">
							<tr>
								<th>작성한 리뷰 수</th>
								<th>받은 추천 수</th>
								<th>평균 별점</th>
							</tr>
							<tr>
								<td id="review_cnt">0</td>
								<td id="review_rcmnd">0</td>
								<td>					
									<div class="star-outer" style="font-size: 20px;" >
										<div class="stars-inner" id="stars-inner"></div>
									</div>
									<span id="number-rating" style="font-size: 12px;"></span>	
								</td>
							</tr>
							
						</table>				
					</div>
						
					<div class="paging" id="paging"></div> 	
						
					<div class="reviewlist" id="reviewlist" >
				

				
				
					</div>	
					
					
					<!--  		
					<div class="progress-container">
					  <div class="progress-bar" ></div>

					</div>														
					-->
				</div>				
			</div>			
		</div>					
	</div>
		

	<jsp:include page="/views/inc/footer.jsp" />

	<script type="text/javascript" src="/resources/js/mypage_review.js"></script>
	


	<script>
		let user_no = <%=(int) session.getAttribute("user_no")%>;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.6/js/star-rating.min.js"></script>

	
	
			
</body>
</html>