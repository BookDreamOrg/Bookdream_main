	let cart_no = $(this).attr("data-cartNo");
	
	let data = {
		cart_no :  cart_no,
		product_count :product_count
	};
																		      
	console.log(data);
																		     
	$.ajax({
		url : "/itemorder/cart/modifyCount",
		type : "POST",
		data : data,
		success : function(result){
			
			if(result == 1) { // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
				console.log("수량 변경 완료");
				
			} else {
				console.log("수량 변경 미완료");
				
			}
		}, error : function(){
			console.log("error : 카트 담기 실패");
			
		},complete: function(){
			$('.reload').load(location.href+' .reload');
			$('.total${cart.cart_no}').load(location.href+' .total${cart.cart_no}');
			
		}      
	});
	
	