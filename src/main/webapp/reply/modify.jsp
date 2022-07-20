<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% request.setCharacterEncoding("utf-8"); 
	%>
	<jsp:useBean id="dao" class="miniDat.MiniDatDAO"/>
	<jsp:useBean id="dto" class="miniDat.MiniDatDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	${dao.update(dto) }
	
	<script type="text/javascript">
		location.href="../board/content.jsp?id=${param.id}&&num=${param.boardnum }"
	</script>
</body>
</html>