<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />
<jsp:useBean id="dto" class="miniBoard.MiniBoardDTO" />
<jsp:setProperty property="*" name="dto"/>

<c:set var="result" value="${dao.modifyPost(dto) }" />

<c:choose>
	<c:when test="${result == 1 }">
		<script>
			alert('수정 성공!')
		</script>
			<% session.removeAttribute("info"); %>
		<script>
			location.href='list.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('수정 실패 :(')
			history.back()
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>