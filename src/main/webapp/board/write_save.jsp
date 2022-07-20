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
	<%
		request.setCharacterEncoding("utf-8");
		MiniBoardDAO dao = new MiniBoardDAO();
		dao.insert(
				request.getParameter("id"),
				request.getParameter("nickname"),
				request.getParameter("title"),
				request.getParameter("content")
				);
		System.out.println(request.getParameter("nickname"));
		response.sendRedirect("mainBoard.jsp");
	%>
	
</body>
</html>