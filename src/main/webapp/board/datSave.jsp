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
<jsp:useBean id="dao" class="miniDat.MiniDatDAO"/>
<jsp:useBean id="dto" class="miniDat.MiniDatDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="result" value="${dao.datSave(dto)}"/>

<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			location.href="contentView.jsp?num=${dto.num}"
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('댓글작성 실패!')
			location.href='boardList.jsp'
		</script>
	</c:otherwise>
</c:choose>








</body>
</html>