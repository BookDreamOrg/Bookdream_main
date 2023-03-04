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
		<jsp:include page="/views/inc/admin_aside.jsp"/>
	
	<main class="container-fluid main_container">
		<section class="mb-3 mt-3">
		<div class="h3 mb-3" id="admin_section_title">답변완료</div>
		<hr>
	</section>
	<!------------------------------------- Main --------------------------------------------->
		<div class="container">

			<div class="main">

					<div class="qna_body">
						<c:choose>
							<c:when test="${empty qnaAllList }">
								<p class="ans_main_content">답변한 내역이 없습니다.</p>
							</c:when>
							<c:when test="${!empty qnaAllList }">
								<table class="table">
									<tr>
										<th width="10%">문의 일자</th>
										<th width="20%">문의한 유저</th>
										<th width="70%">문의 제목</th>
									</tr>
								</table>
								<c:forEach var="list" items="${ qnaAllList}" varStatus="vs">
									<div>
										<div>
											<table class="table">
												
												<tr>
													<td width="10%">
														${list.getReg_date() }
													</td>
													<td width="20%">
														<span class="qna_list_title" id="user_id" name="user_id">
															<c:set var="flag" value="false"/>
																<c:forEach var="userlist" items="${userList }">
																		<c:choose>
																			<c:when test="${list.getUser_no() eq userlist.getUser_no() && not flag}">
																				<c:set var="flag" value="true"/>
																				<c:choose>
																					<c:when test="${userlist.getUser_id() eq null }">
																						${userlist.getUser_name() }님
																					</c:when>
																					 <c:otherwise>
																					 		${userlist.getUser_id() }
																					 </c:otherwise>
																				</c:choose>
																			</c:when>
																		</c:choose>
																</c:forEach>
														</span>
													</td>
													<td width="55%">
														<span class="qna_list_title" id="qna_title" name="qna_title">${list.getQna_title() }</span> 
													</td>
													<td width="10%">
														<span class="qna_list_title" id="qna_title" name="qna_title">답변완료
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
										<div class="card card-body" id="qna_content" name="qna_content">
											${list.getQna_content() }
										</div>
										<hr>
									</div>
								</c:forEach>
								
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:forEach begin="1" end="${ pageNum }" var="num">
													<li class="page-item"><a class="page-link"
												href="getClearQnAList?pageNum=${num }">${ num }</a></li>
										</c:forEach>
									</ul>
								</nav>
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