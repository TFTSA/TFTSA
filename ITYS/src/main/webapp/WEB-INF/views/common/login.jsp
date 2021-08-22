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

  <!-- login section -->

  <section class="login_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <h3>
              GET ONLINE COURSES FOR FREE
            </h3>
            <p>
              Create your free account now and get immediate access to 100s of
              online courses
            </p>
            <a href="">
              REGISTER NOW
            </a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="login_form">
            <h5>
              Login Now
            </h5>
            <form action="">
              <div>
                <input type="email" placeholder="Email " />
              </div>
              <div>
                <input type="password" placeholder="Password" />
              </div>
              <button type="submit">Login</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end login section -->

  <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>

</body>

</html>