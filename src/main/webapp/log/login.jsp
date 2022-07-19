<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../home/header.jsp"%>
<form action="loginChk.jsp">
<table class="userTable">
<c:choose>
	<c:when test="${sessionId == null }">
		<tr>
			<th><input type="text" name="id"></th>
		</tr>
		<tr>
			<th><input type="text" name="pw"></th>
		</tr>
		<tr>
			<th>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='reg.jsp'">
			</th>
		</tr>
	</c:when>
	<c:otherwise>
		<tr>
			<th>${sessionId}<br>님 환영합니다!<br>
			<button type="button" onclick="location.href='/miniProjectJsp/member/memberList.jsp'">회원정보</button>
			<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>
			</th>
			
		</tr>
	</c:otherwise>
</c:choose>

</table>

</form>
<%@include file="../home/footer.jsp"%>