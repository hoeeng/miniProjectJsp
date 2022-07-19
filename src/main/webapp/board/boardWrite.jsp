<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home/header.jsp" %>
<jsp:useBean id="dao" class="miniMember.MiniMemberDAO"/>
<c:set var="dto" value="${dao.memberInfo(sessionId)}"/>


<form action="boardSave.jsp">
	<table border="1" class="userTable">
	<tr>
		<th>아이디</th>
		<th>
			<input type="text" name="id" value="${dto.id}" readonly>
		</th>
	</tr>
	<tr>
		<th>닉네임</th>
		<th><input type="text" name="nickname" value="${dto.nickname}" readonly></th>
	</tr>
	<tr>
		<th>제목</th>
		<th><input type="text" name="title"></th>
	</tr>
	<tr>
		<th>내용</th>
		<th><textarea rows="10" cols="20" name="content"></textarea></th>
	</tr>
	<tr>
		<th colspan="2">
		<input type="submit" value="작성">
		<input type="button" value="이전"
		onclick="history.back()">
		</th>
	</tr>
	</table>
</form>
<%@include file="../home/footer.jsp" %>