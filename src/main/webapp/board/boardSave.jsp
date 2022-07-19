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
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>
<jsp:useBean id="dto" class="miniBoard.MiniBoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="result" value="${dao.boardSave(dto)}"/>

	

<c:choose>
	<c:when test="${result ==1 }">
		<script type="text/javascript">
			location.href='boardList.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('실패')
			location.href='boardList.jsp'
		</script>
	</c:otherwise>
</c:choose>






</body>
</html>