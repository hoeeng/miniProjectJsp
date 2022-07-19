<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
${dao.boardModify(dto)}

<script type="text/javascript">
	location.href='contentView.jsp?num=${param.num}'
</script>





</body>
</html>