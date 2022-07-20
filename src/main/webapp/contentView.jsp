<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	table { width: 50%; margin: auto;}
</style>

<title>Insert title here</title>
</head>
<body>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />
<jsp:useBean id="datdao" class="miniDat.MiniDatDAO" />
<jsp:useBean id="memdao" class="miniMember.MiniMemberDAO" />
<jsp:useBean id="likedao" class="miniLikey.MiniLikeyDAO" />

<c:set var="dto" value="${dao.getBoard(param.title) }" />
<c:set var="datList" value="${datdao.getDatList(dto.num) }" />
<c:set var="boardLikeyCheck" value="${likedao.checkBoard(dto.num, sessionScope.loginSuccess) }" />


<table border="1">
	<tr>
		<th>제목 : ${dto.title }</th>
	</tr>
	
	<tr>
		<th>작성자 : ${dto.nickname }</th>
	</tr>
	<tr>
		<th>작성일 : ${dto.savedate }</th>
		<th>조회수 : ${dto.hit }</th>
	</tr>
	
	<tr>
		<td>내용 : ${dto.content } </td>
	</tr>
	
	<tr>
		<td>좋아요 : ${dto.likey }</td>
		<td> 
			<c:choose>
				<c:when test="${boardLikeyCheck == 0 || boardLikeyCheck == null}">
			 		<input type="button" value="좋아요" id="likeButton" onclick="location.href='likeUp.jsp?num=${dto.num}&goback=${dto.title }'">
				</c:when>
				
				<c:when test="${boardLikeyCheck == 1 }">
					<input type="button" value="좋아요취소" id="dislikeButton" onclick="location.href='likeDown.jsp?num=${dto.num}&goback=${dto.title }'">
				</c:when>
			</c:choose>
		</td>
	</tr>
</table>

<input type="button" onclick="location.href='list.jsp'" value="게시글 목록">

<c:if test="${sessionScope.loginSuccess == dto.id }">
	<form action="modifyContentForm.jsp" method="post" >
		<!-- <input type="hidden" value="${dto }" name="info">  -->
		<c:set var="info" value="${dto }" scope="session"/>
		<input type="submit" value="글 수정">
	</form>
	
	<form action="deleteContent.jsp" method="post">
		<input type="hidden" name="num" value="${dto.num }" >
		<input type="submit" value="글삭제">
	</form>
</c:if>

<br><br>



<table border="1">
	<tr>
		<th> 댓글 </th>
	</tr>
	
	
	<c:forEach var="datdto" items="${datList }">
		<tr>
			<td> 댓글작성자id : ${datdto.id } </td>
			<td> 좋아요 : ${datdto.likey } </td>
		</tr>
		<tr>
			<td> 댓글내용 : ${datdto.content }</td>
			<td> 

<c:set var="datLikeyCheck" value="${likedao.checkDat(datdto.datnum, sessionScope.loginSuccess) }" />

				<c:choose>
					<c:when test="${datLikeyCheck == 0 || datLikeyCheck == null}">
				 		<input type="button" value="좋아요" id="likeButton" onclick="location.href='likeUp.jsp?datnum=${datdto.datnum}&goback=${dto.title }'">
					</c:when>
					
					<c:when test="${datLikeyCheck == 1 }">
						<input type="button" value="좋아요취소" id="dislikeButton" onclick="location.href='likeDown.jsp?datnum=${datdto.datnum}&goback=${dto.title }'">
					</c:when>
				</c:choose>			
				
			</td>
		</tr>
		<tr>
			<td> 댓글작성시간 : ${datdto.savedate }</td>
			<td> 답글쓰기 </td>
		</tr>
		
		<c:if test="${datdto.id == sessionScope.loginSuccess }">
			<tr>
				<td> 
					<input type="button" value="수정" onclick="">			
				</td>
				<td> 
					<form action="datDelete.jsp">
						<input type="submit" value="삭제" >
						<input type="hidden" name="datnum" value="${datdto.datnum }">
						<input type="hidden" name="title" value="${dto.title }" >
					</form>
				</td>
			</tr>
		</c:if>
	</c:forEach>
</table>


<c:if test="${sessionScope.loginSuccess != null }">
<c:set var="userInfo" value="${memdao.memberInfo(sessionScope.loginSuccess) }" />
	<form id="datform" action="datCheck.jsp" method="post">
		
		<textarea placeholder="댓글을 남겨보세요" rows="4" cols="50" name="content"></textarea>
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="id" value="${userInfo.id }">
		<input type="hidden" name="nickname" value="${userInfo.nickname }">
		<input type="hidden" name="title" value=${dto.title } >
		
		<input type="submit" value="등록">
	</form>
</c:if>

</body>
</html>