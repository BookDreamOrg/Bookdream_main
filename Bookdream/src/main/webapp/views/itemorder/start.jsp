<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트페이지</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<h1>
		<a href="/itemorder/cart/list">장바구니</a>
	</h1>

	<h1>
		<a href="/detail/cart/orderitem">결제/주문</a>
	</h1>

	<h1>
		<a href="/mypage/tracking">마이페이지-배송조회</a>
	</h1>
	<h1>
		<a href="/mypage/address">마이페이지-배송지관리</a>
	</h1>

	<button id="cart">배열넘기기~</button>
	
	<input type="hidden" id="test" name="test[]" value="" />



<script type="text/javascript">
/* */
function ById(id) {
	return document.getElementById(id);
}

/* */
$(document).on("click", "#cart", function(e) {
	//var aaa = document.getElementsByName("abc[]")[0].value;
	
	for (var i=0; i<50; i++) {
		$("input[name='test[]']").eq(i).val(100)	

	}
	
	aaa = document.getElementsByName("test[]").value;
	
	console.log(document.getElementsByName("test[]").length)

})

</script>


</body>
</html>


