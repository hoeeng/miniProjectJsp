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

<c:set var="result" value="${dao.modifyMember(param.id, param.pw, param.nickname) }" />

<c:choose>
	<c:when test="${result == 2 }">
		<script>
			alert('이미 등록된 닉네임 입니다!')
			history.back()
		</script>
	</c:when>
	<c:when test="${result == 1 }">
		<script>
			alert('수정 성공!')
			location.href="cafeMain.jsp"
		</script>
	</c:when>
	<c:when test="${result == 0 }">
		<script>
			alert('업데이트 실패!')
			history.back()
		</script>
	</c:when>
</c:choose>

</body>
</html>