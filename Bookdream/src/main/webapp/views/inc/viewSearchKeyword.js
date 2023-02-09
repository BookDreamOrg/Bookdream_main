
//자동완성 키워드 
$(function(){
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
