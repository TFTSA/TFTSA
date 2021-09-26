<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title></title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css" />
  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" rel="stylesheet" />
</head>

<body>

    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="main.do">
            <h3>
              Joson
            </h3>
            <span> college</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
  
       <!-- 로그인 안했을때  -->
 		<c:if test="${ sessionScope.loginMember eq null}">
          <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
            <ul class="navbar-nav  ml-auto">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/main.jsp' }">active</c:if>">
                <a class="nav-link" href="main.do">메인 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/about.jsp' }">active</c:if>">
                <a class="nav-link" href="about.do"> 과외찾기 </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/course.jsp' }">active</c:if>">
                <a class="nav-link" href="course.do"> 선생님 찾기 </a>
              </li>
              <li class="nav-item <%-- <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/event.jsp' }">active</c:if> --%>">
                <a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do?page=1"> 질문하기 </a>   
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/info.jsp' }">active</c:if>">
                <a class="nav-link" href="info.do"> 고객센터 </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/enrollPage.jsp' }">active</c:if>">
                <a class="nav-link" href="enrollPage.do">회원가입</a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/loginPage.jsp' }">active</c:if>">
                <a class="nav-link" href="loginPage.do">로그인</a>
              </li>
            </ul>
          </c:if>
          
        <!-- 관리자로 로그인 했을때 -->  
          <c:if
			test="${ !empty sessionScope.loginMember and sessionScope.loginMember.user_position eq 'M' }">
             <ul class="navbar-nav  ml-auto">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/main.jsp' }">active</c:if>">
                <a class="nav-link" href="main.do">메인 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/about.jsp' }">active</c:if>">
                <a class="nav-link" href="about.do"> 과외찾기 </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/course.jsp' }">active</c:if>">
                <a class="nav-link" href="course.do"> 선생님 찾기 </a>
              </li>
              <li class="nav-item  <%-- <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/event.jsp' }">active</c:if> --%> ">
                <a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do?page=1"> 질문하기 </a>   
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/info.jsp' }">active</c:if>">
                <a class="nav-link" href="info.do"> 고객센터 </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/contact.jsp' }">active</c:if>">
                <a class="nav-link" href="admin.do">관리자 페이지</a>
              </li>
              <li class="nav-item "><c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/loginPage.jsp' }">active</c:if>
                <a class="nav-link" href="logout.do">로그아웃</a>
              </li>
            </ul> 
            </c:if>
            
         <!-- 일반 회원이 로그인했을 때  -->
         <c:if test="${ !empty sessionScope.loginMember }">
             <ul class="navbar-nav  ml-auto">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/main.jsp' }">active</c:if>">
                <a class="nav-link" href="main.do">메인 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/about.jsp' }">active</c:if>">
                <a class="nav-link" href="about.do"> 과외찾기 </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/course.jsp' }">active</c:if>">
                <a class="nav-link" href="course.do"> 선생님 찾기 </a>
              </li>
              <li class="nav-item <%-- <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/event.jsp' }">active</c:if> --%>">
                <a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do?page=1"> 질문하기 </a>   
              </li>
              <li class="nav-item <%-- <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/info.jsp' }">active</c:if> --%>">
                <a class="nav-link" href="info.do"> 고객센터 </a>
              </li>
              
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/mypage/myPage.jsp' }">active</c:if>">
                <a class="nav-link" href="myPage.do?user_no=${loginMember.user_no }">마이페이지</a>
              </li>
              <li class="nav-item "><%-- <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/loginPage.jsp' }">active</c:if> --%>
                <a class="nav-link" href="logout.do">로그아웃</a>
              </li>

            </ul> 
          </c:if>
          
          <%-- <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
            <ul class="navbar-nav  ml-auto">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/main.jsp' }">active</c:if>">
                <a class="nav-link" href="main.do">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/about.jsp' }">active</c:if>">
                <a class="nav-link" href="about.do"> About </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/course.jsp' }">active</c:if>">
                <a class="nav-link" href="course.do"> Courses </a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/event.jsp' }">active</c:if>">
                <a class="nav-link" href="event.do"> Events </a>
              </li>
              <c:if test="${empty sessionScope.loginMember }">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/contact.jsp' }">active</c:if>">
                <a class="nav-link" href="contact.do">Contact us</a>
              </li>
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/loginPage.jsp' }">active</c:if>">
                <a class="nav-link" href="loginPage.do">Login</a>
              </li>
              </c:if>
              <c:if test="${!empty sessionScope.loginMember }">
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/mypage/myPage.jsp' }">active</c:if>">
                <a class="nav-link" href="myPage.do?user_id=${loginMember.user_id }">MyPage</a>
              </li>
              <li class="nav-item "><c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/member/loginPage.jsp' }">active</c:if>
                <a class="nav-link" href="logout.do">Logout</a>
              </li>
              </c:if>
            </ul>
           --%>
          
          
          
          
            <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
              <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
            </form>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
          

</body>
</html>
