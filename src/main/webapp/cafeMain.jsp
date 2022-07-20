<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h1> 메인에 내용이 아직 없 </h1>
	<h2> (세션확인용) 현재 로긴된 아이디 : ${sessionScope.loginSuccess } </h2>
	<h2> (세션확인용) info.id : ${sessionScope.info.id } </h2>
	
	<input type="button" value="회원가입" onclick="location.href='registerForm.jsp'">
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	<input type="button" value="로긴하러가기" onclick="location.href='loginForm.jsp'">
	<input type="button" value="리스트보러가기" onclick="location.href='list.jsp'">
	<input type="button" value="글싸러가기" onclick="location.href='writeForm.jsp'">
	
	<c:if test="${sessionScope.loginSuccess != null }">
		<input type="button" value="내정보" onclick="location.href='personalInfo.jsp'">
	</c:if>
	
	
	
	
</body>
</html>