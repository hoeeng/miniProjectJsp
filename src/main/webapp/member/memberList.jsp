<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home/header.jsp"%>

<jsp:useBean id="dao" class="miniMember.MiniMemberDAO"/>
<c:set var="list" value="${dao.memberList()}"/>
<!-- <script type="text/javascript">
	alert('${sessionId}'+'님 환영')
</script> -->
<h1>회원 정보</h1>
<table border="1" class="userTable">
	<tr>
		<th>아이디</th> <th>비밀번호</th> <th>닉네임</th>
	</tr>
	<c:forEach var="dto" items="${list}">
		<tr>
			<th>
			<a href="memberInfo.jsp?id=${dto.id}">
			${dto.id}
			</a>
			</th>
			<th>${dto.pw}</th>
			<th>${dto.nickname}</th>
		</tr>
	</c:forEach>
	<tr>
		<th colspan="3">
			<input type="button" value="로그아웃" onclick="location.href='/miniProjectJsp/log/logout.jsp'">
			<input type="button" value="게시판" onclick="location.href=
			'/miniProjectJsp/board/boardList.jsp'">
		</th>
	</tr>
</table>
<%@include file="../home/footer.jsp"%>