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
<title>inventoryupdate.jsp</title>
</head>
<body>

<div align="center">
<form action="inventoryupdateAf.do" method="post">
<table border="1"> 
<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id" 
	value="${inven.model_id }" readonly="readonly"></td>
	
</tr>

<tr>  
	<td> 
		카테고리:<select id="category" name="category" > 

		<option value="침대/매트릭스" ${inven.category eq '침대/매트릭스'?"selected='selected'":""  }>침대/매트릭스</option>
		<option value="의자/소파" ${inven.category eq '의자/소파'?"selected='selected'":""  }>의자/소파</option>
		<option value="옷장/수납장" ${inven.category eq '옷장/수납장'?"selected='selected'":""  }>옷장/수납장</option>
		<option value="책상/테이블" ${inven.category eq '책상/테이블'?"selected='selected'":""  }>책상/테이블</option>
		<option value="커튼/블라인드/조명" ${inven.category eq '커튼/블라인드/조명"'?"selected='selected'":""  }>커튼/블라인드/조명</option>
		</select> 
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