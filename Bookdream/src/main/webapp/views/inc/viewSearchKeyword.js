
//자동완성 키워드 
$(function(){
	
	bestSearchKeywordList();
	
	
	$('#keyword_text').autocomplete({
		source : function(request,response){
		$.ajax({
			type : "POST",
			url : "/viewAutoKeyword",
			data : {
				keyword : request.term,
			}, 
			success : function (data){
				response(
					$.map(data.resultList, function(item){
						return{
							label : item.TITLE, //목록에 표시되는 키워드
							value : item.TITLE //선택시 input 창에 표시되는 키워드
						}
					}) 		
				);					
			},
			error : function(){
				alert("에러 발생");	
			}
		});		
		
		},
		focus : function(event, ui){
			return false;
		},
		  minLength: 2,
		  autoFocus: true,
		  classes: {  
              "ui-autocomplete": "highlight"
          },
          delay: 500,
          close : function(event){    //자동완성창 닫아질때 호출
              console.log(event);
          }
	}).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경 부
        return $('<li>') //기본 tag가 li
        .append('<div class="mt-1">'+ item.value + '</div>')
        .appendTo(ul);
    };
    
    
    
  
});



//인기 검색어 10개 리스트
function bestSearchKeywordList(){
	$.ajax({
		   url : "/bestSearchKeyword",
		   type : "get",
		   data : "",
		   dataType : "json",
		   contentType : "application/json",
		   success : function(Array){
			   let bestSearchKeyword ="";
			   
			   
			   for(var rank = 0; rank<Array.length; rank++){
				   bestSearchKeyword += `<li class="list-group-item list-group-item-action" >
					   						<span id="badge" class="badge text-light">`+(rank+1)+`</span>`+'&nbsp;&nbsp;'+Array[rank]+ `</li>`
			   }
			
			   document.getElementById('bestKeyword').innerHTML = bestSearchKeyword;
			   slide();
			},
			error : function(){
			     alert("에러 발생 ");
			}		
		 });
}

function slide(){
	$(function() { 
		 var ticker = function() {
			 setTimeout(function(){ $('#block li:first').animate( {marginTop: '-20px'}, 400, function() {
				$(this).detach().appendTo('ul#bestKeyword').removeAttr('style'); }); ticker(); }, 3000); }; ticker(); });
	  
	  
}




