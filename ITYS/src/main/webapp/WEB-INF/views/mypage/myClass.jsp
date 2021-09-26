<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function deleteuser(){
	if(confirm("회원탈퇴를 계속 진행하시겠습니까?")== true){
		location.href="deleteUser.do?user_id=${member.user_id}";	
	}else{
		return;
	}
}
</script>
<style type="text/css">
hr{
	margin-top: 5px !important;
	margin-bottom: 5px !important;
}
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
ul#wlist{
	list-style: none;
}
ul#wlist li{
	padding-top: 2px;
	padding-bottom: 2px;
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
							<c:choose>
								<c:when test="${student.pic ne null}">
									<img src="${ pageContext.servletContext.contextPath }/resources/images/mypage/studentImg/${student.pic}">
								</c:when>
								<c:when test="${tutor.pic ne null}">
									<img src="${ pageContext.servletContext.contextPath }/resources/images/mypage/tutorImg/${tutor.pic}">
								</c:when>
								<c:otherwise>
									<img src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif">
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding-top: 5px;">
							<ul id="bar">
								<li><a href="myPage.do?user_no=${loginMember.user_no }">프로필</a></li>
								<c:if test="${position eq 'S' }">
								<li><a href="clist.do?user_no=${loginMember.user_no }">채팅목록</a></li>
								<li><a href="wishl.do?user_no=${loginMember.user_no }">찜 목록</a></li>
								</c:if>
								<c:if test="${position eq 'T' }">
								<li><a href="clist.do?user_no=${loginMember.user_no }">채팅목록</a></li>
								</c:if>
								<li><a href="mclass.do?user_no=${loginMember.user_no }" style="color:white; background: #42acae; border-radius:3px;">내 강의 내역</a></li>
							</ul>
						</div>
						<div><a style="color:#969ca2;" href="#" onclick="deleteuser(); return false;">회원탈퇴</a></div>
					</div>
					<div id="right">
						<div>
							<h4>📋 강의 목록</h4>
						</div><br>
						<div>
							<ul id="wlist">
								<li>
								<c:forEach items="${list }" var="c">
								<table>
									<tr>
									<td valign="top">
										<img
										src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif"
										width="75px" height="75px" style="margin-top:5px" />
									</td>
									<td style="width:475px; padding-left:15px">
										선생님이름 : ${c.user_name }<br>	
										과외 한 줄 소개 : ${c.intro }<br>
										전화번호 : ${c.user_phone }<br>
										과목 : ${c.sub_name }<br>
										지역 : ${c.area }<Br>
										과외시간 : ${c.time }<br>
										수업료 : ${c.pay_amount }<br>
										온라인 가능여부 : ${c.online_ok }<br>
									</td>
									</tr>
								</table><hr>
								</c:forEach>
								</li>
								
								<c:set var="e" value="<%= exception %>" />
								<c:if test="${ empty e }">
								<h5> ${ message }</h5>
								</c:if>
								<br>
							</ul>
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