<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="datdao" class="miniDat.MiniDatDAO" />
	<jsp:useBean id="boarddao" class="miniBoard.MiniBoardDAO" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:set var="boardCount" value="${boarddao.getBoardCount(sessionScope.loginSuccess) }"/>
	<c:set var="datCount" value="${datdao.getDatCount(sessionScope.loginSuccess) }"/>
	
	내가 쓴글 : ${boardCount } <br>
	내가 쓴 댓글 : ${datCount } <br> <br>
	
	<a> 내가 쓴 글 보기 </a> <br>
	<a> 내가 쓴 댓글 보기 </a> <br>
	<a> 댓글 단 글 </a> <br>
	<a> 좋아요 한 글 </a> <br>
	
	
	

</body>
</html>