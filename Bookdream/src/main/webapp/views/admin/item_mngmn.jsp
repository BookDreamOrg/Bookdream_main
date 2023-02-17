<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>


<!-- Bootstrap 5.0.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- CSS -->
 <link rel="stylesheet" href="/resources/css/item_admin.css" />
 
 <!-- 차트 링크 -->
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<head>
<meta charset="UTF-8">
    <!-- Favicon -->
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="/resources/images/favicon/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="/resources/images/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/resources/images/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <link rel="stylesheet" href="/resources/css/admin_screen.css" />
   
<title>Admin Page</title>
</head>
<body class="admin_body">
	<jsp:include page="/views/inc/admin_aside.jsp"/>
	
	
	<main class="container-fluid main_container "> <header
		class="shadow-sm">
		<nav class="navbar navbar-expand-xl navbar-light bg-white">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo2"
					aria-controls="navbarTogglerDemo2" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse show" id="navbarTogglerDemo2">
					<ul class="navbar-nav me-auto mb-2 mb-xl-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/views/main/main.jsp">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a>
						</li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success" type="submit">
							Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<div class="section_div">
		<section class="today_state">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">도서 일일 판매량(주간)</h5>
					<div class="container">
    				<canvas id="Book_Order_qty_chart" height="200px;" width="1300px;"></canvas>
  					</div>
				</div>
			</div>
		</section>
		
	</div>
		
		
		<!---------------------------- 도서 검색 ------------------------------------>
		<section class="mb-5">
		<div class="h3 mb-3" id="section_title1"  >도서 상세 조회</div>
		<hr>
		<form action="/admin_bookList">
		<div class="row row-cols-4">
  		<div class="col-md-2">책 제목</div>
  		<div class="col-md-4"><input type="search" name="title" id="title" > </div>
  		
  		<div class="col-md-2">글쓴이</div>
  		<div class="col-md-4"><input type="search" name="author" id="author"> </div>
  		
  		<div class="col-md-2 mt-2">카테고리</div>
  		<div class="col-md-4 mt-2"> 
  			<select name="book_category" id="book_category"><option value="all">카테고리 선택</option><option value="국내도서">국내도서</option><option value="해외도서">해외도서</option> </select>
  		</div>

  		<div class="col-md-2 mt-2">출판사</div>
  		<div class="col-md-4 mt-2"><input type="search" name="publisher" id="publisher"> </div>
		</div>

		<div class="float-end"><button type="submit" class="btn btn-warning"> 검색  </button> </div>
		</form>
		</section>
		<!----------------------검색 결과 리스트 ------------------------->
		<section>
		<div id="bookList_title" class="text-center">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item" id="check"><span class="h7" >선택</span></li>
	  		<li class="list-group-item" id="count" ><span class="h7" >NO</span></li>
	  		<li class="list-group-item" id="bookNo"><span class="h7" >도서 번호</span></li>
	  		<li class="list-group-item" id="book_title"><span class="h7" >제목</span></li>
	  		<li class="list-group-item" id="book_author"><span class="h7" >글쓴이</span></li>
	  		<li class="list-group-item" id="category"><span class="h7" >카테고리</span></li>
	  		<li class="list-group-item" id="org_price"><span class="h7" >정가 </span></li>
	  		<li class="list-group-item" id="sale_rate"><span class="h7" >할인율 </span></li>
	  		<li class="list-group-item" id="sale_price"><span class="h7" >판매가 </span></li>
	  		<li class="list-group-item" id="stock"><span class="h7" >재고</span></li>
	  		<li class="list-group-item" id="delete"><span class="h7" >삭제</span></li>
	  	</ul>
	  	</div>
	  	<div id="bookList" class="text-center mb-5">
		<c:forEach var="book" items="${book}" varStatus="status">
		<ul class="list-group list-group-horizontal">
			<li class="list-group-item list-group-item-action list-group-item-warning " id="check">
				<input type="checkbox" name="item" value="${book.book_no}"/>
			</li>	
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="count">${status.count}</li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="bookNo">${book.book_no}</li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning" id="book_title">${book.title}</li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning" id= "book_author">${book.author}</li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="category">${book.book_category}</li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="org_price"><fmt:formatNumber value="${book.book_price}" pattern="###,###,###원" /></li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_rate"><fmt:formatNumber type="percent"  value="${book.discount/100} " /></li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_price" style="font-weight: 700; color: red;"><fmt:formatNumber type="currency" pattern="###,###,###원" value="${book.book_price - (book.book_price*book.discount/100)}" /></li>
	  		<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="stock">
	  			<div class="text-center">
	  				<div>${book.stock}</div>
	  				<div class="mt-1"><button type="button" class="btn btn-warning" id="stock_upd_btn" value="${book.book_no}">추가</button></div>
				</div>
			</li>
			<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="delete">
				<button type="button" class="btn btn-warning mt-3" id="delete_btn" value="${book.book_no}">삭제</button>		
			</li>
	  	</ul>
		</c:forEach>
		</div>
		</section>
		
	</main>

<!--------------------------------- 도서 재고 추가 모달  -------------------------------->	
<div class="modal" tabindex="-1" id="my-modal" >
    <div class="modal-dialog modal-side modal-bottom-right modal-notify " role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
      	<div class="modal-header">
      	    <h5 class="modal-title h5 id="modalVerticallyCenteredLabel">재고 추가</h5>
        	<button type="button" class="btn-close" aria-label="Close" onclick="modal_close()"></button>
      	</div>
      <div class="modal-body">
      <div class="text-center">
      <div><img id="modal_book_img" src=""  class="img-thumbnail"></div>
      <div class="h5 mt-2" id="modal_book_title"></div>
      <div class="row mt-3"> 
        <div class="col-4"><strong><span class="small" id="modal_text">재 &nbsp;&nbsp;&nbsp;&nbsp;고</span></strong></div>
        <div class="col-8"><span id="this_stock"></span></div>
      </div>
      <div class="row mt-2"> 
        <div class="col-4"><strong><span class="small" id= "modal_text">재고 추가</span></strong></div>
        <div class="col-8">
        	<input type="number" min="1" id="modal_upd_stock">
        </div>
      </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="modal_close()">닫기</button>
        <button type="button" class="btn btn-primary" id="btn_modal_upd">추가</button>
      </div>
    </div>
  </div>
</div>
	
	
<!--------------------------------- 도서 삭제  모달  -------------------------------->	
<div class="modal" tabindex="-1" id="book_delete_modal" >
    <div class="modal-dialog modal-side modal-bottom-right modal-notify " role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
      	<div class="modal-header">
      	    <h5 class="modal-title h5 id="modalVerticallyCenteredLabel">도서 삭제</h5>
        	<button type="button" class="btn-close" aria-label="Close" onclick="modal_close()"></button>
      	</div>
      <div class="modal-body">
      <div class="text-center">
      <div><img id="modal_book_img2" src=""  class="img-thumbnail"></div>
      <div class="h5 mt-2" id="modal_book_title2"></div>
      <div class="mt-3 mb-5"> 
        <span class="h6"style="color: red;"> 정말 삭제하시겠습니까? </span><br>
        <span class="h6" >도서에 있는 리뷰도 함께 삭제됩니다.</span>
        
      </div>
   
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="modal_close()">닫기</button>
        <button type="button" class="btn btn-primary" id="btn_modal_delete">삭제 </button>
      </div>
    </div>
  </div>
</div>
		
	
	
	

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
    
    <script type="text/javascript" src="/resources/js/book_admin.js"></script>
	
		
	<!-- J쿼리 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
		
		
	

		
		
</body>
</html>