<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<fmt:requestEncoding value="utf-8"/>


<script type="text/javascript">
$(document).ready(function() {
	
	for(i = 5; i <= 10; i++){	// 기본적으로 보기가 4개까지 보여지도록 하는 처리
		$("#poll" + i).hide();	// 감추기
	}
	
});

function pollchange(me) {	// 보기의 갯수를 갱신하는 함수
	var num = me.options[me.selectedIndex].value;
	alert(num + "개");
	
	for(i = 1; i <= 10; i++){	// 초기화
		$("#pol" + i).val("");
		$("#poll" + i).hide();	// 감추기
	}
	
	for (i = 1; i <= num; i++) {
		$("#poll" + i).show();	// 보이기
	}	
}
</script>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);			// 년
int tmonth = cal.get(Calendar.MONTH) + 1;	// 월
int tday = cal.get(Calendar.DATE) + 1;		// 일
%>

<form action="pollmakeAf.do" method="post">
<table class="list_table" style="width: 85%;">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		${login.id }
		<input type="hidden" name="id" value="${login.id }">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<!-- 연도 -->
		<select name="syear">
			<%
			for(int i = tyear; i < tyear + 6; i++){
				%>
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>				
				<%
			}
			%>
		</select>년
		<!-- 월 -->
		<select name="smonth">
			<%
			for(int i = 1; i <= 12; i++){
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				<%
			}
			%>
		</select>월	
		<!-- 일 -->
		<select name="sday">
			<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				<%
			}
			%>
		</select>일
		~		
		<!-- 연도 -->
		<select name="eyear">
			<%
			for(int i = tyear; i < tyear + 6; i++){
				%>
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>				
				<%
			}
			%>
		</select>년
		<!-- 월 -->
		<select name="emonth">
			<%
			for(int i = 1; i <= 12; i++){
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				<%
			}
			%>
		</select>월	
		<!-- 일 -->
		<select name="eday">
			<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				<%
			}
			%>
		</select>일		
	</td>
</tr>

<tr>
	<th>투표내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question"></textarea>
	</td>
</tr>

<tr>
	<th>투표 문항수</th>
	<td style="text-align: left;">
		<select name="itemcount" onchange="pollchange(this)">	<!-- onchange 바뀔때 마다 호출 -->
			<%
			for(int i = 2; i <= 10; i++){
				%>
				<option <%=(4 + "").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>개
	</td>
</tr>

<tr>
	<th>투표상세문항</th>
	<td style="text-align: left;">
		<%
		for(int i = 1; i <= 10; i++){
			%>
			<div id="poll<%=i%>">
				<%=(i+"") %>번:&nbsp;<input type="text" name="poll<%=i %>" size="60" id="pol<%=i%>">
			</div>
			<%
		}
		%>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="투표만들기">
	</td>
</tr>


</table>
</form>












