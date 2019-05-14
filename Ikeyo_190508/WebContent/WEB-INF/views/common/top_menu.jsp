<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="nows" class="java.util.Date"/>




<div style="position: fixed; width: 100%;">
	<div align="center">
		<img alt="" src="<%=request.getContextPath() %>/image/ikeyo.png" width="120">
	</div>
	
	
	<ul>
		<li><a href="bbslist.do" title="HOME">HOME</a></li>
		<li><a href="bbslist.do" title="답변형게시판">답변형게시판</a></li>
		<li><a href="calendar.do" title="일정관리">일정관리</a></li>
		<li><a href="pdslist.do" title="자료실">자료실</a></li>
		<li><a href="polllist.do" title="투표하기">투표하기</a></li>
		
		<c:if test="${login.auth eq '1' }">
			<li><a href="pollmake.do">투표 만들기</a></li>
		</c:if>
	</ul>
	
	<div id="_title_today" style="width:auto; float: right; text-align: right; padding-right: 50px;">
		<div style="position: relative;">
			<c:if test="${login.id ne '' && not empty login}">
				<a href="logout.do" title="로그아웃">${login.id }[로그아웃]</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${login.name ne '' && not empty login}">
				[${login.name }]님 환영합니다
			</c:if>
			<fmt:formatDate var="now" value="${nows }" pattern="yyyy/MM/dd"/>
			${now }
		</div>
	</div>
</div>
