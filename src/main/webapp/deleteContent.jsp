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
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />

<c:set var="result" value="${dao.deleteBoard(param.num) }" />

<c:choose>
	<c:when test="${result == 1 }">
		<script>
			alert('게시글 삭제 완료')
			location.href="list.jsp"
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert('게시글 삭제 실패 :(')
			history.back()
		</script>	
	</c:otherwise>
</c:choose>


</body>
</html>