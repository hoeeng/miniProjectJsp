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
내정보
	<%
	MiniMemberDAO dao = new MiniMemberDAO();
	MiniMemberDTO dto = dao.getU((String)session.getAttribute("login"));
	%>
<form action="modify.jsp" method="post">
	아이디<input type="text" name="id" readonly
						value="<%=dto.getId() %>"><br>
	비밀번호<input type="text" name="pw" 
						value="<%=dto.getPw() %>"><br>
	이름<input type="text" name="nickname" 
						value="<%=dto.getNickname() %>"><br>
	<input type="submit" value="정보 수정">
	<input type="button" value="메인" 
					onclick="location.href='main.jsp'"><br><br>
	<input type="button" value="회원 탈퇴" 
	onclick="location.href='delete.jsp?id=<%=dto.getId()%>'">
</form>


내가 쓴글
내가 쓴 댓글
</body>
</html>