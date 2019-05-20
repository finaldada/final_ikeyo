<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/inventorylist.css" type="text/css"
	media="print, projection, screen">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.tablesorter.js"></script>	
<script type="text/javascript" src="./jquery/jquery.tablesorter.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%--주문관리 시퀀스 , 사진 ? 상품명  아이디 모델명 날짜 수량 가격 상태메세지   
		텍스트 필드 검색  , 페이징 처리 --%>

<div align="center" style="margin-left: 10%; margin-right: 10%">
<h3>일단 보류 !</h3>
<h3>주문 관리 페이지 </h3>
<form id="order_frm" method="post">


<table border="1" id="list_table" class="tablesorter">

<thead>

<tr style="border: 3px solid deepskyblue;">
<!-- <th>&nbsp;&nbsp;</th> --> <th>상품명</th> <th>아이디</th> <th>모델명</th> 
<th>날짜</th> <th>수량(개)</th> <th>가격(원)</th> <th>현재상태</th> 
</tr>

</thead>

<tbody>

<c:if test="${empty orderlist}">
<tr>
	<th colspan="7">현재 주문처리 목록이 없습니다.</th>
<tr>
</c:if>

<c:if test="${not empty orderlist}">
<c:forEach items="${orderlist }" var="order" varStatus="vs">
<tr>
<!-- <td></td> --> <td></td> <td></td> <td></td>
<td></td> <td></td> <td></td> <td></td>

</tr>
</c:forEach>
</c:if>
</tbody>

</table>
</form>
</div>

</body>
</html>