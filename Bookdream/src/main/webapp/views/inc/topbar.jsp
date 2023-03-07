<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<style type="text/css">

.fa-circle { 
	color : #DFDFDF;
} 
</style>




</head>
<body>

			  <div style="margin-left: 60px; font-weight: bold; font-size: 24px;" id="title">장바구니</div>
			  <div style="margin-left: auto;">
			    <div style="display: flex;">
			    
			      <span style="width: 150px;">
			      
					<span class="fa-stack fa-xs">
					  <i class="fas fa-circle fa-stack-2x cartColor"></i>
					  <i class="fas fa-inverse fa-stack-1x">1</i>
					</span>
					
			         <span>장바구니</span>
			         
			      </span>
			      <span style="width: 150px;">
			      
					<span class="fa-stack fa-xs">
					  <i class="fas fa-circle fa-stack-2x orderColor"></i>
					  <i class="fas fa-inverse fa-stack-1x">2</i>
					</span>
					
			        <span>주문/결제</span>
			        
			      </span>
			      
			      <span style="width: 150px;">
			      
					<span class="fa-stack fa-xs">
					  <i class="fas fa-circle fa-stack-2x sucColor"></i>
					  <i class="fas fa-inverse fa-stack-1x">3</i>
					</span>
					
			        <span>결제완료</span>   
			        
			      </span>	   				      	
			    </div>   	
			  </div>
	
	
	<script type="text/javascript">
	
	var curl = window.location.href.split('?')[0]
	
	console.log(curl)
	
	change(curl, 'http://localhost:8000/itemorder/cart/list', '장바구니', '.cartColor')
	
	change(curl, 'http://localhost:8000/detail/cart/orderitem', '결제/주문', '.orderColor')	
	change(curl, 'http://localhost:8000/detail/cart/orderitemBuyNow', '결제/주문', '.orderColor')	
	
	change(curl, 'http://localhost:8000/detail/cart/orderitem/success', '결제완료', '.sucColor')

		
	function change(curl, url, text, color) {
		
		if (curl === url) {
			document.getElementById('title').innerHTML = text
			document.querySelector(color).style.color = '#484877'
		}			
	}
		
	
	</script>	
</body>
</html>