<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../home/header.jsp" %>

<jsp:useBean id="dao" class="miniDat.MiniDatDAO"/>
<c:set var="dto" value="${dao.datSelect(param.datnum)}"/>

<form action="datModify.jsp">
<input type="hidden" name="datnum" value="${dto.datnum}">
<input type="hidden" name="num" value="${dto.num}">
<table class="userTable" border="1" align="center">
		<tr>
			<th>${dto.id}(${dto.nickname}) 님의 댓글 수정하기</th>
		</tr>
		<tr>
			<th>
			<textarea name="content" rows="2" cols="100%">${dto.content}</textarea>
			</th>
		</tr>
		<tr>
			<th>
				<input type="submit" value="수정 완료">
				<input type="button" value="취소"
				onclick="location.href='contentView.jsp?num=${dto.num}'">
			</th>
		</tr>
</table>


</form>
<%@ include file="../home/footer.jsp" %>




