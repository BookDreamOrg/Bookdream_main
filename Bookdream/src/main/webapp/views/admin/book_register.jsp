<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- Bootstrap 5.0.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- CSS -->
 <link rel="stylesheet" href="/resources/css/admin_book_register.css" />
 
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


<title>Insert title here</title>
</head>

<body class="admin_body">
	<jsp:include page="/views/inc/admin_aside.jsp"/>
	
	
	<main class="container-fluid main_container "> 
	<!---------------------------- 도서 등록 ------------------------------------>
		<section class="mb-5 mt-3" >
		<div class="h3 mb-3" id="section_title1"  >도서 등록</div>
		<hr>
		</section>
		
<section>
		<div class="row mt-3">
			<div class="col-3">
				<span> 도서 제목 </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<input type="text" id="title" name="title" placeholder="제목은 필수입니다. ">
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 국제표준 도서번호(ISBN) </span> 
			</div>
			<div class="col-9">
				<input type="number" name="isbn_no" id="isbn_no" min="0" maxlength="13" placeholder="선택사항 입니다. ">
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 카테고리 </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<select name="book_category" id="book_category" class="form-select" >
					<option value="국내도서">국내도서</option>
					<option value="해외도서">해외도서</option>
				</select>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 작가  </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<input type="text" name="author" id="author" placeholder="작가는 필수입니다. ">
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 출판사  </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<input type="text" name="publisher" id="publisher" placeholder="출판사는 필수입니다. ">
			</div>
		</div>
		 
		<div class="row mt-3">
			<div class="col-3">
				<span> 출판일  </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<input type="date" name="pblic_date" id="pblic_date" placeholder="출판일은 필수입니다. ">
			</div>
		</div>   
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 내용  </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<textarea name="book_content" id="book_content" maxlength="1000" placeholder="내용은 필수입니다. "> </textarea>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 수량  </span>
			</div>
			<div class="col-9">
				<input type="number" name="stock" id="stock" min="0" placeholder="미입력시 기본 10권 입니다. ">
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 가격  </span> <span id="star"> * </span>
			</div>
			<div class="col-9">
				<input type="number" id="book_price" name="book_price" min="0" placeholder="가격은 필수입니다. ">
			</div>
		</div>
		
		
		<div class="row mt-3">
			<div class="col-3">
				<span> 도서 이미지  </span> <span id="star"> * </span>
		<img id="preview" alt="미리보기" src="" class="mt-2">
			</div>
			<div class="col-9">
				<input type="text" name="book_img" id="book_img" oninput="readURL(this.value)" placeholder="이미지URL은 필수입니다. " >
			</div>
		</div>
			
		
		
		
		<div class="text-center mt-5">
			<button type="button" class="btn btn-primary mb-5" id ="Upload">도서 등록</button>
			<button type="reset" class="btn btn-primary mb-5">초기화</button>
		</div>
		
		<div>
		
		</div>
</section>
		
		</main>

</body>

  <!-- JavaScript  -->
    <script type="text/javascript" src="/resources/js/book_register.js"></script>
	
	<!-- J쿼리 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>
		

</html>