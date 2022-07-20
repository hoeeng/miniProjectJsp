<%@page import="miniMember.MiniMemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
<%@ include file="../base/header.jsp" %>
<br><br><br><br><br>
회원 리스트
<%
		MiniMemberDAO dao = new MiniMemberDAO();
		ArrayList<MiniMemberDTO> list = dao.getMember();
	%>
	<table border="1" class="table">
		<thead class="table-dark">
			<tr>
				<th>아이디</th> <th>비밀번호</th> <th>닉네임</th>
			</tr>
		</thead>
		<tbody>
			<%for(MiniMemberDTO m : list){ %>
			<tr>
				<td><%=m.getId() %></td> <td><%=m.getPw() %></td>
				<td><%=m.getNickname() %></td> 
			</tr>
		<% } %>
			<tr>
				<td colspan="3">
				<input type="button" value="메인" 
						onclick="location.href='main.jsp'" class="btn btn-secondary">
				<input type="button" value="계정정보" 
						onclick="location.href='info.jsp'" class="btn btn-secondary">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>