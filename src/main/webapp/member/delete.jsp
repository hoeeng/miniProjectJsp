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
<jsp:useBean id="dao" class="miniMember.MiniMemberDAO"/>
${dao.delete(param.id)}
<script type="text/javascript">
	alert('삭제완료')
	location.href='memberList.jsp'
</script>



</body>
</html>