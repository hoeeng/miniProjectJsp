<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="miniDat.MiniDatDAO"/>
${dao.datModify(param.datnum,param.content)}
<script type="text/javascript">
	location.href='contentView.jsp?num=${param.num}'
</script>

</body>
</html>