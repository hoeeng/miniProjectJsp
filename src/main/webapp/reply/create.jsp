<%@page import="miniDat.MiniDatDAO"%>
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

<%
	request.setCharacterEncoding("utf-8");
	MiniDatDAO dao = new MiniDatDAO();
	String id = request.getParameter("id");
	String nickname = request.getParameter("nickname");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	dao.create(id, nickname, content, num);
%>
	<script type="text/javascript">
		location.href="../board/content.jsp?id=${sessionScope.login}&&num=${param.num }"
	</script>
</body>
</html>