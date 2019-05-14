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
<title>inventorywrite.jsp</title>
</head>
<body>

<div align="center">
<form id="inven_frm" method="post">
<table border="1"> 
<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id">
	<input type="button" value="중복체크" onclick="inventoryCheck()">
	<div id="_model_id"></div>
	</td>
</tr>

<tr>  <%-- 카테고리 select ? or text필드?  --%>
	<td>
		카테고리:<select id="category" name="category"> 
		<option value="" selected="selected">선택</option>
		<option value="침대" >침대</option>
		<option value="의자" >의자</option>
		<option value="옷장">옷장</option>
		<option value="책상">책상</option>
		<option value="커튼">커튼</option>
		</select> 
	</td>
</tr>

<tr>    <%-- + - 버튼 ??  --%>
	<!-- <td>수량:<input type="number" id="count" name="count" size="50" min="1" max="1000">개</td> -->
	<td>수량:&nbsp;&nbsp;<a href="#" onclick="minusCount()"><img alt="" src="./image/btn_pre.gif"></a>&nbsp;&nbsp;
	<input type="text" id="count" name="count" value="1" size="20">개&nbsp;&nbsp;
	<a href="#" onclick="plusCount()"><img alt="" src="./image/btn_next.gif"></a>
	</td>
</tr>

<tr>  
	<td>가격:<input type="text" id="price" name="price">원</td>
</tr>

<tr>
	<td align="center"><input type="button" value="재고 등록" onclick="goWrite()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="재고 등록 취소" onclick="goBack()"></td>
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


function minusCount(){
	
	
	var count = $("#count").val();
	
	if(count != 0 && count > 0){
		count --;
		$("#count").val(count); 
	}else {
		alert("수량을 다시 확인 해주세요");
		 $("#count").val(1);
		$("#count").focus();
		
	}
	

}

function plusCount(){
	var count = $("#count").val();
	
	
	if(count<500 && count>=0){
		
		count ++;
		$("#count").val(count); 
		
	}else {
		if(count < 0){
			alert("재고 수량이 1보다 작습니다.");
			$("#count").val(1);
			$("#count").focus();
		}else {
			
		alert("재고 수량이 500개를 넘을 수 없습니다. 수량을 확인해주세요");
		 $("#count").val(500);
		 $("#count").focus();
		}
		
	}
}	

function goWrite(){
	
	var model_id = $("#model_id").val();
	var category = $("#category").val();
	var price = $("#price").val();
	
	if(model_id == "" && model_id == 0){
		
		alert("모델명을 입력해주세요");
		$("#model_id").focus();
		
	}else if(category == "" && category == 0){
		
		alert("카테고리를 선택해주세요");
		$("#category").focus();
		
	}else if(price == "" && price == 0) {
		
		alert("가격을 입력해주세요");
		$("#price").focus();
		
	}else {
		$("#inven_frm").attr("action", "inventorywriteAf.do").submit(); 
		
	}
	
}

function goBack() {
	
	location.href="inventorylist.do";
}
	
	
	
	


</script>

</body>
</html>