<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
.hidden_text {
	margin-top: 10px;
	margin-left: 35px;
	display: none;
}

.hidden_text_qna {
	margin-top: 10px;
	margin-left: 35px;
	display: none;
	
}

/* 스크롤바 스타일 변경 */
::-webkit-scrollbar {
	width: 10px;
    height: 10px;
}
    
::-webkit-scrollbar-thumb {
	background-color: #c2c2dd;
    border-radius: 10px;
    border: 3px solid #c2c2dd;
}


.hidden_item_text{
	margin-top: 10px;
	margin-left: 35px;
	display: none;
}
</style>
</head>
<body>

	<div class="aside row">
		<div class="aside_logo">
			<img src="/resources/images/logo/logo_text--white.png"
				alt="BookDream" class="aside_logo_img" />
		</div>
		<div class="aside_profile">
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<img src="/resources/images/logo/logo_white.png"
							alt="user_profile" class="user_profile" />
					</div>
					<span class="list_text">
					<a href="/views/admin/adminS">관리자</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-arrow-up-right-from-square"></i></span> <span
					class="list_text"><a href="/views/main/main.jsp">사이트 바로가기</a></span></li>
			</ul> 
		</div>
		<div class="aside_product">
			<div class="aside_product_title">제품관리</div>
		</div>
		<div class="aside_product_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-border-all"></i></span> <span class="list_text"><a href="/views/admin/adminS">대시보드</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user-gear"></i></span><span class="list_text"><a href="/admin/user/userListPage.do?num=1&searchUserKeyword=">사용자 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon">
				<i class="bi bi-book"></i></span> <span class="list_text item_toggle"><a href='#'>상품 관리</a></span></li>
				<li class="hidden_item_text"><a href="/views/admin/book_register.jsp">- 도서 등록</a></li>
				<li class="hidden_item_text mb-2"><a href="/views/admin/item_mngmn.jsp">- 수정/삭제</a></li>
				<li class="list-group-item"><span class="list_icon">
				<i class="fa-solid fa-bullhorn"></i></span> <span class="list_text toggle"><a href="#">결제 관리</a></span></li>
				<li class="hidden_text"><a href="/admin/order">- 주문현황</a></li>
				<li class="hidden_text"><a href="/admin/orderMngmn">- 주문관리</a></li>
			</ul>
		</div>
		<div class="aside_resource">
			<div class="aside_resource_title">고객지원</div>
		</div>
		<div class="aside_resource_list">
			<ul class="list-group">
				<li class="list-group-item">
					<span class="list_icon">
						<i class="fa-solid fa-comment"></i>
					</span> 
					<span class="list_text toggle_qna"><a href="#">문의 사항</a></span>
				</li>
				<li class="hidden_text_qna"><a href="/admin/user/getAllQnAList?pageNum=1">- 답변대기</a></li>
				<li class="hidden_text_qna"><a href="/admin/user/getClearQnAList?pageNum=1">- 답변완료</a></li>
			</ul>
		</div>
		<!-- <div class="thema">
        <div class="thema_color"></div>
        <div class="thema_color_btn">테마변경</div>
      </div> -->
	</div>


	<script type="text/javascript">
	
	/***************************** 주문 상품 토글 *****************************/
	$(document).on("click", ".toggle", function(e) {	
			
		var toggle = document.getElementsByClassName('hidden_text');
			
		if ($(".hidden_text").css("display") == "none") {
		
			for (var i=0; i<toggle.length; i++) {
				toggle[i].style.display = "block";
			}

		} else {
			for (var i=0; i<toggle.length; i++) {		
				toggle[i].style.display = "none";
			}	
	
		}

	})
	
	/***************************** 문의 관리 토글 *****************************/
	$(document).on("click", ".toggle_qna", function(e) {	
			
		var toggle = document.getElementsByClassName('hidden_text_qna');
			
		if ($(".hidden_text_qna").css("display") == "none") {
		
			for (var i=0; i<toggle.length; i++) {	
				toggle[i].style.display = "block";
			}

		} else {
			for (var i=0; i<toggle.length; i++) {		
				toggle[i].style.display = "none";
			}	
	
		}

	})
	
	
	/***************************** 상품 관리  토글 *****************************/
	$(document).on("click", ".item_toggle", function(e) {	
			
		var toggle = document.getElementsByClassName('hidden_item_text');
			
		if ($(".hidden_item_text").css("display") == "none") {
		
			for (var i=0; i<toggle.length; i++) {
				toggle[i].style.display = "block";
			}

		} else {
			for (var i=0; i<toggle.length; i++) {		
				toggle[i].style.display = "none";
			}	
	
		}

	})
	
	
	
	
	
	
	
	
	
	
	</script>


</body>
</html>