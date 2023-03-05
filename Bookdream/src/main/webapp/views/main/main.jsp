<%@page import="com.spring.bookdream.vo.UserVO"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- CSS -->
    <link href="/resources/css/main.css" rel="stylesheet" />
    <!-- Bootstrap 5.0.2 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    
    <!-- Animate.css -->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
 	 />
 	 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
 	 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
 	
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
	

     <!-- Swiper -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
      <link rel="stylesheet" href="/resources/css/banner.css" />
	
    <title>북드림  | BookDream </title>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="/views/inc/header.jsp" />
      
      <div class="banner">
          <!-- Slider main container -->
          <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
              <!-- Slides -->
              <div class="swiper-slide">
                <a href="/getBook?book_no=988">
                  <div class="text-wrap slamdunk">
                    <h2>영감님의 영광의</h2>
                    <h2>시대는 언제였죠?</h2>
                    <p>SLAMDUNK</p>
                  </div>
                  <img
                    src="/resources/images/banner/banner_slamdunk.png"
                    alt="SLAMDUNK"
                  />
                </a>
              </div>
              <div class="swiper-slide">
                <a href="/getBook?book_no=989">
                  <div class="text-wrap trend">
                    <h2>#2023 #계묘년</h2>
                    <h2>무엇을 준비할 것인가?</h2>
                    <p>트렌드코리아2023</p>
                  </div>
                  <img
                    src="/resources/images/banner/banner_trend.png"
                    alt="TRENDKOREA2023"
                  />
                </a>
              </div>
              <div class="swiper-slide">
                <a href="/getBook?book_no=990">
                  <div class="text-wrap knowledge">
                    <h2>나는</h2>
                    <h2>웃지 않는 아이였다.</h2>
                  </div>
                  <img
                    src="/resources/images/banner/banner_amond.png"
                    alt="아몬드"
                  />
                </a>
              </div>
              <div class="swiper-slide">
                <a href="/getBook?book_no=992">
                  <div class="text-wrap economy">
                    <h2>넷플릭스 영화 원작소설</h2>
                    <h2>나는 덫에 걸렸다</h2>
                  </div>
                  <img
                    src="/resources/images/banner/banner_phone.png"
                    alt="스마트폰을 떨어트렸을 뿐인데"
                  />
                </a>
              </div>
              <div class="swiper-slide">
                <a href="/getBook?book_no=993">
                  <div class="text-wrap life">
                    <h2>나는 오래된 풍경처럼</h2>
                    <h2>너를 바라보고</h2>
                  </div>
                  <img
                    src="/resources/images/banner/banner_poem.png"
                    alt="나는 오래된 거리처럼 너를 사랑하고"
                  />
                </a>
              </div>
              <div class="swiper-slide">
                <a href="/getBook?book_no=991">
                  <div class="text-wrap life">
                    <h2>더 이상 고민하지 말고</h2>
                    <h2>그냥 재미있게 살아라!</h2>
                  </div>
                  <img
                    src="/resources/images/banner/banner_life.png"
                    alt="만일 내가 인생을 다시 산다면"
                  />
                </a>
              </div>
            </div>
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>

            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </div>

	<!-- <ul class="nav nav-tabs book-section-nav">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">베스트</a></li>
			<li class="nav-item"><a class="nav-link" href="#">신상품</a></li>
	</ul> -->
 	<main >
			
	
	 <!---------------------------베스트 셀러 상품 5개------------------------------
      -->
	<div class=" d-flex align-items-center flex-column ">
		
		<div style="height: 200px">
		</div>

			<span class="h1" data-aos="fade-down"
				data-aos-offset="0"
				data-aos-duration="1500"> 베스트 셀러 상품 </span>

		<div style="height: 50px">
		</div>
		
	<section class="row d-flex justify-content-around align-items-center" id="bestMain" >
	</section>	
		
		
		<div style="height: 100px">
		</div> 
		
		<section class="m-3 row " id="bestBook">
		</section>
     
    </div>
     
     <div style="height: 100px">
			</div> 
      
      <!---------------------------리뷰 많은 상품 5개------------------------------
      -->
	<div class=" d-flex align-items-center flex-column ">
			
			<div style="height: 200px">
			</div>
	
				<span class="h1" data-aos="fade-down"
					data-aos-offset="0"
					data-aos-duration="1500"> 리뷰 많은 상품 </span>
	
			<div style="height: 50px">
			</div>
			
		<section class="row d-flex justify-content-around align-items-center" id="besReviewtMain" >
		</section>	
			
			
			<div style="height: 100px">
			</div> 
			
			<section class="m-3 row " id="bestBookByReviewCount">
			</section>
	     
	    </div>
	    
	    
	    <div style="height: 100px">
			</div> 

	    
       <!---------------------------평점 높은 상품 5개------------------------------
       -->
       <div class=" d-flex align-items-center flex-column ">
			
			<div style="height: 200px">
			</div>
	
				<span class="h1" data-aos="fade-down"
					data-aos-offset="0"
					data-aos-duration="1500"> 평점 높은 상품  </span>
	
			<div style="height: 50px">
			</div>
			
		<section class="row d-flex justify-content-around align-items-center" id="bestGradeMain" >
		</section>	
			
			
			<div style="height: 100px">
			</div> 
			
			<section class="m-3 row " id="bestBookByReviewGrade">
			</section>
			
	     
	    </div>
        
       <div style="height: 100px">
			</div> 
      </main>


	<!-- ----------------------footer---------------------- -->
      <jsp:include page="/views/inc/footer.jsp" />
    
    </div>

	<script>
	  AOS.init();
	</script>
	
    <script type="text/javascript" src="/resources/js/main.js"></script>

    <!-- Script Bootstrap, jqurey-3.6.3 -->
    <script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <!-- Script FontAwesome-->
    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

    <!-- Script Bootstrap, jqurey-3.6.3 -->
    <script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <!-- Script FontAwesome-->
    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

	<!-- aniview 로드 -->
  	<script src="https://unpkg.com/jquery-aniview/dist/jquery.aniview.js"></script>

    <script>
         let user_no = <%=session.getAttribute("user_no")%>;
      <%@include file="/resources/js/cartLIstCount.js"%>
    </script>

    <!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- Banner JS -->
    <script src="/resources/js/banner.js"></script>
  </body>
</html>
