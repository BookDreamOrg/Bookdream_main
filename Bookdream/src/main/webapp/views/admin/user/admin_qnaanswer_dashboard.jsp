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
    
    <style type="text/css">
    
    	.qna-title-header{
    		display: flex;
    		justify-content: space-between;
    	}
    	
    	.qna-Alllist{
    		display:flex;
    		justify-content: space-between;
    	}
    	.qna-dashboardList{
    		margin: 10px;
    	}
    	.list-group-item-qna{
    		font-size: 16px;
    		font-weight: 700;
    	}
    	.qna-dashboardlist-name{
    		font-size: 12px;
    		margin-top: 3px;
    	}
    	.answerCheck{
    		margin: 10px;
    	}
    </style>
<title>Admin Page</title>
</head>
<body class="admin_body">
<jsp:include page="/views/inc/admin_aside.jsp"/>
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
	<a href="/admin/user/QnADashBoard">문의 대시보드</a>
	<div class="section_div">
		<section class="today_state">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">오늘의 할일</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
		<section class="todo_list">
			<div class="card">
				<div class="card-header">
					<div class="qna-title-header">
						<div class="qna-title-header-left">문의사항</div>
						<div class="qna-title-header-right"><a href="/admin/user/getAllQnAList">+더보기</a></div>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<c:forEach items="${qnaAllList }" var="list" varStatus="vs">
						
						<div class="qna-Alllist">
							<div class="qna-dashboardList">
								<a href="#" class="list-group-item-qna list-group-item-action">${list.getQna_title() }</a>

							 <span class="qna_list_title" id="user_id" name="user_id">
								<c:set var="flag" value="false"/>
									<c:forEach var="userlist" items="${userList }">
											<c:choose>
												<c:when test="${list.getUser_no() eq userlist.getUser_no() && not flag }">
													<c:set var="flag" value="true"/>
													<c:choose>
														<c:when test="${userlist.getUser_id() eq null }">
															<div class="qna-dashboardlist-name">
																${userlist.getUser_name() }님 <span class="nav-bar-line"></span> ${list.getReg_date() }
															</div>
														</c:when>
														 <c:otherwise>
														 	<div class="qna-dashboardlist-name">
														 		${userlist.getUser_id() } <span class="nav-bar-line"></span> ${list.getReg_date() }
														 	</div>
														 </c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
										</c:forEach>
							</span>
							</div>
							<div class="answerCheck">
							 	<c:choose>
									<c:when test="${list.getAns_check() eq 1}"> <!-- 답변 1이면 답변 완료 -->
										<div class="qna-dashboardlist-name">
											답변완료
										</div>
									</c:when>
									 <c:otherwise>
									 	<div class="qna-dashboardlist-name">
											답변대기
										</div>
									 </c:otherwise>
								</c:choose>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<section class="calandar">
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
		<section class="qna">
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
		<section class="content_review">
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
				</div>
			</div>
		</section>
	</div>
	</main>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
</body>
</html>