<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home/header.jsp" %>

<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>

<c:set var="total" value="${dao.pageCount()}"/>

<c:set var="pc" value="${dao.pagingNum(param.start)}"/>

<c:set var="list" value="${dao.boardList(pc.startPage, pc.endPage)}"/>

<h1>게시판</h1>

<table border="1" class="userTable">
	<tr>
		<th>게시글 번호</th> 
		<th>아이디</th>
		<th>닉네임</th> 
		<th>제목</th> 
		<th>조회수</th>
		<th>작성일</th> 
		<th>♥</th>
	</tr>
		<c:forEach var="dto" items="${list }">
			<c:choose>
				<c:when test="${dto!=null}">
					<tr>
						<th>${dto.num}</th> 
						<th>${dto.id }</th>
						<th>${dto.nickname}</th>
						<th>
							<a href="contentView.jsp?num=${dto.num}">
							${dto.title }
							</a>
						</th> 
						<th>${dto.hit }</th>
						<th>${dto.savedate }</th> 
						<th>${dto.likey }</th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="7">게시글 없음</th>
					</tr>			
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<tr>
			<th>
			<input type="button" value="글 등록"
				onclick="location.href='boardWrite.jsp?id=${sessionId}'">
			</th>
			
			
			
			<th colspan="5">
				<c:choose>
					<c:when test="${param.start==null }">
						<c:set var="s" value="1"/>
					</c:when>
					<c:otherwise>
						<c:set var="s" value="${param.start}"/>
					</c:otherwise>
				</c:choose>
			
				
				<c:choose>
					<c:when test="${s<=1}">
						<button disabled>이전</button>
					</c:when>
					<c:otherwise>
						<input type="button" value="이전" 
						onclick="location.href='boardList.jsp?start=${s-1}'">
					</c:otherwise>
				</c:choose>
			
				<c:forEach var="su" begin="1" end="${pc.totPage}" step="1">
					<a href="boardList.jsp?start=${su}">[${su}]</a>
				</c:forEach>
				
				<c:choose>
					<c:when test="${s >= pc.totPage}">
						<button disabled>다음</button>
					</c:when>
					<c:otherwise>
						<input type="button" value="다음" 
						onclick="location.href='boardList.jsp?start=${s+1}'">
					</c:otherwise>
				</c:choose>
				
			</th>

			<th>
				<input type="button" value="회원목록"
					onclick="location.href='/miniProjectJsp/member/memberList.jsp'">
			</th>
		</tr>

</table>
<%@include file="../home/footer.jsp" %>