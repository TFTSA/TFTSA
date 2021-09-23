<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="col-6">
	    <c:url var="selectchatting" value="selectChatting.do">
			<c:param name="chat_room_no" value="1"/>
			<c:if test="${ sessionScope.loginMember.user_position eq 'S' }">
				<c:param name="user_no" value="1"/>
			</c:if>
			<c:if test="${ sessionScope.loginMember.user_position eq 'T' }">
				<c:param name="user_no" value="2"/>
			</c:if>
		</c:url>
	    <input type="button" value="버튼" id="start" onclick="location.href='${ selectchatting }'">
	</div>
</body>
</html>