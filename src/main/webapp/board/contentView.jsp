<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home/header.jsp" %>
<style type="text/css">
	
	.contentTh{
		text-align:center;
	}
</style>
</head>
<body>
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>
${dao.hitUp(param.num)}
<c:set var="dto" value="${dao.getContent(param.num)}"/>
<c:set var="admin" value="ybh0821"/>


<form action="boardModify.jsp">
	<input type="hidden" value="${param.num}" name="num">
	<table border="1" align="center" class="userTable">
	<tr>
		<th>아이디</th> <th>닉네임</th> <th>제목</th>
		<th rowspan="2">조회수<br>${dto.hit}</th>  
		<th rowspan="2">
		<button type="button" onclick="location.href='likeChk.jsp?num=${param.num}'">좋아요♥</button>
		<br>${dto.likey}</th>
	</tr>
	
	<tr>
		<th>
			<input type="text" name="id" value="${dto.id}" readonly class="contentTh">
		</th>
		
		<th>
			<input type="text" name="nickname" value="${dto.nickname}" readonly class="contentTh">
		</th>
		<th>
			<input type="text" name="title" value="${dto.title }" class="contentTh">
		</th>
	</tr>

	<tr>
		<th>작성시간<br>${dto.savedate}</th>
		<th colspan="4">
			<textarea rows="10" cols="100%" name="content">${dto.content }</textarea>
		</th>
	</tr>
	
	<tr>
		<th colspan="5">
			<c:choose>
				<c:when test="${dto.id == sessionId || sessionId == admin}">
					<input type="submit" value="수정">
					<input type="button" value="삭제"
					onclick="location.href='boardDelete.jsp?num=${param.num}'">
				</c:when>
				<c:otherwise>
					<input type="submit" value="수정" disabled>
					<input type="button" value="삭제" disabled>
				</c:otherwise>
			</c:choose>
			
			<input type="button" value="목록으로" onclick="location.href='boardList.jsp'">
		</th>
	</tr>
	
	</table>
</form>
<hr>
<h3 align="center">댓글 목록</h3>
<hr>
<jsp:useBean id="datDAO" class="miniDat.MiniDatDAO"/>


<table class="userTable" border="1" align="center">
	
		<c:set var="datDTO" value="${datDAO.datList(param.num)}" />
		
		<c:choose>
			<c:when test="${datDTO.size() != 0}">
				<c:forEach var="list" items="${datDTO}">
					<tr>
						<td>${list.id}(${list.nickname})</td> 
					</tr>
					<tr>
						<th>
							<textarea rows="5" cols="100%" readonly>${list.content}</textarea>
						</th>
					</tr>
					<tr>
						<td>
							${list.savedate } 
							<a href="#">답글쓰기</a>
							
							<c:choose>
								<c:when test="${list.id == sessionId || sessionId == admin}">
									<input type="button" value="삭제" onclick=
									"location.href='datDelete.jsp?datnum=${list.datnum}&&num=${list.num}'">
									<input type="button" value="수정" onclick=
									"location.href='datModifyView.jsp?datnum=${list.datnum}'">
								</c:when>
								<c:otherwise>
									<input type="button" value="삭제" disabled>
									<input type="button" value="수정" disabled>
								</c:otherwise>
							</c:choose>
							
						</td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<tr>
					<th>아직 등록된 댓글이 없습니다</th>
				</tr>
			</c:otherwise>
			
		</c:choose>
</table>
<hr><h5 align="center">댓글 작성</h5>
<jsp:useBean id="daoMember" class="miniMember.MiniMemberDAO"/>
<c:set var="memberDTO" value="${daoMember.memberInfo(sessionId)}"/>
<form action="datSave.jsp">

	<input type="hidden" name="id" value="${memberDTO.id}">
	<input type="hidden" name="nickname" value="${memberDTO.nickname}">
	<input type="hidden" name="num" value="${param.num}">
	
	<table border="1" align="center" class="userTable">
		<tr>
			<th>
			<textarea name="content" rows="2" cols="100%"></textarea>
			</th>
		</tr>
		<tr>
			<th>
				<input type="submit" value="댓글 작성">
				<input type="button" value="목록 이동"
				onclick="location.href='boardList.jsp'">
			</th>
		</tr>
	</table>
</form>
<%@include file="../home/footer.jsp" %>