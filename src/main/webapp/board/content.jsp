<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<%@ include file="../base/header.jsp" %>
	<br><br>
	<jsp:useBean id="dao" class="miniBoard.MiniBoardDAO"/>
	<c:set var="dto" value="${dao.getContent(param.num) }"/>
	<jsp:useBean id="daom" class="miniMember.MiniMemberDAO"/>
	<c:set var="dtom" value="${daom.getU(login) }"/>
	<form action="boardModify.jsp">
		<input type="hidden" name="id" value="${dto.id }">
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="nickname" value="${dto.nickname }">
		<input type="hidden" name="content" value="${dto.content }">
		<input type="hidden" name="title" value="${dto.title }">
		<div class="container mt-5 mb-5">
			<div class="row row-cols-auto" >
				<div class="col"><h1><b>${dto.title }</b></h1></div>
			</div>
			<div class="container">
				<div class="row row-cols-12">
					<div class="col-1">닉네임</div>
					<div class="col-1">조회수</div>
					<div class="col-1">좋아요</div>
				</div>
				<div class="row row-cols-12">
					<div class="col-1">${dto.nickname }</div>
					<div class="col-1">${dto.hit }</div>
					<div class="col-1">${dto.likey }</div>
				</div>
			</div>
			<hr>
			<div>
				<textarea class="form-control" disabled style="height: 250px;">${dto.content }</textarea>
			</div>
		</div>
	</form>
		<div class="container mt-5 mb-5">
			<div class="text-end mt-4">
	            <a class="btn btn-dark" href="mainBoard.jsp">글목록</a>
	            <c:if test="${dto.id == sessionScope.login}" >
	            	<button class="btn btn-secondary" type="submit">글수정</button>
	                <button type="button" class="btn btn-danger" data-bs-toggle="modal" onclick="location.href='delete.jsp?num=${dto.num}'">
	                    글삭제
	                </button>
	            </c:if>
	            <c:if test="${sessionScope.login != null }">
		            <c:choose>
		            	<c:when test="${dao.ch(param.id, param.num)!=0 }">
		            		<button type="button" class="btn btn-danger" onclick="location.href='like.jsp?num=${dto.num}&&id=${dto.id }&&bu=2'" name="2" value="2">좋아요취소</button>
		            	</c:when>
		            	<c:when test="${dao.ch(param.id, param.num)==0 }">
		            		<button type="button" class="btn btn-primary" onclick="location.href='like.jsp?num=${dto.num}&&id=${dto.id }&&bu=1'" name="1" value="1">좋아요</button>
		            	</c:when>
		            </c:choose>
	            </c:if>
	        </div>
	        <hr>
	        <form method="post" action="../reply/create.jsp">
	            <div class="row">
	                <div class="col-lg-10">
	                    <input type="hidden" name="id" class="form-control" value="${sessionScope.login }">
	                    <input type="hidden" name="nickname" class="form-control" value="${dtom.nickname }">
	                    <input type="hidden" name="num" class="form-control" value="${dto.num }">
	                    <input type="text" name="content" class="form-control">
	                </div>
	                <c:choose>
	                	<c:when test="${sessionScope.login != null }">
	                		<div class="col-lg-2">
			                    <button class="btn btn-dark" style="width: 100%;">댓글생성</button>
			                </div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="col-lg-2">
			                    <button class="btn btn-dark" style="width: 100%;" disabled="disabled">댓글생성</button>
			                </div>
	                	</c:otherwise>
	                </c:choose>
	            </div>
        	</form>
        	<hr>
        	<hr>
        	<jsp:useBean id="dao2" class="miniDat.MiniDatDAO"/>
        	<c:set var="list" value="${dao2.list(dto.num) }" />
        	<c:set var="dto2" value="${dao2.getContent(param.num) }"/>
        	<c:choose>
        		<c:when test="${dto2.boardnum == null}">
        			<div class="text-center mt-5">
	                	<h2><b>첫번째 댓글을 달아주세요</b></h2>
	            	</div>
            	</c:when>
        		<c:otherwise>
        			<c:forEach var="dto3" items="${dao2.list(dto.num) }">
        				<div class="row mt-5">
		                    <div class="col-lg-3">
		                        <div class="text-center mt-3">
		                            <h4><b>닉네임 : ${dto3.nickname }</b></h4>
		                        </div>
		                    </div>
		                    <div class="col-lg-9" style="margin: auto;">
		                        <textarea class="form-control" style="height: 150px;" disabled>${dto3.content }</textarea>
		                        <div class="text-end mt-3">
		                            <c:choose>
		                            	<c:when test="${dto3.id == sessionScope.login || dto.id == sessionScope.login}">
		                            		<c:if test="${sessionScope.login == dto3.id }">
		                            			<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#dat">댓글수정</button>
		                            		</c:if>
		                                	<a href="../reply/delete.jsp?num=${dto3.num }&&boardnum=${dto2.boardnum }&&id=${sessionScope.login }" class="btn btn-danger">댓글삭제</a>
		                                </c:when>
		                            </c:choose>
		                        </div>
		                    </div>
                		</div>
        			</c:forEach>
	            </c:otherwise>
        	</c:choose>
		</div>
		
		<!-- 댓글 수정 -->
		<div class="modal fade" id="dat" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">댓글 수정창</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <form method="post" action="../reply/modify.jsp">
	                    <div class="modal-body text-center">
	                        <textarea class="form-control mt-3" name="content" placeholder="수정할 댓글을 입력하세요" style="height: 100px;"></textarea>
	                        <input type="hidden" name="id" value="${sessionScope.login }">
	                        <input type="hidden" name="boardnum" value="${dto2.boardnum }">
	                        <input type="hidden" name="num" value="${dto2.num }">
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                        <button class="btn btn-dark">수정</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
</body>
</html>