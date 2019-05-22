<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

<!-- header.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">


<div id="header_div" style="height: 60px;">

<div id="header_nav" style="margin-left: 20px;">
<br>
     <ul>
		<li style="margin-left: 90px;">
        	<!--
        	<b><a href="#" style="color: #535353; text-decoration: none;">고객지원  ｜</a>
        	</b>
        	<ul>
        		<li><a href="noticelist.do">공지사항</a></li>
        		<li><a href="customlist.do">고객의 소리</a></li>
        	</ul>
        	-->
        	<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" 
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					style="color: #535353; text-decoration: none;">
					<b>고객지원 </b>
				</a><b> ｜</b>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="noticelist.do">공지사항</a>
					<a class="dropdown-item" href="customlist.do">고객의 소리</a>
				</div>
        	</div>
        </li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;오시는 길 ｜</a></b></li>
        <li><b><a href="polllist.do" style="color:#535353; text-decoration: none;">&nbsp;투표 ｜</a></b></li>
        <li><b><a href="calendar.do" style="color:blue; text-decoration: none;">&nbsp;출석체크 </a></b></li>
        <li><b><a href="login.do" style="color: #535353; text-decoration: none;">&nbsp;로그인 ｜</a></b></li>
        <li><b><a href="mypage.do" style="color:#535353; text-decoration: none;">&nbsp;마이페이지 ｜</a></b></li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;위시리스트 ｜</a></b></li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;장바구니 </a></b></li>
     	<c:if test="${login.auth eq '1' }">
		<li><b><a href="pollmake.do" >&nbsp;투표 만들기 ｜</a></b></li>
		</c:if>
     </ul>   
</div>


</div>
