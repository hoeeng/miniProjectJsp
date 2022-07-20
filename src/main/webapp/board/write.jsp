<%@page import="miniMember.MiniMemberDTO"%>
<%@page import="miniMember.MiniMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>

<%
	MiniMemberDAO dao = new MiniMemberDAO();
	MiniMemberDTO dto = dao.getU((String)session.getAttribute("login"));
%>
<div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold;">
        <h1><b>게시글 작성</b></h1>
        <form method="post" action="write_save.jsp">
        <input type="hidden" name="id" value="<%=dto.getId() %>">
            <div class="mb-3 mt-5">
                <label class="form-label">제목</label>
                <input type="text" name="title" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">닉네임</label>
                <input type="text" class="form-control" name="nickname" value="<%=dto.getNickname() %>" readonly="readonly">
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" name="content" style="height: 150px;"></textarea>
            </div>
            <div class="text-end mt-3">
                <button class="btn btn-dark">저장</button>
                <button type="button" class="btn btn-dark" onclick="history.back()">게시판 목록</button>
            </div>
        </form>
    </div>
</body>
</html>