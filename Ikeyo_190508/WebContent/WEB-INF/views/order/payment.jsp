<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>payment</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

</head>
<body>

<!-- // 결제페이지 -->
<div class="f_content">
<div class="f2_content">

<!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
	<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>
		
<c:if test="${login.name ne '' }">
	[${login.name }]님 환영합니다
</c:if>

<div align="left">
<form >

	<h2>결제 정보</h2>
	
<c:forEach var="paymentlist" items="${paymentlist }">
<c:if test="${paymentlist.id == login.id }">	
	<table style="border: 2px solid gray;">
	
	<tr>
		<td>주문번호</td>
	</tr>
	<tr>
		<td>${paymentlist.order_num }</td>
	</tr>
	
	<tr>
		<td>수령인</td>
	</tr>
	<tr>
		<td>수령인</td>
	</tr>
	
	<tr>
		<td>주문날짜</td>
	</tr>
	<tr>
		<td>주문날짜</td>
	</tr>
	
	<tr>
		<td>수령인 연락처</td>
	</tr>
	<tr>
		<td>수령인 연락처</td>
	</tr>
	
	<tr>
		<td>배송지</td>
	</tr>
	<tr>
		<td>배송지</td>
	</tr>
	
	<tr>
		<td>주문요청사항</td>
	</tr>
	<tr>
		<td>주문요청사항</td>
	</tr>
	</table>
	
</c:if>
</c:forEach>
<!-- // -->
</form>

</div>

</div>
</div>



</body>
</html>