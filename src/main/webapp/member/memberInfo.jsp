<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../home/header.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dao" class="miniMember.MiniMemberDAO"/>
<c:set var="dto" value="${dao.memberInfo(param.id)}"/>
<form action="memberModifyView.jsp">
<input type="hidden" name="id" value="${dto.id}"> 
<input type="hidden" name="pw" value="${dto.pw}"> 
<input type="hidden" name="nickname" value="${dto.nickname}">  
<h1>${param.id} 님의 정보</h1>
<table border="1" class="userTable">
	<tr>
		<th>아이디 : </th>
		<th>${dto.id}</th>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<th>${dto.pw}</th>
	</tr>
	<tr>
		<th>닉네임 : </th>
		<th>${dto.nickname}</th>
	</tr>
</table>
<input type="submit" value="수정">
<input type="button" value="삭제" onclick="location.href='delete.jsp?id=${dto.id}'">
<input type="button" value="이전" onclick="history.back()">
</form>

<%@include file="../home/footer.jsp"%>