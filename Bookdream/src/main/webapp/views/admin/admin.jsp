<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Bootstrap 5.0.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<head>
<meta charset="UTF-8">
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

<title>Admin Page</title>

<style type="text/css">

.biv_box {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 300px; /* 부모 요소의 높이 값 */
}

.biv_box > div {
  	width: 100%;
  	height: 33%; 
  	margin: 10px; 
  	font-size: 12px;
 
	display: flex;
	flex-direction: column;
	justify-content: center;	  
	cursor: pointer;
}

.biv_box > div:nth-child(1) {
	border-left: 5px solid #36A2EB;
	background-color: rgba(54, 162, 235, 0.1);
}

.biv_box > div:nth-child(1):hover {
    background-color: rgba(54, 162, 235, 0.2);
}

.biv_box > div:nth-child(2) {
	border-left: 5px solid #FF6384;
	background-color: rgba(255, 99, 132, 0.1);
}

.biv_box > div:nth-child(2):hover {
    background-color: rgba(255, 99, 132, 0.2);
}

.biv_box > div:nth-child(3) {
	border-left: 5px solid #4BC0C0;
	background-color: rgba(75, 192, 192, 0.1);
}

.biv_box > div:nth-child(3):hover {
    background-color: rgba(75, 192, 192, 0.2);
}

.dshbr_title {
	font-weight: bold;
	font-size: 12px;	
	margin: 0px 0px 10px 10px;
}

.dshbr_content {
	margin-left: 10px;
	line-height: 180%;
}

.dshbr_content > span {
	color: #484877;
	font-weight: bold;
	font-size: 20px;
}

.dshbr_content > div {
	display: inline-block;
}

/* */

.bell_icon {
	margin-left: 5px;
}

.bell_icon.shaking {
	transform-origin: 50% 0%;
    animation-name: shake;
    animation-duration: 2s;
    animation-iteration-count: infinite;
    animation-delay: 0.5s;
    color: red;
}

    @keyframes shake{
    	0%{
        	transform: rotate(0deg);
        }
        10%{
        	transform: rotate(45deg);
        }
        20%{
        	transform: rotate(-45deg);
        }
        30%{
        	transform: rotate(30deg);
        }
        40%{
        	transform: rotate(-30deg);
        }
        50%{
        	transform: rotate(10deg);
        }
        60%{
        	transform: rotate(-10deg);
        }
        70%{
        	transform: rotate(0deg);
        }
        100%{
        	transform: rotate(0deg);
        }
    }
    
</style>
</head>

<body class="admin_body">
<jsp:include page="/views/inc/admin_aside.jsp"/>
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
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
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
				<div class="card-header">배송 현황</div>
				<div class="card-body">
						
					<div class="biv_box">
						<div class="href_biv">
							<div class="dshbr_title">결제완료 <span class="fa fa-bell bell_icon" id="pymntCmplt_icon"></span> </div>
							<div class="dshbr_content">결제가 완료된 상품은 모두 <span id="pymntCmplt">0</span> 건입니다. &nbsp;<div id="pymntCmplt_text"></div></div>
							<input type="hidden" value="0">
						</div>
						
						<div class="href_biv">
							<div class="dshbr_title">취소요청 <span class="fa fa-bell bell_icon"  id="pymcnRqst_icon"></span> </div>
							<div class="dshbr_content">결제 취소 요청이 접수된 상품은 모두 <span id="pymcnRqst">0</span> 건입니다. &nbsp;<div id="pymcnRqst_text"></div></div>						
							<input type="hidden" value="10">
						</div>
						
						<div class="href_biv">
							<div class="dshbr_title">반품요청 <span class="fa fa-bell bell_icon" id="rqstRtrn_icon"></span> </div>
							<div class="dshbr_content">반품 요청이 접수된 상품은 모두 <span id="rqstRtrn" >0</span> 건입니다. &nbsp;<div id="rqstRtrn_text"></div></div>						
							<input type="hidden" value="12">
						</div>
					</div>
					
					
				</div>
			</div>
		</section>
	</div>
	</main>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

 	<!-- 차트 링크 -->
 	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		
	<!-- J쿼리 -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	
    <!-- JavaScript  -->
    <script type="text/javascript" src="/resources/js/admin_main.js"></script>
	<script type="text/javascript" src="/resources/js/commonFunction.js"></script>
	
		
		
</body>
</html>