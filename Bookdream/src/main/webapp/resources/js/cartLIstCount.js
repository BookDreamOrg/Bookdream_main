/* ------------------ ${cartListCount} 가져오기 ------------------ */
 $(function(){ 

	$.ajax({
	   url : "/itemorder/cart/countCartLsit",
	   type : "POST",
	   data : { user_no : user_no },
	   success : function(cnt){ 
			$("#cartListCount").html(cnt)			   
	     /*   $('#cartListCount').load(location.href+' #cartListCount');*/
					   
		}, error : function(){
		     alert("error : [실패] 카트 리스트 가져오기");
	    }		
	 });
	
});