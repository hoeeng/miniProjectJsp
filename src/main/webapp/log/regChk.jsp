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
<jsp:useBean id="dto" class="miniMember.MiniMemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="result" value="${dao.regChk(dto)}"/>
<c:choose>
	<c:when test="${result==1}">
		<script type="text/javascript">
			alert('회원가입 완료')
			location.href="login.jsp"
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
				alert('회원가입 실패')
				location.href="reg.jsp"
		</script>
	</c:otherwise>
</c:choose>




</body>
</html>