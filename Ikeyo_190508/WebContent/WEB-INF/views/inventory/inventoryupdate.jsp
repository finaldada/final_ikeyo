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
<style type="text/css">
input,textarea{
	background-color: #ffffff00;
}

/* Button */

.btn_s_blue{
	border: none;
	background-color: #0051ba;
	color: #FFF;
}
.btn_s_blue:hover{
	background-color: #0a3670
}

.btn_s_gray{
	border: none;
	background: #63666A;
	color: #FFF;
}

.btn_s_gray:hover{
	background-color: #4F5256;
}

.btn_100{
	width: 100px; 
	height: 50px;
	font-size: 16px;
}

.btn_50{
	width: 100px;
	height: 40px;
	font-size: 16px;
}



</style>
<title>inventoryupdate.jsp</title>
</head>
<body>




<div align="center">
<h3>Inventory Update</h3>
<hr><br><br>
<form action="inventoryupdateAf.do">
<table> 

<input type="hidden" id="inven_seq" name="inven_seq" value="${inven.inven_seq }">

<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id" 
	value="${inven.model_id }" >
	<input type="button" value="Check"  class="joinButton btn_s_blue btn_100" onclick="inventoryCheck()">
	<div id="_model_id"></div>
	<hr>
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
		<hr>
	</td>
</tr>

<tr>    
	<td>수량:&nbsp;&nbsp;<a href="#" class="joinButton btn_s_blue btn_30" onclick="minusCount()"><img alt="" src="./image/btn_pre.gif"></a>&nbsp;&nbsp;
	<input type="text" id="count" name="count" value="${inven.count }" size="5">개&nbsp;&nbsp;
	<a href="#" class="joinButton btn_s_blue btn_30" onclick="plusCount()"><img alt="" src="./image/btn_next.gif"></a>
	<hr></td>
</tr>

<tr>  
	<td><input type="text" id="price" name="price" value="${inven.price }" >원
	<hr></td>
</tr>

<tr>
	<td align="center"><input type="button" value="Update" class="joinButton btn_s_blue btn_100" onclick="goUpdateAf()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Cancel" class="joinButton btn_s_gray btn_100" onclick="goBack()">
	<hr></td>
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
/* 	var inven_seq = $("#inven_seq").val();
	location.href = "inventorydetail.do?inven_seq=" + inven_seq; */
	 window.close();
	
} 

function goUpdateAf() {
	

	var model_id = $("#model_id").val();
	var category = $("#category").val();
	var count = $("#count").val();
	var price = $("#price").val();
	var inven_seq = $("#inven_seq").val();
	
	$.ajax({
		url:"inventoryupdateAf.do",
		type:"post",
		//data:"model_id=" + model_id,
		data:{ model_id:model_id, category:category, count:count,
			price:price, inven_seq:inven_seq },
		success:function(data){
			//alert("success");
			//alert(data);
			if(data.trim() == "\"업데이트 성공\""){
				
				alert(data);
				opener.parent.location.reload();
				window.close();
				
				
			}else{
				alert(data);

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



</script>

</body>
</html>