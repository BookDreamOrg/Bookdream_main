/* ------------------ ${cartListCount} 가져오기 ------------------ */
 $(function(){ 
	//let user_no = $("#user_no").val();
	let user_no = <%= (int)session.getAttribute("user_no") %>;
	
	console.log(user_no)
	
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