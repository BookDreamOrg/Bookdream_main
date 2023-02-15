<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="/resources/css/admin_qnaanswer.css" />
    
<title>Admin Page</title>
</head>
<body class="admin_body">
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
					<a href="#">관리자</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user"></i></span> <span class="list_text"><a href="#">프로필 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-arrow-up-right-from-square"></i></span> <span
					class="list_text"><a href="#">사이트 바로가기</a></span></li>
			</ul>
		</div>
		<div class="aside_product">
			<div class="aside_product_title">제품관리</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_product_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-border-all"></i></span> <span class="list_text"><a href="#">대시보드</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user-gear"></i></span><span class="list_text"><a href="#">사용자 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-pen-to-square"></i></span> <span class="list_text"><a href="#">제품 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bullhorn"></i></span> <span class="list_text"><a href="#">결제 관리</a></span></li>
			</ul>
		</div>
		<div class="aside_resource">
			<div class="aside_resource_title">고객지원</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_resource_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bug"></i></span> <span class="list_text"><a href="#">버그 및 신고</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-comment"></i></span> <span class="list_text"><a href="/admin/getAllQnAList">문의 사항</a></span>
				</li>
			</ul>
		</div>
		<!-- <div class="thema">
        <div class="thema_color"></div>
        <div class="thema_color_btn">테마변경</div>
      </div> -->
	</div>
	<main class="container-fluid main_container"> <header
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
	<!------------------------------------- Main --------------------------------------------->
	<div class="section_div">
				<div class="card-body">
					<div class="admin_answer_title card-title">1:1문의 답변</div>
				</div>
	</div>
	
	
		<div class="container">

			<div class="main">

					<div class="qna_body">
						<c:choose>
							<c:when test="${empty qnaAllList }">
								<p class="ans_main_content">답변 받은 내역이 없습니다.</p>
							</c:when>
							<c:when test="${!empty qnaAllList }">
								<c:forEach var="list" items="${ qnaAllList}" varStatus="vs">
									<div>
										<div>
											<table class="table table-borderless">
												<tr>
													<td width="10%">
														${list.getReg_date() }
													</td>
													<td width="20%">
														문의한 유저: <span class="qna_list_title" id="user_id" name="user_id">${qna_user.getUser_id() }</span>
													</td>
													<td width="65%">
														<span class="qna_list_title" id="qna_title" name="qna_title">${list.getQna_title() }</span> 
													</td>
													<td width="5%">
														<i class="drop_btn bi bi-arrow-down-short"data-bs-toggle="collapse" data-bs-target="#collapseEx${list.getQna_no() }" 
														aria-expanded="false" aria-controls="collapseEx${list.getQna_no() }"></i>
													</td>
												</tr>
											</table>
											
										</div>
									</div>

									<div class="collapse" id="collapseEx${list.getQna_no() }">
										<div class="card card-body" id="qna_content"
											name="qna_content">${list.getQna_content() }</div>
										<div class="qna_sumbmit">
											<div class="qna_submit_btn">
												<button type="button" class="btn btn-primary"
													data-bs-toggle="modal"
													data-bs-target="#ModalQnA${vs.index }">답변</button>
												<input class="qna_nocls" type="hidden" value="${list.getQna_no() }">

												<!------------------------- Modal ------------------------------>
												<div class="modal fade" id="ModalQnA${vs.index }"
													tabindex="-1" aria-labelledby="ModalLabel"
													aria-hidden="true">
													
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="ModalLabel">답변하기</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<textarea class="form_textarea" id="ans_content${vs.index }"
																	name="ans_content" maxlength="500"
																	style="width: 465px; height: 246px"></textarea>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-primary" id="ans_btn${list.getQna_no() }"
																	data-bs-dismiss="modal" onclick='answer_btn(${list.getUser_no() },${vs.index })'>답변</button>
															</div>
														</div>
													</div>
											
												</div>
											</div>
										</div>
										<hr>
									</div>

								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				
			</div>
		</div>
	</main>
	<script src="/resources/js/admin_qnaanswer.js"></script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
	
	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
</body>
</html>