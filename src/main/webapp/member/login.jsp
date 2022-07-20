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
	<br><br><br><br>
	<form class="row g-3" action="loginChk.jsp" method="post">
	<div class="container text-center">
		<div class="row row-cols-auto">
			<div class="col">
				<label for="validationDefault01" class="form-label">아이디</label> 
				<input type="text" class="form-control" id="validationDefault01" required name="id">
				<label for="validationDefault02" class="form-label">비밀번호</label> 
				<input type="password" class="form-control" id="validationDefault02" required name="pw">
			</div>
		</div>
	</div>
	<div class="col-12">
		<button class="btn btn-primary" type="submit">로그인</button>
		<input type="button" value="취소" onclick="location.href='cafeMain.jsp'" class="btn btn-secondary">
	</div>
</form>
</body>
</html>