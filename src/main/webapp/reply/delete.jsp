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
	<jsp:useBean id="dao" class="miniDat.MiniDatDAO"/>
	<c:set var="dto" value="${dao.delete(param.num) }"/>
	
	<script type="text/javascript">
		
		location.href="../board/content.jsp?id=${param.id}&&num=${param.boardnum }"
	</script>
</body>
</html>