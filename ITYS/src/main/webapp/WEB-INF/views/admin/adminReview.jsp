<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="${ pageContext.servletContext.contextPath }/admin_resources/img/logo/logo.png" rel="icon">
<title>Admin - 회원 관리</title>
<link href="${ pageContext.servletContext.contextPath }/admin_resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/admin_resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/admin_resources/css/ruang-admin.min.css" rel="stylesheet">
<link href="${ pageContext.servletContext.contextPath }/admin_resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<c:import url="/WEB-INF/views/admin/common/sidebar.jsp" />

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="/WEB-INF/views/admin/common/topbar.jsp" />
			        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">리뷰관리</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item">Tables</li>
              <li class="breadcrumb-item active" aria-current="page">DataTables</li>
            </ol>
          </div>

          <!-- Row -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                      	<th>번호</th>
                        <th>선생님성함</th>
                        <th>과목</th>
                        <th>별점</th>
                        <th>수강후기</th>
                        <th>선택</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                      	<th>번호</th>
                        <th>선생님성함</th>
                        <th>과목</th>
                        <th>별점</th>
                        <th>수강후기</th>
                        <th>선택</th>
                      </tr>
                    </tfoot>
                    <tbody>
                      <tr>
                      	<td>1</td>
                        <td>노민지</td>
                        <td>영어</td>
                        <td>5.0</td>
                        <td>내 이름은 곽두팔 나 살면서 이런 멋진 과외는 처음 받아본다.</td>
                        <td><input type="checkbox" name="review 1" value="no1"></td>
                      </tr>
                      <tr>
                      <td>2</td>
                        <td>Garrett Winters</td>
                        <td>수학</td>
                        <td>5.0</td>
                        <td>수학 진짜 개 재밌다 무야호~~</td>
                        <td><input type="checkbox" name="review 2" value="no2"></td>
                      </tr>
                      <tr>
                      <td>3</td>
                        <td>Andy Baek</td>
                        <td>영어</td>
                        <td>5.0</td>
                        <td>교재가 꼼꼼하고 선생님이 저렴해요!</td>
                        <td><input type="checkbox" name="review 3" value="no3"></td>
                      </tr>
                      <tr>
                      <td>4</td>
                        <td>End Back</td>
                        <td>물리</td>
                        <td>5.0</td>
                        <td>역시 탐구과목으로 물리는 무리였어</td>
                        <td><input type="checkbox" name="review 4" value="no4"></td>
                      </tr>
                      <tr>
                      <td>5</td>
                        <td>현우진</td>
                        <td>수학</td>
                        <td>5.0</td>
                        <td>스탠포드 나온 존잘 강사 아 오지고 지리고~</td>
                        <td><input type="checkbox" name="review 5" value="no5"></td>
                      </tr>
                      <tr>
                      <td>6</td>
                        <td>노민지</td>
                        <td>TOEIC</td>
                        <td>5.0</td>
                        <td>와우! 넘모 완벽한 강의~!!</td>
                        <td><input type="checkbox" name="review 6" value="no6"></td>
                      </tr>
                      <tr>
                      <td>7</td>
                        <td>Herrod Chandler</td>
                        <td>Sales Assistant</td>
                        <td>5.0</td>
                        <td>59</td>
                        <td><input type="checkbox" name="review 7" value="no7"></td>
                      </tr>
                      <tr>
                      <td>8</td>
                        <td>Rhona Davidson</td>
                        <td>Integration Specialist</td>
                        <td>5.0</td>
                        <td>55</td>
                        <td><input type="checkbox" name="review 8" value="no8"></td>
                      </tr>
                      <tr>
                      <td>9</td>
                        <td>Colleen Hurst</td>
                        <td>Javascript Developer</td>
                        <td>5.0</td>
                        <td>39</td>
                        <td><input type="checkbox" name="review 9" value="no9"></td>
                      </tr>
                      <tr>
                      <td>10</td>
                        <td>Sonya Frost</td>
                        <td>Software Engineer</td>
                        <td>5.0</td>
                        <td>23</td>
                        <td><input type="checkbox" name="review 10" value="no10"></td>
                      </tr>
                      
                    </tbody>
                  </table>
                  <div align="right" style=50px>
                  <a href="#" class="btn btn-danger" >
                    <i class="fas fa-trash" ></i>
                  </a>
               	</div>
              </div>
            </div>
          </div>
          <!--Row-->

          <!-- Documentation Link -->
          <div class="row">
            <div class="col-lg-12">
              <p>DataTables is a third party plugin that is used to generate the demo table below. For more information
                about DataTables, please visit the official <a href="https://datatables.net/" target="_blank">DataTables
                  documentation.</a></p>
            </div>
          </div>

          <!-- Modal Logout -->
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                  <a href="login.html" class="btn btn-primary">Logout</a>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!---Container Fluid-->
      </div>
			</div>
		</div>
	</div>
</body>
<c:import url="/WEB-INF/views/admin/common/footer.jsp" />

</html>