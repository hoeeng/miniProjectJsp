<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	select {width: 100%; text-align: center}
	.input-div {
		vertical-align: middle;
		}
</style>

</head>
<body>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO" />

<form action="modifyContentCheck.jsp" method="post">
	<input type="hidden" name="num"	value="${sessionScope.info.num }">
	<table border="1" width="100%">
		<tr>
			<th>카페 글쓰기</th> <td align="right"> <input type="submit" value="등록"> </td>
		</tr>
		
		<tr>
			<td>
				<select name="boardType">
					<option value="free"> 자유게시판 </option>
					<option value="other"> 다른게시판 </option>
				</select>
			</td>
			<td>
				<select name="subject">
					<option value=""> 말머리선택 </option>
					<option value="yet"> 아직없음 </option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" value=${sessionScope.info.title } name="title">
			</td>
		</tr>

	</table>
	<div class="input-div">
		<div>
			<textarea name="content" style="width: 99%" rows="10">
				${sessionScope.info.content }
			</textarea>
		</div>
	</div>
</form>

</body>
</html>