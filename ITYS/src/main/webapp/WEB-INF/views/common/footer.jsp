<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<!-- info section -->
  <section class="info_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="info_menu">
            <h5>
              메뉴
            </h5>
            <ul class="navbar-nav  ">
              <li class="nav-item active">
                <a class="nav-link" href="main.do">메인 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.do"> 과외찾기 </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="course.do"> 선생님 찾기 </a>
              </li>
              <li class="nav-item">
              	<a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do?page=1"> 질문하기 </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="info.do"> 고객센터 </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="enrollPage.do">회원가입</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="loginPage.do">로그인</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_course">
            <h6>
              (주)itys
            </h6>
            <p><font size=2>
              사업자등록번호: 012-34-56789<br>
              서울시 마포구 양화로 127, 첨단빌딩 7층<br>
              통신판매업신고증: 제2021-서울강남-00001 호
            </font></p>
          </div>
        </div>

        <div class="col-md-5 offset-md-1">
          <div class="info_news">
            <h5>
              도움이 필요하신가요?
            </h5>
            <div class="info_contact">
            	<ul>
            		<li>iyts1001@finalproject.com</li>
            		<li>02) 123 - 4567</li>
            		<li>운영시간 : 평일 오전 10시 - 오후 6시 <br>
            		(점심시간: 오후 1시 - 2시) <br>
            		(주말 & 공휴일 제외)</li>
            	</ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end info section -->

  <!-- footer section -->
  <footer class="container-fluid footer_section">
    <p>
      &copy; 2021 All Rights Reserved By
      <a href="https://html.design/">Free Html Templates</a>
    </p>
  </footer>

  <footer class="container-fluid footer_section">
  
    <p>
      Distributed By 
      <a href="https://themewagon.com/">Themewagon</a>
    </p>

</footer>
  <!-- footer section -->

  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.js"></script>

</body>

</html>