<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#register {
			margin: auto;
			text-align: center;
			border: 1px solid black;
			width: 50%;
			height: 300px;
		}
	#register table {
		margin: auto;
		margin-top: 30px;
	}
</style>
</head>
<body>

<script>

	
	function chk() {
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		var nick = document.getElementById("nickname");
		
		if(id.value == "") {
			alert('아이디를 입력해주세요')
			id.focus()
		}
		else if(pw.value == "") {
			alert('비밀번호를 입력해주세요')
			pw.focus()
		}
		else if(pw2.value == "") {
			alert('비밀번호 재확인을 입력해주세요')
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
	
	
// 	function idDupChk() {
// 		var id = document.getElementById("id")
// 		document.setAttribute("id", id)
		
// 		location.href='duplicateCheck.jsp'
// 	}
	
// 	function nickDupChk() {
// 		var nickname = document.getElementById("nickname")
// 		document.setAttribute("nickname", nickname)
		
// 		location.href='duplicateCheck.jsp'		
// 	}
	
</script>

<jsp:useBean id="dao" class="miniMember.MiniMemberDAO" />

<div id="register">
	<h1> 회원가입 </h1>
	<form action="registerCheck.jsp" id="fo" method="post">
		<table border="1">
			<tr>
				<td>
					<input type="text" id="id" name="id" placeholder="id">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="pw" name="pw" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="pw2" name="pw" placeholder="비밀번호 재확인">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="nickname" name="nickname" placeholder="닉네임">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" onclick="chk()" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>