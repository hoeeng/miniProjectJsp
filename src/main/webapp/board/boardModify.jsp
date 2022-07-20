<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold;">
        <h1><b>게시글수정</b></h1>
        <form method="post" action="modify.jsp">
        	<input type="hidden" name="num" value="<%=request.getParameter("num") %>">
            <div class="mb-3 mt-5">
                <label class="form-label">제목</label>
                <input type="text" name="title" value="<%=request.getParameter("title") %>" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">작성자</label>
                <input type="text" class="form-control" readonly="readonly" value="<%= request.getParameter("nickname")%>">
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" name="content" style="height: 150px;"><%=request.getParameter("content") %></textarea>
            </div>
            <div class="text-end mt-3">
                <button class="btn btn-dark">수정</button>
            </div> 
        </form>
    </div>
</body>
</html>