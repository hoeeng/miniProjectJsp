<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

var con=document.getElementById=('rightCon')
			
	function mainUp(obj){
		obj.style.backgroundColor="white";
		obj.style.opacity="0.7";
	}
	function mainDown(obj){
		obj.style.backgroundColor="";
		obj.style.opacity="";
	}
	
	function rightUp(obj){
		obj.style.backgroundColor="white";
		obj.style.opacity="1";
	}
	
	function rightDown(obj){
		obj.style.backgroundColor="white";
		obj.style.opacity="0.7";
	}
	

	function mouseOn(obj){
		if(obj.id=="iu1"){
			obj.src="이미지/아이유1.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="iu2"){
			obj.src="이미지/아이유2.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="iu3"){
			obj.src="이미지/아이유3.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="iu4"){
			obj.src="이미지/아이유4.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="차성훈2-1"){
			obj.src="이미지/아이유2-1.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="차성훈2-2"){
			obj.src="이미지/아이유2-2.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="차성훈2-3"){
			obj.src="이미지/아이유2-3.jpg";
			obj.className="imgChange1";
		}else if(obj.id=="차성훈2-4"){
			obj.src="이미지/아이유2-4.jpg";
			obj.className="imgChange1";
		}
	}
	
	function mouseOut(obj){
		if(obj.id=="iu1"){
			obj.src="이미지/아이유6.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="iu2"){
			obj.src="이미지/아이유7.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="iu3"){
			obj.src="이미지/아이유8.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="iu4"){
			obj.src="이미지/아이유9.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="차성훈2-1"){
			obj.src="이미지/차성훈2-1.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="차성훈2-2"){
			obj.src="이미지/차성훈2-2.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="차성훈2-3"){
			obj.src="이미지/차성훈2-3.jpg";
			obj.className="imgChange2";
		}else if(obj.id=="차성훈2-4"){
			obj.src="이미지/차성훈2-4.jpg";
			obj.className="imgChange2";
		}	
	}
	
	function logChk(){
		alert('로그인후 이용 가능합니다')
		location.href='/miniProjectJsp/log/login.jsp'
	}

</script>

<style type="text/css">
	
	.imgChange1{
		transition: all 5s linear;
		opacity: 0;
	}
	.imgChange2{
		transition: all 5s linear;
		opacity: 1;
	}

	body{margin:0 auto;}
	
	#mainWrap{width:100%;}
	
	.mainHeader{
		display:flex; position: fixed; width:100%; z-index: 5;
		/*   background-color: white; opacity: 0.5; */
	}
	.mainHeaderRight{
		position: fixed; z-index: 6;
		width:15%; text-align:right;
		padding-right:30px;
	}
	
	.mainHeaderLeft{
		width:45%; padding-left:40px;
	}
	
	.mainHeaderCenter{
		width:40%; text-align:left;
	}

	.HOME{
		width:30%;
		padding:30px 0 20px 20px;
		font-size:50px;
	}
	
	.homeList{
		width:70%;
	}

	#main{
		padding-top:100px;
		padding-bottom:30px;
		text-align:center;
		margin: 0 auto;
	}

	.home_list{
		display:flex;
		cursor : pointer;
	}
	
	.homeList ul li{
		float:left;
		list-style: none;
		padding:30px 20px 20px 20px;
		font-size:25px;
		z-index: 3;
	}
	
	
	li:hover{
		color:red;
	}
	.HOME:hover{
		color:orange;
	}
	
	.mainHeaderRight img{
		width:30px;
		padding:30px 20px 20px 20px;
	}
	
	.mainHeaderRight{
		padding:20px;
	}
	.mainTable{
		width:90%;
		margin:0 auto;
	}
	.mainTable img{
		width:400px;
		height:400px;
	}
	
	.price1{
		color:gray;
	}
	.price2{
		color:#008BCC;font-weight:bold;
	}
	.footer_top{
		font-size:30px;
		font-style: bold;
	}
	.footer_bottom{
		font-size:20px;
		font-style:bold;
		color:gray;
	}
	
	.countTable{
		margin:0 auto;
	}
	
	#panel{
		background-color:aqua; border:1px solid black;
		display:none; height:100%; width:500px;
	}
	.userTable{
		margin:0 auto;
		padding-top:30px;
		font-size:30px;
	}
	
	.mainHeaderRight{
		diplay:block;
		width:20%; height:1000px;
		left:120%; top:5px;
		margin-left:-45%; overflow:hidden;
		clip:rect(0,auto,auto,0);
	}
	
	#toggle{display:none;}
	.btn{
		display:inline-block;
		padding:10px 20px;

	}

	#toggle:checked ~ .offcanvas{
		transform:translateX(200%);
	}

	.offcanvas{
		position:fixed;
		display:inline-block;
		width:40%; top:11%; left:0; bottom:0;
		transform:translateX(260%);
		transition:transform 0.5s ease-out;
		background:white;
		opacity: 0.7;
	}
	.offcanvas h1 a{
	  margin:0;
	  display:inline-block;
	  width:100%;
	  height:40px;
	  line-height:40px;
	  
	  font-size:50px;
	  color:orange;
	  text-align:left;
	  float:left;
	  text-decoration: none;
}

