<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.left {
	float: left;
}

.side {
	position: relative;
	width: 220px;
	min-height: 500px;
	padding: 30px 30px;	
	margin-top: 130px;
	border-radius: 20px;
	background-color: #fafafa;
	text-align: center;

}

.side_ul {
	text-align: left;
}

.side_text_center {
	text-align: center;
}

.side_text_title {
	margin-top: 30px;
	
	color: #5c5d99;
	font-size: 12px;
	font-weight: 900;
}

.side_text_content {
	font-size: 16px;
	margin: 10px 0px;
}

.side_btn {
	width: 100%;
	height: 100px;
	margin-bottom: 20px;
}

.side_icon {
	margin-top: 15px;
	color: #e0e0ee;
}

.user_btn_border {
	width: 100px;
	height: 100px;
	margin-left:30px;
	border-radius: 50%;
	background-color: white;
}

/*   */
.rcmnd_book_title {
    height: 50px;
    line-height: 70px;
	margin-top: 30px;    
    font-size: 14px;
    font-weight: bold;	
}

.recmnd_carousel {
	width: 220px;
	height: 200px;
	text-align: center;	
}

.recmnd_carousel_img {
	width: 150px;
	height: 200px;

}

.qnanew-icon{
	width: 10px;
	height: 10px;
	display: none;
}
</style>

</head>
<body>

	<div class="left">
		<div class="side">
		
			<div class="side_btn"><div class="user_btn_border"><i class="fa-solid fa-user fa-4x side_icon"></i></div></div>
			
			<ul class="side_ul">
				<li class="side_text_center"><div><a href="/mypage/main">${authUser.getUser_name() }</a>님 환영합니다</div></li>
				<li class="side_text_title">나의 정보</li>
				<li class="side_text_content"><h1><a href="/mypage/edit">회원정보 관리</a></h1></li>
				<li class=side_text_content><h1><a href="">내가 작성한 리뷰</a></h1></li>
				<li class="side_text_title">주문 정보</li>
				<li class="side_text_content" style=""><div><a href="/mypage/address">배송지 관리</a></div></li>
				<li class="side_text_content"><div><a href="/mypage/tracking">구매내역 / 배송조회</a></div></li>
				<li class="side_text_title">문의</li>
				<li class="side_text_content">
					<div>
						<a href="/mypage/getMyQnAList">1:1 문의</a> 
						<img src="/resources/images/new-icon5.svg" class="qnanew-icon" id="qnanew-icon">
						<input type="hidden" id="answerCnt" value="${answerCnt }">
					</div>
				</li>
			</ul>

		</div>
		
		<div class="side_rcmnd_book">
			<div class="rcmnd_book_title">맞춤도서</div>
			<hr>
					<div id="carouselExampleDark" class="carousel carousel-dark slide recmnd_carousel" data-bs-ride="carousel">
					  
					  <div class="carousel-inner" id="carousel-inner">

					  </div>
					  
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>			
		</div>




	</div>		
		
	<script type="text/javascript" src="/resources/js/mypage_side.js"></script>
			
	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>


				
</body>
</html>