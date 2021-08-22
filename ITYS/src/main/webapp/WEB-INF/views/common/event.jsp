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
    
    <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
    
  </div>

  <!-- event section -->
  <section class="event_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h3>
          Events
        </h3>
        <p>
          Upcoming Education Events to feed your brain.
        </p>
      </div>
      <div class="event_container">
        <div class="box">
          <div class="img-box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/event-img.jpg" alt="" />
          </div>
          <div class="detail-box">
            <h4>
              Education Events 2021
            </h4>
            <h6>
              8:00 AM - 5:00 PM VENICE, ITALY
            </h6>
          </div>
          <div class="date-box">
            <h3>
              <span>
                15
              </span>
              March
            </h3>
          </div>
        </div>
        <div class="box">
          <div class="img-box">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/event-img.jpg" alt="" />
          </div>
          <div class="detail-box">
            <h4>
              Education Events 2021
            </h4>
            <h6>
              8:00 AM - 5:00 PM VENICE, ITALY
            </h6>
          </div>
          <div class="date-box">
            <h3>
              <span>
                15
              </span>
              February
            </h3>
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

  <!-- end event section -->

  <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>

</body>

</html>