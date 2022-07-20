<%@page import="miniMember.MiniMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= session.getAttribute("login") %><br>
	<%= request.getParameter("abcd") %>
	<%
		MiniMemberDAO dao = new MiniMemberDAO();
		dao.delete( request.getParameter("id") );
		response.sendRedirect("logout.jsp");
	%>
</body>
</html>