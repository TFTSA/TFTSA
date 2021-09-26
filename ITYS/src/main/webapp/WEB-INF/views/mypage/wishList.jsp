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
	padding-right: 20px;
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
.delbutton{
	display: inline-block;
    padding: 8px 45px;
    background-color: #133e3f;
    border: 1px solid #133e3f;
    color: #ffffff;
    margin-top: 35px;
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
.delbutton:hover{
	display: inline-block;
    padding: 8px 45px;
    background-color: white;
    /* border: 1px solid #133e3f; */
    color: #133e3f;
    margin-top: 35px;
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
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/studentImg/${student.pic}">
								</c:when>
								<c:when test="${tutor.pic ne null}">
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/tutorImg/${tutor.pic}">
								</c:when>
								<c:otherwise>
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif">
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding-top: 5px;">
							<ul id="bar">
								<li><a href="myPage.do?user_no=${loginMember.user_no }">프로필</a></li>
								<li><a href="clist.do?user_no=${loginMember.user_no }">채팅목록</a></li>
								<li><a href="wishl.do?user_no=${loginMember.user_no }" style="color:white; background: #42acae; border-radius:3px;">찜 목록</a></li>
								<li><a href="mclass.do?user_no=${loginMember.user_no }">내 강의 내역</a></li>
							</ul>
						</div>
						<div><a style="color:#969ca2;" href="#" onclick="deleteuser(); return false;">회원탈퇴</a></div>
					</div>
					<div id="right">
						<div>
						
							<h4>❤ 찜 목록</h4>
						</div><br>
						<form action="delwlist.do" method="post">
						<input type="hidden" name="student_no" value="${loginMember.user_no}">
						<div>
							<ul id="wlist">
								<li>
								<c:forEach items="${requestScope.list }" var="w">
								<table>
									<tr>
									<td valign="top">
										<img
										src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif"
										width="75px" height="75px" style="margin-top:5px" />
									</td>
									<td style="width:475px; padding-left:15px">
										선생님이름 : ${w.user_name }<br>	
										과외 한 줄 소개 : ${w.intro }<br>
										전화번호 : ${w.user_phone }<br>
										과목 : ${w.sub_name }<br>
										지역 : ${w.area }<Br>
									</td>
									<td style="align: right;"><input type="checkbox" name="chk" value="${w.user_no }"></td>
									</tr>
								</table><hr>
								<%-- <c:if test="${list. }"></c:if> --%>
								</c:forEach>
								
								<c:set var="e" value="<%= exception %>" />
								<c:if test="${ empty e }">
								<h5> ${ message }</h5>
								</c:if>
								<br>
								</li>
								
							</ul>
						</div>
						<div class="btn-box" align="center">
							<input type="submit" class="delbutton" value="삭제하기">
						</div>
						</form>
					</div>
				</div>
				
			</div>

		</div>
	</section>

	<!-- end event section -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>