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
<jsp:useBean id="likeyDAO" class="miniLikey.MiniLikeyDAO"  />
<jsp:useBean id="BoardDAO" class="miniBoard.MiniBoardDAO" />

<c:choose>
	<c:when test="${sessionScope.loginSuccess == null}">
		<script>
			alert('로그인을 해주세요!')
			history.back()
		</script>
	</c:when>
	
	<c:when test="${param.num != null}">
		<c:set var="result" value="${likeyDAO.boardLikeDown(param.num, sessionScope.loginSuccess) }"/>
		<script>
			location.href="contentView.jsp?title=${param.goback}"
		</script>
	</c:when>
	
	<c:when test="${param.datnum != null }">
		<c:set var="datresult" value="${likeyDAO.datLikeDown(param.datnum, sessionScope.loginSuccess)}" />
		<script>
			location.href="contentView.jsp?title=${param.goback}"
		</script>
	</c:when>
</c:choose>

</body>
</html>