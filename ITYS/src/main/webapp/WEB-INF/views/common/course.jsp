<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

  <title>Joson</title>

</head>

<body class="sub_page">
  <div class="hero_area">
    
    <c:import url="/WEB-INF/views/common/menubar.jsp" />
    
  </div>

  <!-- course section -->

  <section class="course_section layout_padding">
    <div class="side_img">
      <img src="${ pageContext.servletContext.contextPath }/resources/images/side-img.png" alt="" />
    </div>
    <div class="container">
      <div class="heading_container">
        <h3>
          POPULAR COURSES
        </h3>
        <p>
          It is a long established fact that a reader will be distracted
        </p>
      </div>
      <div class="course_container">
        <div class="course_content">
          <div class="box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/c-1.jpg" alt="" />
            <a href="" class="">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/link.png" alt="" />
            </a>
            <h5>
              LMS <br />
              Content
            </h5>
          </div>
          <div class="box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/c-2.jpg" alt="" />
            <a href="" class="">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/link.png" alt="" />
            </a>
            <h5>
              From <br />
              Zero to Hero
            </h5>
          </div>
        </div>
        <div class="course_content">
          <div class="box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/c-3.jpg" alt="" />
            <a href="" class="">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/link.png" alt="" />
            </a>
            <h5>
              Learn <br />
              Python – Interactive
            </h5>
          </div>
          <div class="box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/c-4.jpg" alt="" />
            <a href="" class="">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/link.png" alt="" />
            </a>
            <h5>
              Your <br />
              Complete Guide
            </h5>
          </div>
          <div class="box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/c-5.jpg" alt="" />
            <a href="" class="">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/link.png" alt="" />
            </a>
            <h5>
              Photography
            </h5>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <a href="">
          Read More
        </a>
      </div>
    </div>
  </section>

  <!-- end course section -->

  <c:import url="/WEB-INF/views/common/footer.jsp" />

</body>

</html>