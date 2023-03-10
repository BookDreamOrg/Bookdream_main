<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Bootstrap 5.0.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<head>
<meta charset="UTF-8">
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/admin_screen.css" />
<title>Admin Page</title>
</head>
<body class="admin_body">
	<jsp:include page="/views/inc/admin_aside.jsp" />
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
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a></li>
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
	<div class="section_div">
		<section class="today_state">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">오늘의 할일</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
		<section class="todo_list">
			<div class="card">
				<div class="card-header">도서 일일 판매량(주간)</div>
				<div class="card-body">
					<div class="container">
						<canvas id="Book_Order_qty_chart" style="width: 35em;"></canvas>
					</div>
				</div>
			</div>
		</section>
		<section class="calandar">
			<div class="card">
				<div class="card-header">유저 정보</div>
				<div class="card-body">
					<div class="container">
						<canvas id="visitChart" width="35em">
					</canvas>
					</div>
				</div>
			</div>
		</section>
		<section class="qna">
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
		<section class="content_review">
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
	</div>
	</main>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>

	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<!-- J쿼리 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- JavaScript  -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		$(document).ready(function() {
			getVisitGraph();
		})
		
		const visit_ctx = document.getElementById('visitChart');
		
		function getVisitGraph(){
			var visitCountList = [];
			
			$.ajax({
				url : "${cpath}/countVisit.do",
				type : "GET",
				dataType: "JSON",
				success : function(data) {
					visitCountList = Object.values(data[0]).reverse();
					new Chart(visit_ctx, {
						type : 'line',
						data : {
							datasets : [ {
								label : '방문자 수',
								data : visitCountList,
							} ],
							labels : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ]
						},
						options: {
						      scales: {
						        y: {
						          beginAtZero: true
						        }
						      }
						    }
					});
				},
				error : function() {
					alert("Graph Fail");
				}
			})
		}
	</script>
</body>
</html>