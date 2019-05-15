<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div align="center">
<form action="inventoryupdate.do" method="post">
<table border="1"> 


<input type="hidden" id="inven_seq" name="inven_seq" value="${inven.inven_seq }">


<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id" 
	value="${inven.model_id }" readonly="readonly"></td>
	
</tr>

<tr>  
	<td> 
		카테고리:<input id="category" name="category"  value="${inven.price }" readonly="readonly"> 
	</td>
</tr>

<tr>    <%-- + - 버튼 ??  --%>
	<td>수량:<input type="number" id="count" name="count" 
	size="50" min="1" max="1000" value="${inven.count }" readonly="readonly">개</td>
</tr>

<tr>  
	<td><input type="text" id="price" name="price" value="${inven.price }" readonly="readonly">원</td>
</tr>

<tr>
	<td align="center"><input type="submit" value="재고 수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="재고 등록 취소" onclick="goback()"></td>
</tr>

</table>
</form>
</div>


</body>
</html>