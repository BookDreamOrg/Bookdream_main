<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://js.tosspayments.com/v1/payment"></script>
  
</head>

<body>

	<c:choose>
		<c:when test="${fn:length(orderitemList) != 1}">
			<c:set var="first_title" value="${orderitemList[0].bookVO.title} 외  ${orderitemCount[0].total_count - 1} 종"></c:set>
		</c:when>		
		<c:otherwise >
			<c:set var="first_title" value="${orderitemList[0].bookVO.title}"></c:set>
		</c:otherwise>
	</c:choose>	



</body>

</html>


