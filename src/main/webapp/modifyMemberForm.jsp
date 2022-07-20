<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#modifyMember {
			margin: auto;
			text-align: center;
			border: 1px solid black;
			width: 50%;
			height: 300px;
		}
	#modifyMember table {
		margin: auto;
		margin-top: 30px;
	}
</style>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	
	function chk2() {
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		var nick = document.getElementById("nickname");

		if(pw.value == "") {
			alert('비밀번호를 입력해주세요')
			pw.focus()
		}
		else if(pw2.value == "") {
			alert('비밀번호 확인을 입력해주세요')
			pw2.focus()
		}
		else if(nick.value == "") {
			alert('닉네임을 입력해주세요')
			nick.focus()
		}
		else if(pw.value != pw2.value) {
			alert('비밀번호가 일치하지 않습니다')
			pw.focus()
		}
		else {
			fo.submit()
		}
	}
	
</script>

<jsp:useBean id="dao" class="miniMember.MiniMemberDAO" />
<c:set var="dto" value="${dao.memberInfo(sessionScope.loginSuccess) }"/>

<div id="modifyMember">
	<h1> 회원수정 </h1>
	<form action="modifyMemberCheck.jsp" id="fo" method="post">
	
		<table border="1">
			<tr>
				<td>
					<input type="text" id="id" name="id" value="${sessionScope.loginSuccess }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pw" name="pw" placeholder="새 비밀번호 입력">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pw2" name="pw" placeholder="새 비밀번호 확인">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="nickname" name="nickname" value="${dto.nickname }">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" onclick="chk2()" value="회원수정">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>