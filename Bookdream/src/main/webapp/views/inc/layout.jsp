<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ----------------------- tiles 라이즈러리------------------------- -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 소스 file 연결-->
<link rel="css" href="/resources/css/styles.css" />
<link rel="js" href="/resources/js" />
<link rel="resources" href="/resources/" />

<!-- ---------------------------<title>------------------------------ -->
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	
	<!-- ---------------------------<header>---------------------------- -->
	<tiles:insertAttribute name="header" />

	<section>
		<!-- ---------------------------<body>---------------------------- -->
		<tiles:insertAttribute name="body" />
		
		<!-- ---------------------------<aside>--------------------------- -->
		<tiles:insertAttribute name="aside" />

	</section>

	<!-- ---------------------------<footer>---------------------------- -->
		<tiles:insertAttribute name="footer" />
	
</body>
</html>