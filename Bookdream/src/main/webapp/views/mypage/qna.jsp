<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/qna.css" />
<title>1:1문의</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/views/inc/header.jsp" />


		<div class="container">

			<div class="main">

				<jsp:include page="/views/inc/mypage_side.jsp" />
				
				<div class="rside">
					<div class="qna_header">
						<div class="qna_title">1:1 문의</div>
						<button class="qna_button btn btn-success" type="button" onclick="location.href='/views/mypage/qna_write.jsp'">1:1문의하기</button>
					</div>
					
					<div class="qna_body">
					<hr>
						<c:choose>
							<c:when test="${empty myQnAList }">
								<p>문의 내역이 없습니다.</p>
							</c:when>
							<c:when test="${!empty myQnAList }">
								<c:forEach var="list" items="${ myQnAList}">
									<table class="table table-borderless">
										<tr>
											<td width="20%">
											<fmt:formatDate value="${list.getReg_date() }" pattern="yy-MM-dd" />
											<fmt:formatDate value="${list.getReg_date() }" pattern="HH:mm" />
											</td>
											<td width="65%">
												 <span class="qna_list_title" id="qna_title" name="qna_title">${list.getQna_title() }</span>
											</td>
											<c:choose>
												<c:when test="${list.getAns_check() == '0' }">
													<td width="10%">
														문의접수
													</td>
													<td width="5%">
														<i class="drop_btn bi bi-arrow-down-short" data-bs-toggle="collapse" data-bs-target="#collapseEx${list.getQna_no() }"
										aria-expanded="false" aria-controls="collapseEx${list.getQna_no() }"></i>
													</td>
												</c:when>
												<c:otherwise>
													<td width="10%">
														답변완료
													</td>
													<td width="5%">
														<i class="drop_btn bi bi-arrow-down-short" data-bs-toggle="collapse" data-bs-target="#collapseEx${list.getQna_no() }"
										aria-expanded="false" aria-controls="collapseEx${list.getQna_no() }"></i>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>

									<c:choose>
										<c:when test="${list.getAns_check() == '0' }">
										<!-- 답변대기 -->
											<div class="collapse" id="collapseEx${list.getQna_no() }">
												<div class="card card-body" id="qna_content" name="qna_content">${list.getQna_content() }</div>
													<div class="qna_sumbmit">
														<div class="qna_submit_btn">
															<div class="qna_update_btn">
																<button class="btn btn-secondary" type="button"
																	onclick="location.href='getQnA?qna_no=${list.getQna_no() }'">수정</button>
															</div>
															<div class="qna_delete_btn">
																<button class="btn btn-secondary" type="button"
																	onclick="delete_btn(${list.getQna_no() })">삭제</button>
															</div>
														</div>
													</div>
													<hr>
												</div>
										</c:when>
										<c:otherwise>
										<!-- 답변완료  -->
											<div class="collapse" id="collapseEx${list.getQna_no() }">
												<span class="ans_text">문의 내용</span>
												<div class="card card-body" id="qna_content" name="qna_content">${list.getQna_content() }</div>
												<br>
												<span class="ans_text">답변</span>
												<div class="card card-body" id="ans_content" name="ans_content">
													<c:forEach var="anslist" items="${ansMyList }">
														<c:choose>
															<c:when test="${list.getQna_no() eq anslist.getQna_no() }">
															${anslist.getAns_content() }
															</c:when>
														</c:choose>
													</c:forEach>
												</div>
												<hr>
											</div>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>

			</div>


		</div>
		
		<jsp:include page="/views/inc/footer.jsp" />
	</div>

	<script src="/resources/js/qna.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	<script>
		let user_no =
	<%=(int) session.getAttribute("user_no")%>
		;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>

	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</body>
</html>