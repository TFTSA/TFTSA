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
		  
          <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
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
              <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/contact.jsp' }">active</c:if>">
                <a class="nav-link" href="contact.do">Contact us</a>
              </li>
             <li class="nav-item <c:if test="${ pageContext.request.requestURI eq '/itys/WEB-INF/views/common/detail.jsp' }">active</c:if>">
                <a class="nav-link" href="login.do">Login</a>
              </li>
               
            </ul>
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