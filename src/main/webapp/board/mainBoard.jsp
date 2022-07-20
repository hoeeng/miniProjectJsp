<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../base/header.jsp" %>
	<div class="container mt-5 mb-5">
		<br><br>
		<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />
		<c:set var="totalPage" value="${dao.getTotalPage() }"/>
		<c:set var="pc" value="${dao.pagingNum(param.start) }"></c:set>
		<c:set var="list" value="${dao.list(pc.startPage, pc.endPage) }" />
		
		<table class="table table-hover mt-5">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>좋아요</td>
			</tr>
			<c:choose>
				<c:when test="${list.size()==0 }">
					<tr>
						<th colspan="6">데이터 없음</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<tr>
							<th>${dto.num }</th>
							<th><a href="content.jsp?id=${sessionScope.login}&&num=${dto.num }">${dto.title }</a></th>
							<th>${dto.nickname }</th>
							<th>${dto.savedate }</th>
							<th>${dto.hit }</th>
							<th>${dto.likey }</th>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<nav aria-label="Page navigation example" class="mt-5">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${param.start == null }">
						<c:set var="s" value="1"/>
					</c:when>
					<c:otherwise>
						<c:set var="s" value="${param.start }"></c:set>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${s > 1 }">
						<li class="page-item">
	                        <a class="page-link" href="mainBoard.jsp?start=1">처음</a>
	                    </li>
	                    <li class="page-item">
	                        <a class="page-link" href="mainBoard.jsp?start=${s-1 }">이전</a>
	                    </li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
	                        <a class="page-link">처음</a>
	                    </li>
	                    <li class="page-item disabled">
	                        <a class="page-link">이전</a>
	                    </li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="cnt" begin="1" end="${pc.totEndPage }" step="1">
					<li class="page-item">
						<a class="page-link" href="mainBoard.jsp?start=${cnt}">${cnt }</a>
					</li>
				</c:forEach>
				<c:choose>
					<c:when test="${s < pc.totEndPage }">
						<li class="page-item">
	                        <a class="page-link" href="mainBoard.jsp?start=${s+1}">다음</a>
	                    </li>
	                    <li class="page-item">
	                        <a class="page-link" href="mainBoard.jsp?start=${pc.totEndPage }">마지막</a>
	                    </li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
	                        <a class="page-link">다음</a>
	                    </li>
	                    <li class="page-item disabled">
	                        <a class="page-link">마지막</a>
	                    </li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<c:if test="${sessionScope.login != null }">
			<button class="btn btn-secondary" onclick="location.href='write.jsp'">글쓰기</button>
		</c:if>
	</div>
</body>
</html>