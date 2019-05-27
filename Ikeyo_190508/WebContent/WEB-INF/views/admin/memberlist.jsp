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
<title>회원관리</title>
</head>
<body>

 
<%
String category = (String)request.getAttribute("s_category");
if(category == null){  // null값 처리 
	category = "";
}

String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null){
	keyword = "";
}

%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";


$(document).ready(function () {
	
	//  controller에서 다시 받은 값을 다시 넣어준다 
	$("#s_category").val( category );
	$("#s_keyword").val( keyword ); 
	// 다른 방법 name안에 name
	//document.frmForm1._s_keyword.value = keyword;
	
	
	
	
});
</script> 




<%-- 아이디/ 이름/ 이메일 /주소/ 회원권한 /  전화번호/ 등급 /포인트 / 회원 삭제 
	id,이름 으로 검색    core el tag 사용으로 뿌리기    del 0,1로 나눠서 조건을 세부적으로 준다   --%>
<form id="mem_frm" method="post">
<div align="center" style="margin-left: 10%; margin-right: 10%; margin-top: 10%;">
<h3>회원 관리 페이지</h3>
<br>

<table border="1" id="list_table" class="tablesorter">

<thead>

<tr style="border: 3px solid deepskyblue;">
<th>아이디</th> <th>이름</th> <th>이메일</th> <th>주소</th> <th>회원권한</th>
<th>전화번호</th> <th>등급</th> <th>포인트(p)</th> <th>회원삭제</th> 
</tr>

</thead>

<tbody>

<c:if test="${empty memberlist }">
<td colspan="9" align="center">회원 목록이 없습니다 </td>
</c:if>


<%--id, name, email, address1/2 , auth, phone, paywd(등록여부?), del, grade, point  --%>
<c:if test="${not empty memberlist }">
	<c:forEach items="${memberlist }" var="member" varStatus="vs">
	<tr>
	<c:if test="${member.del == 1 }">
	<td align="center">${member.id } </td>
	<td align="center">${member.name } </td>
	<td colspan="7" align="center">삭제 된 회원 입니다 </td>
	
	</c:if>
	
	<c:if test="${member.del == 0 }">
	
		<td align="center"><a href="#">${member.id }</a> 
		<input type="hidden" id="id" name="id" value="${member.id }"></td>
		<td align="center">${member.name }</td>
		<td align="center">${member.email }</td>
		<td align="center">${member.address1 } ${member.address2}</td>
		<td align="center">
		<c:if test="${member.auth == 3 }">
		일반회원
		</c:if>
		<c:if test="${member.auth == 1 }">
		관리자
		</c:if>
	
		
		</td>
		<td align="center">${member.phone }</td> 
		<td align="center">${member.grade }</td> 
		<td align="center">${member.point }</td> 
		<td align="center"><a href="#" ><input type="button" onclick="goDelete()" value="del" style="width: 80%;"></a></td> 

		</c:if>
	</tr>
	</c:forEach>
</c:if>

</tbody>

<tr>
	<td colspan="9" style="text-align: center">
	<select id="s_category" name="s_category">
	<option value="" selected="selected">선택</option>
	<option value="id">아이디</option>
	<option value="name">이름</option>
	</select>
	<input type="text" id="s_keyword" name="s_keyword">
	<input type="button" id="_btnSearch" value="검색">
	</td>

</tr>

</table>

<%-- controller로 넘겨주기 위한 처리 --%>
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">
 

<div>
	<jsp:include page="/WEB-INF/views/inventory/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>


</div>
</form>

<script type="text/javascript">

function goDelete() {
	
	var result = confirm('정말 삭제 하시겠습니까?'); 
	
	if(result) { 
		
	$("#mem_frm").attr("action","memberdel.do").submit();	
		
	}else{
		
		
		
		}
	
}

$(document).ready(function(){ 
	$("#list_table").tablesorter();
}); 

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber); //setter    
	
	// 페이지가 넘어가게되면 검색부분도 같이 보내줘야한다 
	$("#inven_frm").attr("action", "inventorylist.do").submit();  
	
}

$("#_btnSearch").click(function () {

	alert("click!");
	$("#_pageNumber").val("0");

	$("#inven_frm").attr("action", "memberlist.do").submit();
	
}); 

</script>


</body>
</html>