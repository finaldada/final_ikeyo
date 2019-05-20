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
<title>재고 상세내역</title>



</head>
<body>



<div align="center" style="margin-left: 5%; margin-right: 5%" >
<h3>재고 상세내역</h3>
<form id="inven_frm" method="post">
<table border="1" style="height: 100%; width: 100%;"> 


<input type="hidden" id="inven_seq" name="inven_seq" value="${inven.inven_seq }">


<tr>
	<td>모델명:<input type="text" size="50" id="model_id" name="model_id" 
	value="${inven.model_id }" readonly="readonly"></td>
	
</tr>

<tr>  
	<td> 
		카테고리:<input id="category" name="category"  value="${inven.category }" readonly="readonly"> 
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
	<td align="center">
	<input type="button" value="재고 수정 " onclick="goUpdate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="재고 등록 취소" onclick="window.close()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="재고삭제" onclick="goDelete()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" value="true" id="memoBtn">메모/전달사항 숨김</button>
	</td>
</tr>

</table>
</form>

</div>


<!-- The Modal -->
<div id="myModal" class="modal" align="center" style="display: block;" >
 
	<!-- Modal content -->
    <div class="modal-content">
    	<!-- <span class="close">&times;</span>   -->                                                             
        <jsp:include page="/WEB-INF/views/inventory/inventorydetail_memo.jsp" flush="false"/> 
    </div>
</div>



<script type="text/javascript">
function goUpdate() {
	
	$("#inven_frm").attr("action", "inventoryupdate.do").submit(); 
}

function goDelete() {
	
	$("#inven_frm").attr("action", "inventorydelete.do").submit(); 
	 
}


$("#memoBtn").on("click", function() {
	var memoBtn = $("#memoBtn").val();
	if(memoBtn == "false"){
		
	$(".modal").css("display", "block");
	$("#memoBtn").val(true);
	
	}else if(memoBtn == "true") {
		
	$(".modal").css("display", "none");
	$("#memoBtn").val(false);
	}
});




function memoWrite() {
	   
		var id = $("#id").val();
		var content = $("#content").val();
		var model_id = $("#model_id").val();
		
		//alert("memoWrite()");
		
	   
	   if(id == "" && id == null){   
			alert("로그인 해주세요");
			location.href = "login.do";
		   
	   }else if(content == "" && content == null){
			alert("내용을 입력해주세요");
			$("#content").focus();
	   }else {
			
	var id = $("#id").val();
	var content = $("#content").val();
	
	$.ajax({
		url:"memoWrite.do",
		type:"post",
		data:{ id:id, content:content, model_id:model_id },
		success:function(data){
			//alert("success");
			//alert(data);
			if(data.trim() == "메모등록 완료"){
				
				alert(data);
				location.reload();	
				
			}else{
				alert(data);
				
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
	
   }	
}

function memoDelete(memo_seq) {
	
	var result = confirm('정말 삭제 하시겠습니까?'); 
	
	if(result) { 
	
	
	$.ajax({
		url:"memoDelete.do",
		type:"post",
		data:{ memo_seq:memo_seq},
		success:function(data){
			//alert("success");
			//alert(data);
			if(data.trim() == "메모 삭제 성공"){
				
				alert(data);
				location.reload();
				
				
			}else{
				alert(data);
				
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
 	
	}else{
		
		
		
		}
	
	
	
	
	
	
	
	
	
}



</script>



</body>
</html>