<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

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
    
<title>Admin Page</title>

<style type="text/css">

.shadow-sm {
	background-color: white;
}

.center {
	text-align: center;
	display: inline-block;	
}

.test {
	position: relative;
	width: 610px;
	height: 500px;
	display: inline-block;
	padding: 30px;
	text-align: left;	
}

.myChart {
	display: inline-block;
}

.chartbox_card {

	height: 100px;
}


.chartbox_chart {

	margin-top: 50px;

}

.chart_btn {
	width: 50px;
	height: 30px;
	font-size: 12px;
}

.pay_radio {
	position: absolute;
	top: 140px;
	left: 475px;
}


.buttom {
	width: 1240px;
	height: 300px;
	margin: 0 auto;	
	padding: 0px 30px ;
}

.today_box {
	text-align: left;
}

.today_box_body {
	margin: 10px 0px;
	height: 200px;

}

.work_table {
	width: 1180px;
	border: 1px solid #dee2e6;
}

th {
	height: 50px;
	font-weight: bold;
	vertical-align: middle;
	text-align: center;
	border-bottom: 1px solid #dee2e6;
	background-color: #f7f7f7;
	font-size: 14px;
}

td {
	height: 50px;
	vertical-align: middle;
	text-align: center;
	font-size: 12px;	
	width: 110px;
}

.work_table_col3 {
	width: 520px;
}

.work_table_col6 {
	font-weight: bold;
}

.work_table_col7 {
	padding: 0px 0px 0px 42px;
}
</style>






<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

</head>
<body class="admin_body">


	<div class="aside row">
		<div class="aside_logo">
			<img src="/resources/images/logo/logo_text--white.png"
				alt="BookDream" class="aside_logo_img" />
		</div>
		<div class="aside_profile">
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<img src="/resources/images/logo/logo_white.png"
							alt="user_profile" class="user_profile" />
					</div> <span class="list_text">관리자</span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user"></i></span> <span class="list_text">프로필
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-arrow-up-right-from-square"></i></span> <span
					class="list_text">사이트 바로가기</span></li>
			</ul>
		</div>
		<div class="aside_product">
			<div class="aside_product_title">제품관리</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_product_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-border-all"></i></span> <span class="list_text">대시보드</span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user-gear"></i></span> <span class="list_text">사용자
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-pen-to-square"></i></span> <span class="list_text">콘텐츠
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bullhorn"></i></span> <span class="list_text">마케팅
						관리</span></li>
			</ul>
		</div>
		<div class="aside_resource">
			<div class="aside_resource_title">고객지원</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_resource_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bug"></i></span> <span class="list_text">버그 및
						신고</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-comment"></i></span> <span class="list_text">문의사항</span>
				</li>
			</ul>
		</div>
		<!-- <div class="thema">
        <div class="thema_color"></div>
        <div class="thema_color_btn">테마변경</div>
      </div> -->
	</div>
	<main class="container-fluid main_container"> <header
		class="shadow-sm">
		<nav class="navbar navbar-expand-xl navbar-light bg-white">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo2"
					aria-controls="navbarTogglerDemo2" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse show" id="navbarTogglerDemo2">
					<ul class="navbar-nav me-auto mb-2 mb-xl-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/views/main/main.jsp">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a>
						</li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success" type="submit">
							Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	
	
	<div class="container">
		
	<div class="center">
		<div class="test left">
			<div class="card chartbox_card">
			  <div class="card-header">
			   주문 현황
			  </div>
			  <div class="card-body" id="card-body">

			  </div>
			</div>
						
			<div class="chartbox">
				<!--   차트를 그릴 영역으로 canvas태그를 사용한다. -->
				<div class="chartbox_chart">
					<div class="btn-group pay_radio" role="group" aria-label="radio toggle button group">
					  <input type="radio" class="btn-check" name="order_radio" id="wek_chart_btn" autocomplete="off" checked>
					  <label class="btn btn-outline-secondary chart_btn" for="wek_chart_btn">주간</label>
					  <input type="radio" class="btn-check" name="order_radio" id="mly_chart_btn" autocomplete="off">
					  <label class="btn btn-outline-secondary chart_btn" for="mly_chart_btn">월간</label>
					</div>				
				</div>
			</div>
			<canvas class="myChart" id="orderChart"></canvas>
		</div>
	
		<div class="test right">
			<div class="card chartbox_card">
			  <div class="card-header">
			    결제 현황
			  </div>
			  <div class="card-body">
			    <p class="card-text"><span id="amount"></span></p>
			  </div>
			</div>
			
			<div class="chartbox">
			
				<!--   차트를 그릴 영역으로 canvas태그를 사용한다. -->					
				<div class="chartbox_chart">
					<div class="btn-group pay_radio" role="group" aria-label="radio toggle button group">
					  <input type="radio" class="btn-check" name="pay_radio" id="wek_paychart_btn" autocomplete="off" checked>
					  <label class="btn btn-outline-secondary chart_btn" for="wek_paychart_btn">주간</label>
					  <input type="radio" class="btn-check" name="pay_radio" id="mly_paychart_btn" autocomplete="off">
					  <label class="btn btn-outline-secondary chart_btn" for="mly_paychart_btn">월간</label>
					</div>					
					<canvas class="myChart" id="myChart"></canvas>
				</div>	
			</div>			
		</div>
						
	</div>
		<div class="center">
			<div class="buttom">
				<div class="card">
				  <div class="card-header today_box">
				   	금주 취소 / 반품 처리 	
				  </div>
				</div>
				
				<div class="today_box_body" id="today_box_body"></div>	
				<span class="paging" id="paging"></span>							
			</div>
		</div>
	</div>		
	</main>


	<script type="text/javascript" src="/resources/js/order_dshbr.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
			
</body>
</html>