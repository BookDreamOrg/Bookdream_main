<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
	<!---------------------------- 도서 등록 ------------------------------------>
		<section class="mb-5 mt-5" >
		<div class="h3 mb-3" id="section_title1"  >도서 등록</div>
		<hr>
		</section>
		
<section>
	<form action="/book_register" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-6">
				<span> 도서 제목 </span>
			</div>
			<div class="col-6">
				<input type="text" id="title" name="title">
				<span>* 필수 입력 </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 국제표준 도서번호(ISBN) </span>
			</div>
			<div class="col-6">
				<input type="number" name="isbn_no" id="isbn_no" min="0" maxlength="13">
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 카테고리 </span>
			</div>
			<div class="col-6">
				<select name="book_category" id="book_category">
					<option value="국내도서">국내도서</option>
					<option value="해외도서">해외도서</option>
				</select>
				<span>* 필수 선택 </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 작가  </span>
			</div>
			<div class="col-6">
				<input type="text" name="author" id="author" required="required">
				<span>* 필수입력  </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 출판사  </span>
			</div>
			<div class="col-6">
				<input type="text" name="publisher" id="publisher" required="required">
				<span>* 필수 입력 </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 출판일  </span>
			</div>
			<div class="col-6">
				<input type="date" name="pblic_date" id="pblic_date" required="required">
				<span>* 필수 선택 </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 내용  </span>
			</div>
			<div class="col-6">
				<textarea name="book_content" id="book_content" cols="50" rows="5" maxlength="1000"> </textarea>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 수량  </span>
			</div>
			<div class="col-6">
				<input type="number" name="stock" id="stock" min="0">
				<span>* 미입력시 기본 10권 </span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-6">
				<span> 가격  </span>
			</div>
			<div class="col-6">
				<input type="number" id="book_price" name="book_price" min="0" required="required">
				<span>* 필수 입력 </span>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-6">
				<span> 도서 이미지  </span>
			</div>
			<div class="col-6">
				<input type="file" name="file" id="file" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)" required="required">
				<span>* 필수 입력 </span>
				<img id="preview" alt="미리보기" src="">
			</div>
		</div>
		
		
		
		<div class="text-center mt-5">
			<button type="submit" class="btn" value="Upload">도서 등록</button>
			<button type="reset" class="btn">초기화</button>
		</div>
	</form>
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