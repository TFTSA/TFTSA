<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function Click(){
	if($("input:radio[id='student']").is(":checked")==true){
		console.log("student");
		window.name = "studentForm";
		window.open("upSPage.do?user_no=${member.user_no}", "new", "top=100, left=300, width=550, height=500, status=no, menubar=no, toolbar=no, resizable=no");
	}else{
		console.log("tutor");
		window.name = "tutorForm";
		window.open("upTPage.do?user_no=${member.user_no}", "new", "top=100, left=300, width=950, height=650, status=no, menubar=no, toolbar=no, resizable=no");
	}
	//location.reload();
}
function deleteuser(){
	if(confirm("회원탈퇴를 계속 진행하시겠습니까?")== true){
		location.href="deleteUser.do?user_id=${member.user_id}";	
	}else{
		return;
	}
}

</script>
<style type="text/css">
div#left{
	/* width: 250px !important; */
	margin: 5px;
	-webkit-box-flex: 0.5;
      -ms-flex: 0.5;
          flex: 0.5;
}
div#right{
	border-left:1px solid #cbcbcb;
	width: 600px;
	margin:5px;
	flex: 1.4;
	padding: 10px 0;
	padding-left: 50px;
	align-items: baseline !important;
}
ul{
	padding-inline-start:0;
}
ul#bar{
	list-style:none;
}
ul#bar li{
	/* float:center; */
	width:170px;
	height:30px;
	padding:2px;
}
ul#bar li a{
	text-decoration:none;
	width:120px;
	height:30px;
	display: block;
	text-align:center;
	margin:0;
	color: #343a40;
}
ul#bar li a:hover{
	width:120px;
	height: 30px;
	text-decoration:none;
	color:white;
	background: #42acae;
	text-align:center;
	margin:0;	
	display: block;
	border-radius:3px;
}
div.box {
	padding-top: 15px; 
	width:900px !important; 
	align:center;
}
.event_section .event_container .box {
	align-items: flex-start !important;
}
img{
	width: 120px;
	height: 120px;
	object-fit: cover;
}
</style>
</head>

<body class="sub_page">
	<div class="hero_area">

		<c:import url="/WEB-INF/views/common/menubar.jsp" />

	</div>
	<!-- event section -->
	<section class="event_section layout_padding">
		<div class="container">
			<div class="heading_container" style="padding-left: 130px;">
				<h3 style="padding-left: 15px;">마이페이지</h3>
			</div>
			<div class="event_container" align="center">
				<div class="box">
					<div id="left">
						<div>
							<c:if test="${member.user_position eq 'U'}">
								<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif">
							</c:if>
							<c:if test="${student.pic ne null and member.user_position eq 'S'}">
								<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/studentImg/${student.pic}">
							</c:if>
							<c:if test="${tutor.pic ne null and member.user_position eq 'T'}">
								<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/tutorImg/${tutor.pic}">
							</c:if>
						</div>
						<div style="padding-top: 5px;">
							<ul id="bar">
								<li><a href="myPage.do?user_no=${loginMember.user_no }" style="color:white; background: #42acae; border-radius:3px;">프로필</a></li>
								<c:if test="${member.user_position eq 'S' }">
								<li><a href="clist.do?user_no=${student.user_no }">채팅목록</a></li>
								<li><a href="wishl.do?user_no=${student.user_no }">찜 목록</a></li>
								</c:if>
								<c:if test="${member.user_position eq 'T' }">
								<li><a href="clist.do?user_no=${tutor.user_no }">채팅목록</a></li>
								</c:if>
								<li><a href="mclass.do?user_no=${loginMember.user_no }">내 강의 내역</a></li>
							</ul>
						</div>
			            <br><a style="color:#969ca2;" href="#" onclick="deleteuser(); return false;">회원탈퇴</a>
					</div>
					<div id="right">
						<div>
						<table>
							<tr>
								<c:if test="${member.user_position eq 'U'}">
									<td><h4>프로필 추가</h4></td>
									<td width="100px" align="right">
										<input type="radio" name="profile_type" id="student" value="student" onchange="Click()">학생 &nbsp;
									</td>
									<td>
										<input type="radio" name="profile_type" id="tutor" value="tutor" onchange="Click()">선생님
									</td>
								</c:if>
								<%-- <c:if test="${member.user_position eq 'S'}">
									<td><h4>학생 프로필 수정</h4></td>
									<td width="100px" align="right">
										<input type="radio" name="profile_type" id="student" value="student" onchange="Click()">학생 &nbsp;
									</td>
								</c:if>
								<c:if test="${member.user_position eq 'T'}">
									<td><h4>선생님 프로필 수정</h4></td>
									<td>
										<input type="radio" name="profile_type" id="tutor" value="tutor" onchange="Click()">선생님
									</td>
								</c:if> --%>
							</tr>
						</table>
						</div><br>
						<div>
							<h4 align="left">내 프로필</h4>
							<table>
								<Tr>
									<td width="150px">이름</td>
									<td>${member.user_name }</td>
								</Tr>
								<Tr>
									<td>아이디</td>
									<td>${member.user_id }</td>
								</Tr>
								<Tr>
									<td>휴대폰번호</td>
									<td>${member.user_phone }</td>
								</Tr>
								<Tr>
									<td>이메일</td>
									<td>${member.user_email }</td>
								</Tr>
							<c:if test="${member.user_position eq 'S'}">
								<Tr>
									<td>학년</td>
									<td>${student.stu_job }</td>
								</Tr>
								<Tr>
									<td>과외 가능 요일</td>
									<td>${student.day }</td>
								</Tr>
								<Tr>
									<td>과외 가능 시간</td>
									<td>${student.time }</td>
								</Tr>
								<Tr>
									<td>선생님께 바라는 점</td>
									<td>${student.stu_wish }</td>
								</Tr>
							</c:if>
							<c:if test="${member.user_position eq 'T'}">
								<Tr>
									<td>한줄소개</td>
									<td>${tutor.intro }</td>
								</Tr>
								<Tr>
									<td>학력</td>
									<td>${tutor.l_grd }</td>
								</Tr>
								<Tr>
									<td>과목</td>
									<td>${tutor.sub_name }</td>
								</Tr>
								<Tr>
									<td>과외 가능 요일</td>
									<td>${tutor.day }</td>
								</Tr>
								<Tr>
									<td>과외 가능 시간</td>
									<td>${tutor.time }</td>
								</Tr>
								<Tr>
									<td>1회당 수업시간(분)</td>
									<td>${tutor.class_min }</td>
								</Tr>
								<Tr>
									<td>수업 횟수(월)</td>
									<td>${tutor.class_times }</td>
								</Tr>
								<Tr>
									<td>과외 가능 지역</td>
									<td>${tutor.area }</td>
								</Tr>
								<Tr>
									<td>최소페이</td>
									<td>${tutor.min_pay }</td>
								</Tr>
								<Tr>
									<td>화상가능여부</td>
									<td>${tutor.online_ok }</td>
								</Tr>
								<Tr>
									<td>과외 스타일</td>
									<td>${tutor.style }</td>
								</Tr>
								<tr>
									<td>성격</td>
									<td>${tutor.key_name }</td>
								</tr>
							</c:if>
							</table>
						</div>
						<div class="btn-box" align="center">
							<a href="upUserPage.do?user_id=${ requestScope.member.user_id }">수정 페이지로 이동</a>
						</div>
					</div>
				</div>
				
			</div>

		</div>
	</section>

	<!-- end event section -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>