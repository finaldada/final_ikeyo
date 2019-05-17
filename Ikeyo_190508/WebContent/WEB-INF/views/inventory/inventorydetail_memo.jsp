<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%-- modal을 클릭 하면   ajax로 메모리스트를 불러와서  가져오고     맨아래칸에   
아이디 / 메모내용  /  작성 시간    /  페이징 처리 없음    => 작성칸 작성   
작성 후 에는   리스트창 새로고침    --%>


<div style="margin-left: 5%; margin-right: 5%">
<form id="memo_frm" method="post">
<table border="2" style="height: 100%; width: 100%;">
<%-- <input type="hidden" id="memo_seq" name="memo_seq" value="${memolist.memo_seq }"> --%>
<colgroup>
<col width="10"><col width="70"><col width="40">
</colgroup>

<c:if test="${empty memolist }">
<tr>
	<td colspan="3" align="center">메모가 존재하지 않습니다</td>
</tr>

</c:if>

<c:if test="${not empty memolist }">

<c:forEach items="${memolist }" var="memo" varStatus="vs">

<%-- <c:if test="${inven.model_id == memolist.model_id }"> --%>

<tr>
	
	<td>${memo.id}</td> <td>${memo.content }</td>
	<td><fmt:formatDate value="${memo.rdate }" pattern="yyyy/MM/dd"/></td> 
	<td><input type="button" onclick="memoDelete()" value="X"><td>
</tr>

<%-- </c:if> --%>
</c:forEach>


</c:if>

<tr>

<td>
<input type="text" readonly="readonly" value="${login.id}" id="id" name="id" size="10">
</td>

<td>
<input type="text" id="content" name="content" size="60" value="" >
</td>

<td>
<input type="button" onclick="memoWrite()" value="메모 등록">
</td>

</tr>

</table>

</form>
</div>



</head>
<body>

</body>
</html>