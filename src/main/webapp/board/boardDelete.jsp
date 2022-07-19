<%@page import="miniBoard.MiniBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	MiniBoardDAO dao=new MiniBoardDAO();
	dao.boardDelete(request.getParameter("num"));
	response.sendRedirect("boardList.jsp");
			
%>





</body>
</html>