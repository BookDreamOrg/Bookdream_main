<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료 페이지</title>

<style type="text/css">

* {
	border-radius:10px;
	box-sizing: border-box;
}

body {
	 position: relative;
	 background-image: url('/resources/image/background.jpg');
	 background-repeat: no-repeat;
 	 background-position: center;
  	 background-size: cover;
  	 z-index: -1;	
}

body:before {
     content: "";
     opacity: 0.6;
     position: absolute;
     top: 0px;
     left: 0px;
     right: 0px;
     bottom: 0px;
     background-color: white;
  	 z-index: -1;	     
}

header {
	height: 200px;
	margin-bottom:50px;

}

footer {
	height: 200px;
	margin-top:50px;

}

.main {
	position:relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;
	min-height: 1000px;
}

.topbar {
	position:relative;
	height:150px;	
	border: 2px solid #bdbdbd;
	background-color: white;
}

.topbar_title{
	position:absolute;
	top:60px;
	margin-left:70px;
	font-size: 30px;
	font-weight: bold;
}

.center {
	position:relative;
	width: 1240px;
	height: auto;
	min-height:500px;
	margin-top:30px;	
	border: 2px solid #bdbdbd;
	background-color: white;	
}

table {
	position:absolute;
	top:110px;
	left:70px;
	width:700px;
 	text-align:justify;
	font-size: 20px;
	
}

th{
	height: 50px;
	width: 120px;
}

td {
	width: 500px;
}


</style>


</head>

<body>

	<header></header>
	
	<div class="container">
		<div class="main">
		
			<div class="topbar">
				 <div>
				 	<span class="topbar_title">주문&nbsp;완료</span>
				 </div>
			</div>
			
			<div class="center">
				<div class="center_info">

					<table>
						<tr>
							<th >상품명 :</th>
							<td>${order_name}</td>
						</tr>
						<tr>
							<th>결제금액 :</th>
							<td>${final_price}</td>
						</tr>
						<tr>
							<th>결제수단 :</th>
							<td>${pay_method}</td>
						</tr>
						<tr>
							<th>받는사람 :</th>
							<td>${order_receiver}</td>
						</tr>
						<tr>
							<th>주소 :</th>
							<td>${order_address}</td>
						</tr>
						<tr>
							<th>연락처 :</th>
							<td>${order_tel}</td>
						</tr>
					</table>						
				</div>		
			</div>
		</div>
	</div>
	
	
	<footer></footer>	
		
	

</body>
</html>