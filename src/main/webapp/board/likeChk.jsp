<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--유저의 정보를 가져와 likey가 0이였으면 1 아니면 0  -->
<!-- likeBoard의 라이키가 +1 아니면 -1 되게  -->
<jsp:useBean id="daoMember" class="miniMember.MiniMemberDAO"/>
<jsp:useBean id="daoBoard" class="miniBoard.MiniBoardDAO"/>


<c:set var="result" value="${daoMember.userLikeyUp(sessionId,param.num)}"/>
<c:choose>
	<c:when test="${result == 2}">
		<script type="text/javascript">
			alert('좋아요가 반영되었습니다')
			location.href='contentView.jsp?num=${param.num}'
		</script>
	</c:when>
	<c:when test="${result == 3}">
		<script type="text/javascript">
			alert('좋아요가 취소되었습니다')
			location.href='contentView.jsp?num=${param.num}'
		</script>
	</c:when>
	<c:when test="${result == 4}">
		<script type="text/javascript">
			alert('좋아요가 취소되려다 말았습니다;;')
			location.href='contentView.jsp?num=${param.num}'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('몰라')
			location.href='contentView.jsp?num=${param.num}'
		</script>
	</c:otherwise>
</c:choose>











</body>
</html>





