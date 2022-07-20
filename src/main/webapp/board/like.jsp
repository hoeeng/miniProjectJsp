<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>
	<c:choose>
		<c:when test="${param.bu == 1 }">
			<c:set var="dto" value="${dao.likeUp(param.num, param.id)}"/>
		</c:when>
		<c:when test="${param.bu == 2 }">
			<c:set var="dto" value="${dao.likeDown(param.num, param.id)}"/>
		</c:when>
	</c:choose>
	<script type="text/javascript">
		location.href="content.jsp?id=${param.id}&&num=${param.num }"
	</script>
</body>
</html>