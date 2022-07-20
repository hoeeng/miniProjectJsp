<%@page import="miniBoard.MiniBoardDAO"%>
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
	<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>
	<c:set var="dto" value="${dao.delete(param.num) }"/>
	<% 
		response.sendRedirect("mainBoard.jsp");
	%>
</body>
</html>