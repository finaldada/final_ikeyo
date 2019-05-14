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

<h3>업데이트 !!  수량 버튼 방식과  스크립트 추가 해 줘야 함 </h3>

<div align="center">
<form action="inventoryupdateAf.do" method="post">
<table border="1"> 

<input type="hidden" id="inven_seq" name="inven_seq" value="${inven.inven_seq }">

<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id" 
	value="${inven.model_id }" >
	<input type="button" value="중복체크" onclick="inventoryCheck()">
	<div id="_model_id"></div>
	</td>
	
</tr>

<tr>  
	<td> 
		카테고리:<select id="category" name="category" > 

		<option value="침대" ${inven.category eq '침대'?"selected='selected'":""  }>침대</option>
		<option value="매트릭스" ${inven.category eq '매트릭스'?"selected='selected'":""  }>매트릭스</option>
		<option value="의자" ${inven.category eq '의자'?"selected='selected'":""  }>의자</option>
		<option value="소파" ${inven.category eq '소파'?"selected='selected'":""  }>소파</option>
		<option value="옷장" ${inven.category eq '옷장'?"selected='selected'":""  }>옷장</option>
		<option value="수납장" ${inven.category eq '수납장'?"selected='selected'":""  }>수납장</option>
		<option value="책상" ${inven.category eq '책상'?"selected='selected'":""  }>책상</option>
		<option value="테이블" ${inven.category eq '테이블'?"selected='selected'":""  }>테이블</option>
		<option value="액세서리" ${inven.category eq '액세서리"'?"selected='selected'":""  }>액세서리</option>
	
		</select> 
	</td>
</tr>

<tr>    <%-- + - 버튼 ??  --%>
	<td>수량:<input type="number" id="count" name="count" 
	size="50" min="1" max="1000" value="${inven.count }" >개</td>
</tr>

<tr>  
	<td><input type="text" id="price" name="price" value="${inven.price }" >원</td>
</tr>

<tr>
	<td align="center"><input type="submit" value="재고 수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" 취소" onclick="goBack()"></td>
</tr>

</table>
</form>
</div>


<script type="text/javascript">

function inventoryCheck() {
	//alert("inventoryCheck()");
	
	var model_id = $("#model_id").val();
	$.ajax({
		url:"inventoryCheck.do",
		type:"post",
		//data:"model_id=" + model_id,
		data:{ model_id:model_id },
		success:function(data){
			//alert("success");
			//alert(data);
			if(data.trim() == "OK"){
				
				$("#_model_id").css("color", "#0000ff")
				$("#_model_id").html("사용할 수 있는 모델명입니다");
				$("#model_id").val(model_id); 
				
			}else{
				
				$("#_model_id").css("color", "#ff0000")
				$("#_model_id").html("사용 중인 모델명입니다");
				$("#model_id").val(""); 
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
	
}


function goBack() {
	var inven_seq = $("#inven_seq").val();
	location.href = "inventorydetail.do?inven_seq=" + inven_seq;
}
</script>

</body>
</html>