<%@page import="kh.com.a.util.DateUtil"%>
<%@page import="kh.com.a.model.PollDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="./css/inventorylist.css" type="text/css"
	media="print, projection, screen">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.tablesorter.js"></script>	
<script type="text/javascript" src="./jquery/jquery.tablesorter.min.js"></script>


<%
List<PollDto> plists = (List<PollDto>)request.getAttribute("plists");
%>

<div align="center"  style="margin-left: 10%; margin-right: 10%; margin-top: 10%">
<!-- 관리자 -->
<c:if test="${login.auth eq '1' }">

<table id="list_table" class="tablesorter" style="width: 95%" border="2">
<col width="50"><col width="50"><col width="300">
<col width="100"><col width="100"><col width="100">
<col width="50"><col width="100">

<thead>
<tr>
	<th>번호</th><th>아이디</th><th>질문</th>
	<th>시작일</th><th>종료일</th><th>질문항수</th>
	<th>투표수</th><th>등록일</th>
</tr>
</thead>

<tbody>
<%
	for(int i = 0;i < plists.size(); i++){
		PollDto poll = plists.get(i);
		%>
		<tr bgcolor="#aabbcc">
			<td><%=i+1 %></td>
			<td><%=poll.getId() %></td>
			<td><%=poll.getQuestion() %></td>
			<td><fmt:formatDate value="<%=poll.getSdate() %>" pattern="yyyy/MM/dd/"/></td>
			<td><fmt:formatDate value="<%=poll.getEdate() %>" pattern="yyyy/MM/dd/"/></td>
			<td style="text-align: center;"><%=poll.getItemcount() %></td>
			<td style="text-align: center;"><%=poll.getPolltotal() %></td>
			<td><fmt:formatDate value="<%=poll.getRegdate() %>" pattern="yyyy/MM/dd/"/></td>
			
		</tr>		
		<%
	}
%>
</tbody>
</table>
</c:if>

<!-- 사용자 -->
<c:if test="${login.auth eq '3' }">

<table id="list_table" class="tablesorter" style="width: 95%" border="2">
<col width="50"><col width="50"><col width="300"><col width="50">
<col width="100"><col width="100"><col width="100">
<col width="50"><col width="100">

<thead>
<tr>
	<th>번호</th><th>아이디</th><th>질문</th><th>결과</th>
	<th>시작일</th><th>종료일</th><th>질문항수</th>
	<th>투표수</th><th>등록일</th>
</tr>
</thead>

<tbody>
<%
	for(int i = 0;i < plists.size(); i++){
		PollDto poll = plists.get(i);
		%>
		<tr bgcolor="#aabbcc">
			<td><%=i+1 %></td>
			<td><%=poll.getId() %></td>
			<%
			boolean isS = poll.isVote();
			if(isS || DateUtil.isEnd(poll.getEdate())){
			// 투표했음	투표기한이 끝났음 	
				%>				
				<td>[마감]<%=poll.getQuestion() %></td>				
				<%
			}else{
				%>
				<td>
					<a href="polldetail.do?pollid=<%=poll.getPollid() %>">
						<%=poll.getQuestion() %>
					</a>
				</td>				
				<%
			}			
			%>
			
			<td>
			<%
			if(isS || DateUtil.isEnd(poll.getEdate())){	// 결과 볼수 있음
				%>
				<a href="pollresult.do?pollid=<%=poll.getPollid() %>">결과</a>
				<%
			}else{	// 결과를 볼수 없음
				%>
				<img alt="" src="image/pen.gif">
				<%
			}
			%>
			</td>
			
			<td><fmt:formatDate value="<%=poll.getSdate() %>" pattern="yyyy/MM/dd/"/></td>
			<td><fmt:formatDate value="<%=poll.getEdate() %>" pattern="yyyy/MM/dd/"/></td>
			<td style="text-align: center;"><%=poll.getItemcount() %></td>
			<td style="text-align: center;"><%=poll.getPolltotal() %></td>
			<td><fmt:formatDate value="<%=poll.getRegdate() %>" pattern="yyyy/MM/dd/"/></td>		
		</tr>
		<%
	}
%>

</tbody>
</table>
</c:if>

</div>

<script>

$(document).ready(function(){ 
	$("#list_table").tablesorter();
}); 

</script>







