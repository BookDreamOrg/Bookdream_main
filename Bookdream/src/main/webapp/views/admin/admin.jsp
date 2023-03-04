<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jstl/core_rt"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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

  <head>
    <meta charset="UTF-8" />
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

    <link rel="stylesheet" href="/resources/css/admin_qnadashboard.css" />

    <title>Admin Page</title>

    <style type="text/css">
      .biv_box {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 300px; /* 부모 요소의 높이 값 */
      }

      .biv_box > div {
        width: 100%;
        height: 33%;
        margin: 10px;
        font-size: 12px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        cursor: pointer;
      }

      .biv_box > div:nth-child(1) {
        border-left: 5px solid #36a2eb;
        background-color: rgba(54, 162, 235, 0.1);
      }

      .biv_box > div:nth-child(1):hover {
        background-color: rgba(54, 162, 235, 0.2);
      }

      .biv_box > div:nth-child(2) {
        border-left: 5px solid #ff6384;
        background-color: rgba(255, 99, 132, 0.1);
      }

      .biv_box > div:nth-child(2):hover {
        background-color: rgba(255, 99, 132, 0.2);
      }

      .biv_box > div:nth-child(3) {
        border-left: 5px solid #4bc0c0;
        background-color: rgba(75, 192, 192, 0.1);
      }

      .biv_box > div:nth-child(3):hover {
        background-color: rgba(75, 192, 192, 0.2);
      }

      .dshbr_title {
        font-weight: bold;
        font-size: 12px;
        margin: 0px 0px 10px 10px;
      }

      .dshbr_content {
        margin-left: 10px;
        line-height: 180%;
      }

      .dshbr_content > span {
        color: #484877;
        font-weight: bold;
        font-size: 20px;
      }

      .dshbr_content > div {
        display: inline-block;
      }

      /* */

      .bell_icon {
        margin-left: 5px;
      }

      .bell_icon.shaking {
        transform-origin: 50% 0%;
        animation-name: shake;
        animation-duration: 2s;
        animation-iteration-count: infinite;
        animation-delay: 0.5s;
        color: red;
      }

      @keyframes shake {
        0% {
          transform: rotate(0deg);
        }
        10% {
          transform: rotate(45deg);
        }
        20% {
          transform: rotate(-45deg);
        }
        30% {
          transform: rotate(30deg);
        }
        40% {
          transform: rotate(-30deg);
        }
        50% {
          transform: rotate(10deg);
        }
        60% {
          transform: rotate(-10deg);
        }
        70% {
          transform: rotate(0deg);
        }
        100% {
          transform: rotate(0deg);
        }
      }
    </style>
  </head>

  <body class="admin_body">
    <jsp:include page="/views/inc/admin_aside.jsp" />
    <main class="container-fluid main_container">
      <div class="section_div">
        <section class="todo_list">
          <div class="card">
            <div class="card-header">도서 일일 판매량(주간)</div>
            <div class="card-body">
              <div class="container">
                <canvas id="Book_Order_qty_chart" style="width: 35em"></canvas>
              </div>
            </div>
          </div>
        </section>
        <section class="calandar">
          <div class="card">
            <div class="card-header">Featured</div>
            <div class="card-body">
              <h5 class="card-title">Special title treatment</h5>
              <p class="card-text">
                With supporting text below as a natural lead-in to additional
                content.
              </p>
            </div>
          </div>
        </section>
        <section class="qna">
          <div class="card">
            <div class="card-header">
              <div class="qna-title-header">
                <div class="qna-title-header-left">
                  <a href="/admin/user/QnADashBoard">문의 대시보드</a>
                </div>
                <div class="qna-title-header-right">
                  <a href="/admin/user/getAllQnAList">+더보기</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="list-group">
                <c:forEach items="${qnaAllList }" var="list" varStatus="vs">
                  <div class="qna-Alllist">
                    <div class="qna-dashboardList">
                      <a
                        href="#"
                        class="list-group-item-qna list-group-item-action"
                        >${list.getQna_title() }</a
                      >

                      <span class="qna_list_title" id="user_id" name="user_id">
                        <c:set var="flag" value="false" />
                        <c:forEach var="userlist" items="${userList }">
                          <c:choose>
                            <c:when
                              test="${list.getUser_no() eq userlist.getUser_no() && not flag }"
                            >
                              <c:set var="flag" value="true" />
                              <c:choose>
                                <c:when
                                  test="${userlist.getUser_id() eq null }"
                                >
                                  <div class="qna-dashboardlist-name">
                                    ${userlist.getUser_name() }님
                                    <span class="nav-bar-line"></span>
                                    ${list.getReg_date() }
                                  </div>
                                </c:when>
                                <c:otherwise>
                                  <div class="qna-dashboardlist-name">
                                    ${userlist.getUser_id() }
                                    <span class="nav-bar-line"></span>
                                    ${list.getReg_date() }
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
                        <c:when test="${list.getAns_check() eq 1}">
                          <!-- 답변 1이면 답변 완료 -->
                          <div class="qna-dashboardlist-name">답변완료</div>
                        </c:when>
                        <c:otherwise>
                          <div class="qna-dashboardlist-name">답변대기</div>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </section>
        <section class="content_review">
          <div class="card">
            <div class="card-header">배송 현황</div>
            <div class="card-body">
              <div class="biv_box">
                <div class="href_biv">
                  <div class="dshbr_title">
                    결제완료
                    <span
                      class="fa fa-bell bell_icon"
                      id="pymntCmplt_icon"
                    ></span>
                  </div>
                  <div class="dshbr_content">
                    결제가 완료된 상품은 모두
                    <span id="pymntCmplt">0</span> 건입니다. &nbsp;
                    <div id="pymntCmplt_text"></div>
                  </div>
                  <input type="hidden" value="0" />
                </div>

                <div class="href_biv">
                  <div class="dshbr_title">
                    취소요청
                    <span
                      class="fa fa-bell bell_icon"
                      id="pymcnRqst_icon"
                    ></span>
                  </div>
                  <div class="dshbr_content">
                    결제 취소 요청이 접수된 상품은 모두
                    <span id="pymcnRqst">0</span> 건입니다. &nbsp;
                    <div id="pymcnRqst_text"></div>
                  </div>
                  <input type="hidden" value="10" />
                </div>

                <div class="href_biv">
                  <div class="dshbr_title">
                    반품요청
                    <span
                      class="fa fa-bell bell_icon"
                      id="rqstRtrn_icon"
                    ></span>
                  </div>
                  <div class="dshbr_content">
                    반품 요청이 접수된 상품은 모두
                    <span id="rqstRtrn">0</span> 건입니다. &nbsp;
                    <div id="rqstRtrn_text"></div>
                  </div>
                  <input type="hidden" value="12" />
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>

    <!-- Script Bootstrap, jqurey-3.6.3 -->
    <script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <!-- Script FontAwesome-->
    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <!-- J쿼리 -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- JavaScript  -->
    <script type="text/javascript" src="/resources/js/admin_main.js"></script>
    <script
      type="text/javascript"
      src="/resources/js/commonFunction.js"
    ></script>
  </body>
</html>
