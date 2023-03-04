$(function(){
	
	
	
});

/* 도서 이미지 미리보기 -------------------------------- */
//function readURL(input) {
//	  if (input.files && input.files[0]) {
//	    var reader = new FileReader();
//	    reader.onload = function(e) {
//	      document.getElementById('preview').src = e.target.result;
//	    };
//	    reader.readAsDataURL(input.files[0]);
//	  } else {
//	    document.getElementById('preview').src = "";
//	  }
//}


/* 도서 이미지 미리보기 -------------------------------- */
function readURL(val) {
	console.log(val);
if (val !=null || val != "") {
	document.getElementById('preview').src = val;
} else {
  document.getElementById('preview').src = "";
}
}


/* 도서 등록 버튼 클릭 -------------------------------- */
$(document).on("click", "#Upload", function(e) {	 
	
	let title = document.getElementById('title').value;
	let isbn_no = document.getElementById('isbn_no').value;
	let book_category = document.getElementById('book_category').value;
	let author = document.getElementById('author').value;
	let publisher = document.getElementById('publisher').value;
	let pblic_date = document.getElementById('pblic_date').value;
	let book_content = document.getElementById('book_content').value;
	let stock = document.getElementById('stock').value;
	let book_price = document.getElementById('book_price').value;
	let book_img = document.getElementById('book_img').value;

	if(isbn_no==null || isbn_no == ""){
		isbn_no = 0000000000001;
	}
	if(stock = null || stock == ""){
		stock = 10;
	}

	console.log("title : "+ title + "isbn_no : " + isbn_no + "book_category" + book_category + "author : " + author + "publisher : "+ publisher 
			 + 	"pblic_date : "+ pblic_date + "book_content : " + book_content + "stock : " + stock + "book_price" + book_price + "book_img : "+ book_img
	);

	
	let dataResult = (isEmpty(title) == true && isEmpty(isbn_no) == true &&  isEmpty(book_category) == true  && isEmpty(author) == true
					&& isEmpty(publisher) == true && isEmpty(pblic_date) == true && isEmpty(book_content) == true && isEmpty(stock) == true 
					&& isEmpty(book_price) == true && isEmpty(book_img) == true
					);
	
	console.log(dataResult);
	
	if (dataResult == true){    		

		 Swal.fire({
		      title: '도서 등록',
		      text: "도서를 등록하시겠습니까?",
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonColor: '#3085d6',
		      cancelButtonColor: '#d33',
		      confirmButtonText: '등록',
		      cancelButtonText: '취소',
		      reverseButtons: true, // 버튼 순서 거꾸로
		      
		    }).then((result) => {
		      if (result.isConfirmed) {
		        Swal.fire(
			        BookUpload(title, isbn_no, book_category,author,publisher,pblic_date,book_content,stock,book_price,book_img),
		          '정상처리 되었습니다.',
		          'success'
	
		        )
		      }else if(result.isDismissed){
		    	  Swal.fire(
		    		'도서 등록',
		    		'도서 등록을 취소 하셨습니다.',
		    		'error'
		    	  )
		      }
		    })
	    
		
	}else{
		//빈 input 확인	
			if(isEmpty(title)==false){
				border();
				document.getElementById("title").style.borderColor = 'red';
				Toast('error', '제목을 입력하세요');
				return;
			}else if(isEmpty(author)==false){
				border();
				document.getElementById("author").style.borderColor = 'red';
				Toast('error', '작가를 입력하세요');
				return;
			}else if(isEmpty(publisher)==false){
				border();
				document.getElementById("publisher").style.borderColor = 'red';
				Toast('error', '출판사를 입력하세요');
				return;
			}else if(isEmpty(pblic_date)==false){
				border();
				document.getElementById("pblic_date").style.borderColor = 'red';
				Toast('error', '출판일을 입력하세요');
				return;
			}else if(isEmpty(book_content)==false){
				border();
				document.getElementById("book_content").style.borderColor = 'red';
				Toast('error', '내용을 입력하세요');
				return;	
			}else if(isEmpty(book_price)==false){
				border();
				document.getElementById("book_price").style.borderColor = 'red';
				Toast('error', '가격을 입력하세요');
				return;	
			}else if(isEmpty(book_img)==false){
				border();
				document.getElementById("book_img").style.borderColor = 'red';
				Toast('error', '도서 이미지를 입력하세요');
				return;	
			}
				
	}
	
	
	//input element borderColor all black
	function border(){
		var input = document.getElementsByTagName('input');
		for (var i = 0; i < input.length; i++) {
			input[i].style.border = '1px solid #ced4da';
		
		}
	}
	
	
	
	//데이터 비어있는지 확인
	function isEmpty(value){
		  if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		    return false;
		  }else{
		    return true;
		  }
	};
	
	
	
	
})

/* 도서 등록 -------------------------------- */

function BookUpload(title, isbn_no, book_category,author,publisher,pblic_date,book_content,stock,book_price,book_img){

	let data = {
			"title" : title,
			"isbn_no" : isbn_no,
			"book_category" : book_category,
			"author" : author,
			"publisher" : publisher,
			"pblic_date" : pblic_date,
			"book_content" : book_content,
			"stock" : stock,
			"book_price" : book_price,
			"book_img" : book_img,
					
	}

$.ajax({
	type : "POST",                              
	url : "/book_register",
	data : data,  
	success : function(result) {
		if(result==1){
			window.location.href = '/views/admin/admin.jsp';
		}
	},
		
	error: function(request, status, error) {
			
	       console.log("code: " + request.status)
	       console.log("message: " + request.responseText)
	       console.log("error: " + error);
	        
	}	
			
})		
	
	
}


/* [도서 등록 실패] toast -------------------------------- */
function Toast(icon, text){
	
	 const Toast = Swal.mixin({
           toast: true,
           position: 'center-center',
           showConfirmButton: false,
           timer: 1000,
           timerProgressBar: true,
           didOpen: (toast) => {
               toast.addEventListener('mouseenter', Swal.stopTimer)
               toast.addEventListener('mouseleave', Swal.resumeTimer)
           }
       })

       Toast.fire({
           icon: icon,
           title: text
       })
	
	
}
  


