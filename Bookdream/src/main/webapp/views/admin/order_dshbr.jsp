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
    
<title>주문 현황</title>

<style type="text/css">

/* */
.order_dshbr {
	width: 1240px;
	height: 110px;
	margin: auto;
	margin-top: 30px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);	
}

.order_dshbr_table {
	display: inline-block;
	height: 60px;
	margin: 25px 0px;
}

.order_dshbr_table th {
	width: 125px;
	height: 30px;
	padding-left: 40px;
	vertical-align:middle;
	font-size: 12px;
}


.order_dshbr_table td {
	width: 125px;
	height: 30px;
	padding-left: 40px;	
	vertical-align:middle;	
	font-size: 20px;
	font-weight: bold;
}

.pay_dshbr_table {
	display: inline-block;
	height: 60px;
	margin: 25px 0px;
	border-left: 1px solid #ccc;
}

.pay_dshbr_table th {
	height: 30px;
	padding-left: 75px;		
	vertical-align:middle;
	font-size: 12px;

}

.pay_dshbr_table td {
	height: 30px;
	padding-left: 75px;		
	vertical-align:middle;	
	font-size: 20px;
	font-weight: 600;	
	color: #484877;

}

/* */

.center {
	margin: auto;
	width: 1240px;	
	height: 350px;	
	margin-top: 30px;
	
}

.order_chartbox, .pay_chartbox {
	width: 605px;
	height: 350px;
	border: 1px solid #ccc;		
	padding: 20px 10px 10px 10px;
	float: left;	

}

.order_charbox_shbr, .pay_charbox_shbr {
	width: 605px;
	height: 350px;
	border: 1px solid #ccc;		
	margin-left: 30px;
	padding: 20px 30px 10px 10px;
	float: left;
}

/* */

.chart_title {
	margin: 10px 0px 0px 10px;
	font-weight: bold;
}

.chartbox_chart {
	margin-top: 30px;

}

.chart_btn {
	width: 50px;
	height: 30px;
	font-size: 12px;
}

.pay_radio {
	top: -50px;
	left: 480px;
}

</style>







</head>
<body class="admin_body">

<jsp:include page="/views/inc/admin_aside.jsp"/>
	
	<main class="container-fluid main_container"> 
	
	<div class="container">
				
		<div class="order_dshbr">
			<table class="order_dshbr_table">
				<tr>
					<th>결제완료</th>
					<th>배송중</th>
					<th>배송완료</th>
					<th>구매확정</th>
					<th>결제취소요청</th>
					<th>결제취소</th>
					<th>반품요청</th>
					<th>반품완료</th>
				</tr>
				
				<tr id="order_dshbr_table_count">
				
				</tr>
			</table>
			
			<table class="pay_dshbr_table">
				<tr>
					<th>총 매출액</th>
				</tr>
				<tr >
					<td id="total_price"></td>
				</tr>
			</table>
			
		</div>	
		

		<div class="center">
			<div class="order_chartbox">
			<span class="chart_title">주간/월간 구매,취소 수</span>
					<div class="chartbox_chart">
						<div class="btn-group pay_radio" role="group" aria-label="radio toggle button group">
						  <input type="radio" class="btn-check" name="order_radio" id="wek_chart_btn" autocomplete="off" checked>
						  <label class="btn btn-outline-secondary chart_btn" for="wek_chart_btn">주간</label>
						  <input type="radio" class="btn-check" name="order_radio" id="mly_chart_btn" autocomplete="off">
						  <label class="btn btn-outline-secondary chart_btn" for="mly_chart_btn">월간</label>
						</div>				
					</div>
				<div style="padding: 0px 50px;">
					<canvas class="myChart" id="orderChart"></canvas>
				</div>
			</div>
			
			<div class="order_charbox_shbr">
			<span class="chart_title">주문당 도서수 비율</span>
			<div style="width: 380px; height:330px; float: right;">
				<canvas class="myChart" id="rateChart"></canvas>
			</div>
			</div>
					
		</div>
			
		<div class="center">
			
			<div class="pay_chartbox">
			<span class="chart_title">주간/월간 매출액</span>				
				<div class="chartbox_chart">
					<div class="btn-group pay_radio" role="group" aria-label="radio toggle button group">
					  <input type="radio" class="btn-check" name="pay_radio" id="wek_paychart_btn" autocomplete="off" checked>
					  <label class="btn btn-outline-secondary chart_btn" for="wek_paychart_btn">주간</label>
					  <input type="radio" class="btn-check" name="pay_radio" id="mly_paychart_btn" autocomplete="off">
					  <label class="btn btn-outline-secondary chart_btn" for="mly_paychart_btn">월간</label>
					</div>					
				</div>	
				<div style="padding: 0px 50px;">				
					<canvas class="myChart" id="myChart"></canvas>
				</div>				
			</div>			

			<div class="pay_charbox_shbr">
			<span class="chart_title">결제수단 비율</span>
			<div style="width: 380px; height:330px; float: right;">
				<canvas class="myChart" id="paymethodChart"></canvas>
			</div>
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
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

	<!-- Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>		
			
</body>
</html>