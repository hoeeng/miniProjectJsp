<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />
<jsp:useBean id="datdao" class="miniDat.MiniDatDAO"/>

					<!-- select ~ where rownum between 1n~10n -->
<c:set var="pc" value="${dao.pagingNum(param.start)}" />
<c:set var="list" value="${dao.getList(pc.startPage, pc.endPage) }" />

<table border="1">
	<tr>
		<th>게시글번호</th>
		<th>제목</th>
		<th>작성자ID</th>
		<th>닉네임</th>
		<th>조회수</th>
		<th>좋아요</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var="dto" items="${list }">
	<c:set var="datCount" value="${datdao.getBoardDatCount(dto.num) }"/>	
		<tr>
			<th>${dto.num }</th>
			<td> <a href="contentView.jsp?title=${dto.title }"> ${dto.title } </a> [${datCount }]</td>
			<td>${dto.id }</td>
			<td>${dto.nickname }</td>
			<td>${dto.hit }</td>
			<td>${dto.likey }</td>
			<td>${dto.savedate }</td>
		</tr>
	</c:forEach>
	
	<tr>
		<th colspan="7">
		
			<c:choose>
				<c:when test="${param.start == null || param.start < 2 }">
					<input type="button" value="이전" disabled="disabled">
				</c:when>
				
				<c:otherwise>
					<input type="button" value="이전" onclick="location.href='list.jsp?start=${param.start-1}'">
				</c:otherwise>
			</c:choose>	
			<!-- end 에 총게시글수 / 페이지에 보여질 개수 
				select rownum? -->
			<c:forEach var="n" begin="1" step="1" end="${pc.totEndPage }">
				<a href="list.jsp?start=${n }"> ${n } </a>
			</c:forEach>

			<c:choose>
				<c:when test="${param.start >= pc.totEndPage }">
					<input type="button" value="다음" disabled="disabled">
				</c:when>
				
				<c:when test="${param.start == null }">
					<input type="button" value="다음" onclick="location.href='list.jsp?start=${param.start+2}'">
				</c:when>
				
				<c:otherwise>
					<input type="button" value="다음" onclick="location.href='list.jsp?start=${param.start+1}'">
				</c:otherwise>
			</c:choose>				
	
		</th>
	</tr>
</table>

<!--  <, 1,2,3,4,5, > 페이지버튼 구현 필요 -->
<input type="button" onclick="location.href='writeForm.jsp'" value="글쓰기">
<input type="button" onclick="location.href='cafeMain.jsp'" value="홈으로">


</body>
</html>