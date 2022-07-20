<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#login {
			margin: auto;
			text-align: center;
			border: 1px solid black;
			width: 50%;
			height: 300px;
		}
	#login table {
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
		
		if(id.value == "") {
			alert('아이디를 입력해주세요')
		}
		else if(pw.value == "") {
			alert('비밀번호를 입력해주세요')
		}
		else {
			fo.submit()
		}
	}
</script>

<div id="login">
	<h1> 환영합니다 </h1>
	<form action="loginCheck.jsp" id="fo" method="post">
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
					<input type="button" onclick="chk()" value="로그인">
					<input type="button" onclick="location.href='registerForm.jsp'" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>