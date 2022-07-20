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
<jsp:useBean id="dao" class="miniDat.MiniDatDAO" />
<c:set var="result" value="${dao.deleteDat(param.datnum) }"/>

<c:choose>
	<c:when test="${result == 1 }">
		<script>
			location.href="contentView.jsp?title=${param.title}"
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert('댓글 작성중 에러가 있음!')
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>