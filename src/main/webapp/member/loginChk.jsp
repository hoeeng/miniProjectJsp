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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	int result = dao.userChk(id, pw);
	if(result==1){
		session.setAttribute("login", id);%>
		<script type="text/javascript">
			alert('환영합니다.')
			location.href='main.jsp'
		</script>
	<%}else if(result==0){%>
		<script type="text/javascript">
		alert('비밀번호 틀림')
		location.href='login.jsp'
		</script>	
	<%}else{%>
		<script type="text/javascript">
		alert('존재하지 않는 아이디 입니다')
		location.href='login.jsp'
		</script>
	<%}%>
</body>
</html>