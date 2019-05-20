<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>index.jsp</h1>

<%
response.sendRedirect("main.do");
%>

<!-- 
<input type="button" value="go to inven" onclick="goInven()"> 
<br>
<input type="button" value="go to login" onclick="goLogin()">
<br>
<input type="button" value="go to mypage" onclick="goMypage()">
<br>
<input type="button" value="go to notice" onclick="goNotice()">
<br>
<input type="button" value="go to poll" onclick="goPoll()">
<br>


<br>
<a href="productList.do?category=침대">침대 리스트</a>
<a href="productList.do?category=책상">책상 리스트</a>
<a href="memberlist.do">회원 관리 리스트 </a>

<br>
<a href="logout.do">로그아웃</a>

<script type="text/javascript">

function goInven() {
	alert("go to inven");
	location = "inventorylist.do";
}

function goLogin() {
	alert("go to login");
	location = "login.do";
}

function goMypage() {
	alert("go to mypage");
	location = "mypage.do";
}

function goNotice() {
	alert("go to Notice");
	location = "noticelist.do";
}

function goPoll() {
	alert("go to Poll");
	location = "polllist.do";
}

</script>
 -->

</body>
</html>