.offcanvas ul {
  	padding:0;
}

.offcanvas ul li {
	 list-style:none;
	 display:inlnie-block;
	 width:100%;
	 height:60px;
	 float:left;
	 box-sizing:border-box;
	 margin:0;
	 text-align:left; 
	 font-size:30px;
	 padding:20px;
	 cursor : pointer;
 }

	
</style>
</head>
<body>


<div id="mainWrap">

	<div class="mainHeader" onmouseover="mainUp(this)" onmouseout="mainDown(this)">
		<div class="mainHeaderLeft">
		
			<div class="home_list">
				<div class="HOME" onclick="location.href='/miniProjectJsp/shop/mainShop.jsp'">
					HOME
				</div>
				
				<div class="homeList">
					<ul>
					<c:choose>
						<c:when test="${sessionId!=null }">
							<li class="homeList_1" onclick=
							"location.href='/miniProjectJsp/member/memberList.jsp'">MEMBERSHIP</li>
							<li class="homeList_2" onclick=
							"location.href='/miniProjectJsp/board/boardList.jsp'">BOARD</li>
							<li class="homeList_3"onclick=
							"location.href='/miniProjectJsp/log/login.jsp'">LOGOUT</li>
						</c:when>
						<c:otherwise>
							<li class="homeList_1" onclick="logChk()">MEMBERSHIP</li>
							<li class="homeList_2" onclick="logChk()">BOARD</li>
							<li class="homeList_3"onclick=
							"location.href='/miniProjectJsp/log/login.jsp'">LOGIN</li>
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div>
			
		</div>
		
		<div class="mainHeaderCenter">
			<button>
				팝업 대충 배송비 쿠폰 요런거
			</button>
		</div>
	</div>
	<div class="mainHeaderRight">
			<img src="/miniProjectJsp/shop/이미지/배송아이콘.jpg">
			<img src="/miniProjectJsp/shop/이미지/할인아이콘.jpg">
			<input type="checkbox" id="toggle">
			<label for="toggle" class="btn"><img src="/miniProjectJsp/shop/이미지/메뉴아이콘.jpg"></label>
		
			<div class="offcanvas" onmouseover="rightUp(this)" onmouseout="rightDown(this)">
				<h1><a href="/miniProjectJsp/shop/mainShop.jsp">HOME</a></h1>
				<ul>
					<c:choose>
						<c:when test="${sessionId!=null }">
							<li class="homeList_1" onclick=
							"location.href='/miniProjectJsp/member/memberList.jsp'">회원정보</li>
							<li class="homeList_2" onclick=
							"location.href='/miniProjectJsp/board/boardList.jsp'">게시판</li>
							<li class="homeList_3"onclick=
							"location.href='/miniProjectJsp/log/login.jsp'">로그아웃</li>
						</c:when>
						<c:otherwise>
							<li class="homeList_1" onclick="logChk()">회원정보</li>
							<li class="homeList_2" onclick="logChk()">게시판</li>
							<li class="homeList_3"onclick=
							"location.href='/miniProjectJsp/log/login.jsp'">로그인</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

		</div>	

<div id="main">
<hr>