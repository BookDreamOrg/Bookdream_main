<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<!-- 자동검색 시 사용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<style>

#ui-id-1 {
   border: 10px solid rgba(black, .1);
    border-radius: 15px;
     display: grid;
     font-size: 20px;
     width: 50%;
     
}
.ui-menu-item-wrapper {
}
.ui-menu-item-wrapper:hover,.ui-state-active {
 background-color: var(--main-color-tint1);
}

</style>


<body>
   <% 
      int book_no = (int) (Math.random() * 100) + 1;
   %>
   
   <%
      String id = (String)session.getAttribute("user_id");
      String kakaoN = (String)session.getAttribute("kakaoName");
      String flatform = (String)session.getAttribute("flatform");

      UserVO user = (UserVO)session.getAttribute("authUser");
      if(user == null){      
   %>
      <div class="wrapper">
      <header>
         <div class="header-nav-list">
            <ul class="nav header-nav">
               <li class="nav-item"><a class="nav-link header-nav-link"
                  aria-current="page" href="/views/user/join.jsp">회원가입</a></li>
               <span class="nav-bar-line"></span>
               <li class="nav-item"><a class="nav-link header-nav-link"
                  href="/views/user/login.jsp">로그인</a></li>
               <span class="nav-bar-line"></span>
               <li class="nav-item"><a class="nav-link header-nav-link"
                  href="#">고객센터</a></li>
               <span class="nav-bar-line"></span>
               <li class="nav-item"><a
                  class="nav-link header-nav-link" href="/views/admin/admin.jsp">관리자 </a></li>
            </ul>
         </div>
         <div class="row d-flex header-row">
            <div class="col-lg-1 p-2 header-col-home mr-2 mb-1">
               <a href="#"> <img class="header-row-logo ms-4 mb-1"
                  src="/resources/images/logo/logo_white.png" alt="logo_white" /> <img
                  class="header-row-logo_text"
                  src="/resources/images/logo/logo_text.png" alt="logo_text" />
               </a>
            </div>
            <div class="col-lg-1 p-5 flex-grow-1 header-col-btn">
               <a href="/itemorder/cart/list">
                  <div class="header-btn">
                     <i class="fa-solid fa-cart-shopping"></i>
                  </div>
               </a> <a href="/detail/cart/orderitem">
                  <div class="header-btn btn-circle ms-3">
                     <i class="fa-solid fa-user"></i>
                  </div>
               </a>
            </div>
            <form action="/bookListSearchByKeyword" method="get">
            <div class="col-lg-6 p-2 header-col-search input-group">
               <div class="input-group mb-2 col-search">
                  <button
                     class="btn btn-outline-secondary dropdown-toggle search-toggle"
                     type="button" data-bs-toggle="dropdown" aria-expanded="false">
                     통합검색</button>
                  <ul class="dropdown-menu">
                     <li><a class="dropdown-item" href="#">베스트</a></li>
                     <li><a class="dropdown-item" href="#">신상품</a></li>
                  </ul>
                  <input type="text" name="keyword" id="keyword_text" class="form-control search-input"
                     aria-label="Text input with dropdown button"
                     placeholder="성공적인 프로젝트를 위하여!!👍" />
                  <button type="submit"  class="btn btn-outline-secondary" id="input-group-button-right">검색</button>
               </div>
            </div>
            </form>
            
         </div>
      
   <% 
      } else{ // 로그인 시
   %>
      <div class="wrapper">
      <header>
         <div class="header-nav-list">
            <ul class="nav header-nav">
               <%
                  if(user.getFlatform_type().equals("KAKAO")){ // 카카오 로그아웃
               %>
                  <li class="nav-item"><a class="nav-link header-nav-link"
                  href="https://kauth.kakao.com/oauth/logout?client_id=47ad839005d8b9a94d3007b30a956894&logout_redirect_uri=http://localhost:8000/views/user/kakaoLogout">로그아웃</a></li>
               <span class="nav-bar-line"></span>
               <% 
                  } else if(user.getFlatform_type().equals("google")) { // google 로그아웃
               %>
                  <li class="nav-item"><a class="nav-link header-nav-link"
                  href="/views/user/logout.do">로그아웃</a></li>
               <span class="nav-bar-line"></span>
               <% 
                  } else if(user.getFlatform_type().equals("naver")) { // naver 로그아웃
               %>
                  <li class="nav-item"><a class="nav-link header-nav-link"
                  href="/views/user/logout.do">로그아웃</a></li>
               <span class="nav-bar-line"></span>
               <% 
                  } else { // 기존 로그아웃
               %>
                  <li class="nav-item"><a class="nav-link header-nav-link"
                  href="/views/user/logout.do">로그아웃</a></li>
               <span class="nav-bar-line"></span>
               <% 
                  }
               %>
               
               <li class="nav-item"><a class="nav-link header-nav-link"
                  href="#">고객센터</a></li>
               <span class="nav-bar-line"></span>
               <li class="nav-item"><a class="nav-link header-nav-link"
                  href="/views/mypage/mypage.jsp">마이페이지</a></li>
               <span class="nav-bar-line"></span>
               <li class="nav-item"><a
                  class="nav-link header-nav-link disabled" href="#" tabindex="-1"
                  aria-disabled="true"> 관리자 </a></li>
            </ul>
         </div>
         <div class="row d-flex header-row">
            <div class="col-lg-1 p-2 header-col-home mr-2 mb-1">
               <a href="#"> <img class="header-row-logo ms-4 mb-1"
                  src="/resources/images/logo/logo_white.png" alt="logo_white" /> <img
                  class="header-row-logo_text"
                  src="/resources/images/logo/logo_text.png" alt="logo_text" />
               </a>
            </div>
            
            <div class="col-lg-1 flex-grow-1 header-col-btn">
<!--  cart btn -------------------------- -->
               <button type="button" class="header-btn btn position-relative p-1" 
                        onclick="location.href='/itemorder/cart/list'">
                  <i class="fa-solid fa-cart-shopping"></i>
                     <span id="cartListCount" class="position-absolute top-0 start-100 translate-middle
                             badge rounded-pill bg-danger fs-6 "> 
                             ${cartListCount}
                          <span class="visually-hidden">User Cart List Count</span>
                       </span>
               </button>
               <input id="user_no" value="${user.user_no}" type="hidden">
               <a href="/detail/cart/orderitem">
                  <div class="header-btn btn-circle ms-3">
                     <i class="fa-solid fa-user"></i>
                  </div>
               </a>
            </div>
         </div>
            
            <form action="/bookListSearchByKeyword" method="get">
            <div class="col-lg-6 p-2 mb-2 header-col-search input-group">
               <div class="input-group mb-2 col-search">
                  <button
                     class="btn btn-outline-secondary dropdown-toggle search-toggle"
                     type="button" data-bs-toggle="dropdown" aria-expanded="false">
                     통합검색</button>
                  <ul class="dropdown-menu">
                     <li><a class="dropdown-item" href="#">베스트</a></li>
                     <li><a class="dropdown-item" href="#">신상품</a></li>
                  </ul>
                  <input type="text" name="keyword" id="keyword"  class="form-control search-input"
                     aria-label="Text input with dropdown button"
                     placeholder="성공적인 프로젝트를 위하여!!👍" />
                  <button type="submit"  class="btn btn-outline-secondary" id="input-group-button-right">검색</button>
               </div>
            </div>
            </form>
            
      
   <%
      }
   %>
   
         <div class="header-menu mb-1">
            <div class="btn-circle btn-circle-tint">
               <i class="fa-solid fa-bars"></i>
            </div>
            <ul class="nav header-menu-list">
               <li class="nav-item">
                  <form action="/getBook" method="get" id="go_detail">
                  <input type="hidden" name="book_no" value="<%=book_no%>">
               </form>
               <a class="nav-link menu-link" onclick="document.getElementById('go_detail').submit();" >베스트</a></li>
               </li>
               <div class="dot"></div>
               <li class="nav-item"><a class="nav-link menu-link" href="#">신상품</a>
               </li>
               <div class="dot"></div>
               <li class="nav-item"><a class="nav-link menu-link" href="#">이벤트</a>
               </li>
               <div class="dot"></div>
               <li class="nav-item"><a class="nav-link menu-link disabled"
                  href="#" tabindex="-1" aria-disabled="true">Disabled</a></li>
            </ul>
         </div>
      </header>
      </div>
      
      



<!-- 자동검색 기능 js -->
<script type="text/javascript" charset="UTF-8" >
<%@include file="/views/inc/viewSearchKeyword.js"%>
</script>

         
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
         
<!-- 자동 검색시 필요 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>



</html>


