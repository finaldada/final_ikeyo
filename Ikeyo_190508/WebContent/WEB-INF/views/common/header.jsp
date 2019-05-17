<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/> 


<!-- header.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">


<div id="header_div">
<br>
<div id="header_nav">
     <ul>
        <li style="margin-left: 90px;"><b><a href=".do" style="color: #535353; text-decoration: none;">고객지원  ｜</a></b></li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;오시는 길 ｜</a></b></li>
        <li><b><a href="polllist.do" style="color:#535353; text-decoration: none;">&nbsp;투표 ｜</a></b></li>
     	<c:if test="${login.auth eq '1' }">
		<li><b><a href="pollmake.do" >&nbsp;투표 만들기 ｜</a></b></li>
		</c:if>
     </ul>   
</div> 

<div id="header_nav">
     <ul>
        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><a href="login.do" style="color: #535353; text-decoration: none;">로그인  ｜</a></b></li>
        <li><b><a href="mypage.do" style="color:#535353; text-decoration: none;">&nbsp;마이페이지 ｜</a></b></li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;위시리스트 ｜</a></b></li>
        <li><b><a href=".do" style="color:#535353; text-decoration: none;">&nbsp;장바구니 </a></b></li>
     </ul>   
</div> 


</div>
