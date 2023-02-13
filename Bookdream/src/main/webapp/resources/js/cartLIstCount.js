/* ------------------ ${cartListCount} 가져오기 ------------------ */
 $(function(){ 
    //let user_no = window.sessionStorage.getItem("user_no");
    
    if(user_no === null ||user_no === "" || user_no === "null"){
       console.log("user_no 존재하지 않음.\n"+"user_no : "+ user_no);
   } else {
      console.log("user_no 존재함.\n"+"user_no : "+ user_no);
       $.ajax({
            url : "/itemorder/cart/countCartLsit",
            type : "POST",
            data : { user_no : user_no },
            success : function(cnt){ 
               $("#cartListCount").html(cnt);            
            }, error : function(){
                 alert("error : [실패] 카트 리스트 가져오기");
             }      
          });
   }
   
});