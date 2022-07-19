<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="miniMember.MiniMemberDAO"/>
<c:set var="result" value="${dao.check(param.id,param.pw)}"/>

<c:choose>
	<c:when test="${result==1}">
		<c:set var="sessionId" value="${param.id}" scope="session"/>
		<script>
			alert('로그인 성공')
			location.href="../member/memberList.jsp"
		</script>
			
	</c:when>
	<c:when test="${result==2}">
		<script>
			alert('비밀번호 틀림')
			location.href="login.jsp"
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('존재하는 아이디 없음')
			location.href="login.jsp"
		</script>
	</c:otherwise>
</c:choose>


</body>
</html>