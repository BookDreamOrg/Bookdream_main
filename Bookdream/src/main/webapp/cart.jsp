<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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

.topbar_title_a{
	position:absolute;
	top:60px;
	right:70px;
	font-size: 30px;
	font-weight: bold;
}

.cart_list {
	position:relative;
	width: 1240px;
	height: auto;
	min-height:500px;
	margin-top:30px;	
	border: 2px solid #bdbdbd;
	background-color: white;	
}


table {
	text-align: center;
}

th {
	height: 80px;
}

.cart_list_table_checkbox {
	width: 50px;
}
.cart_list_table_title{
	width: 600px;
	max-width: 700px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;	
    text-align: left;
    padding-left: 50px;
    font-size: 20px;
}

.cart_list_table_count, .cart_list_table_delete {
	width: 80px;
}

.cart_list_table_price {
	width: 150px;
}

input[type=checkbox] {

	zoom: 1.6;

}

button {
	cursor: pointer;
}

</style>


</head>

<body>

	<header></header>
	
	<div class="container">
		<div class="main">
		
			<div class="topbar">
				 <div>
				 	<span class="topbar_title">장바구니</span>
				 	<a  class="topbar_title_a" href="/cart/orderitem">결제하기</a>
				 </div>
			</div>
			
			<div class="cart_list">
				<div class="cart_list_table">	
					<table>
						<tr>
							<th><input type="checkbox" id="allcheckbox" checked="checked" onclick='selectAll(this)'></th>
							<th></th>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>
						
						<c:forEach items="${cartList}" var="cart" varStatus="status">
							<tr>
								<td class="cart_list_table_checkbox"><input type="checkbox" id="box" name="box" checked="checked" ></td>
								<td><img alt="" src="${cart.bookVO.book_img }"> </td>					
								<td class="cart_list_table_title">${ cart.bookVO.title }</td>
								<td class="cart_list_table_price"><fmt:formatNumber value="${cart.bookVO.book_price}" pattern="###,###"/>원</td>
								<td class="cart_list_table_count">${ cart.product_count }</td>
								<td class="cart_list_table_delete"><button value="${cart.cart_no}" onclick="cart_delete(this);">삭제</button></td>
							</tr>
						<c:set var="totalprice" value="${totalprice + (cart.bookVO.book_price * cart.product_count) }"/>
					</c:forEach>
					</table>				
				
					<form action="/delete" method="post" id="cart_delete_form"">
						<input type="hidden" name="cart_no" id="cart_delete_cart_no" >
						<input type="hidden" name="user_no" value="1">
					</form>
							
				</div>		
			</div>
		</div>
	</div>
	
	
	<footer></footer>	
		
<script type="text/javascript">


function cart_delete(arg) {
	  var cart_no = $(arg).val();
	  $('#cart_delete_cart_no').val(cart_no);
	   alert(cart_no);
	  $('#cart_delete_form').submit();


	}


/* $('#cart_delete').on("click", function(e){
	e.preventDefault();
	var cart_no = $(this).val();
	alert(cart_no);
});  */
 
function selectAll(selectAll)  {
	  var checkboxes = document.getElementsByName('box');
	   
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	
</script>	

</body>
</html>