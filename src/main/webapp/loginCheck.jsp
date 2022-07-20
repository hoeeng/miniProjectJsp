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
<jsp:useBean id="dao" class="miniMember.MiniMemberDAO" />
<c:set var="result" value="${dao.login(param.id, param.pw) }"/>

<c:choose>
	<c:when test="${result == 3 }">
		<script>
			alert('입력하신 아이디는 존재하지 않습니다')
			history.back();
		</script>
	</c:when>
	<c:when test="${result == 2 }">
		<script>
			alert('비밀번호가 틀렸습니다')
			history.back();
		</script>
	</c:when>
	<c:when test="${result == 1 }">
		<c:set var="loginSuccess" value="${param.id }" scope='session'/>
		<c:set var="getNick" value="${dao.getNickname(param.id) }" scope='session'/>
		<script>
			alert('로그인 성공!')
			location.href='cafeMain.jsp'
		</script>
	</c:when>
</c:choose>

</body>
</html>