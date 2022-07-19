<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../home/header.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>

<form action="memberModify.jsp">
<input type="hidden" name="id" value="${param.id}"> 

<h1>${param.id} 님의 정보</h1>
<table border="1" class="userTable">
	<tr>
		<th>아이디 : </th>
		<th>${param.id }</th>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<th><input type="text" value="${param.pw}" name="pw"></th>
	</tr>
	<tr>
		<th>닉네임 : </th>
		<th><input type="text" value="${param.nickname}" name="nickname"></th>
	</tr>
</table>
<input type="submit" value="수정 완료">
<input type="button" value="이전" onclick="history.back()">
</form>

<%@include file="../home/footer.jsp"%>