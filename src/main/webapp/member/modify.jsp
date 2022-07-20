<%@page import="miniMember.MiniMemberDTO"%>
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

<%
	request.setCharacterEncoding("utf-8");
	
	MiniMemberDAO dao = new MiniMemberDAO();
	MiniMemberDTO dto = new MiniMemberDTO();
	dto.setId( request.getParameter("id") );
	dto.setPw( request.getParameter("pw") );
	dto.setNickname( request.getParameter("nickname") );
	
	dao.update(dto);
	response.sendRedirect("main.jsp");
%>
</body>
</html>