<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>상품디테일</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<style>

.quantity{display:inline-block;position:relative;width:50px;vertical-align:top;}
.quantity input{width:30px;height:25px;padding:0 2px 0 3px;line-height:25px;border:1px solid #d4d8d9;border-radius:3px 0 0 3px;}
.quantity .up{position:absolute;left:28px;top:0;}
.quantity .down{position:absolute;left:28px;top:12px;}


#main_container{
	margin-bottom: 0;
	padding-bottom: 0;
}
#main{
	margin-bottom: 0;
	padding-bottom: 0;
}

#tabContainer hr{
    position: relative;
    padding: 0 20px;
    font-size: 0;
    box-sizing: border-box;
    margin: 0;
	padding: 0;
}

#tabContainer ul{
	list-style: none;
    padding: 0;
    margin: 0;
}

#tabContainer ul li { 
	display:inline; 				/* 세로나열을 가로나열로 변경 */
	border:1px solid #999; 			/* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */ 
	font:bold 12px Dotum; 			/* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */ 
	padding:10 10 0 10px;			 /* 각 메뉴 간격 */ 
	margin: 10 10 0 10;
	border-bottom: none;
} 

#tabContainer ul li:first-child{
	/* border-left:none; */	/* 메뉴 분류중 제일 왼쪽의 "|"는 삭제 */
}  

#tabContainer .tabFillSpace {
	position: absolute;
	
	left:0;
	bottom:0;
	
	width:100%;
	height:0;
	padding:0;
	
	border-color:#000;
	
	z-index:3;
}

.cloneTabsContainer .tabItem.active,
.cloneTabsContainer .tabItem {
	position: relative;
	
	margin:0;
	margin-left:-1px;
	
	padding:0 10px;
/* 	width:168px; */
	height:50px;
	line-height:50px;
	
	font-size: 12px;
	color:#999;
	
	border-color:#D1D1D1;
	
	box-sizing: border-box;
	
	border-radius: 0;
	background:#fff;
}

.cloneTabsContainer .tabItem:first-child {
	margin-left:0;
}

.cloneTabsContainer .tabItem.active {
	border-color:#000;
	color:#000;
	z-index:5;
}
</style>



</head>
<body>

<div id="main" align="center">
<div id="main_container" style="width: 85%;">
<br/><br/>
<hr/>
<div>


<table>
<colgroup>
	<col width="50%"/><col width="50%"/>
</colgroup>
<tr>
	<td>
	
		<div id="left_container">		
		<table>
		<colgroup>
			<col width="30%"/><col width="30%"/><col width="30%"/>
		</colgroup>
		<tr>
			<td colspan="3">
				<div style="margin: 20 20 20 20;" id="mainImgConatiner">
					<img src="/img/${pdto.photo_af1 }" id="img_main" style="width: 400; height: auto; border: 1px solid;" />
				</div>
			</td>
		</tr>
		<tr>
			<td width="33%">
				<div style="margin: 20 20 20 20;" id="imageThumb_0">
				<img src="/img/${pdto.photo_af1 }" alt="" id="${pdto.photo_af1 }" style="width: 100%; height: auto; border: 1px solid;"  />
				</div>
			</td>
			<td width="33%">
				<div style="margin: 20 20 20 20;" id="imageThumb_1">
				<img src="/img/${pdto.photo_af2 }" alt="" id="${pdto.photo_af2 }" style="width: 100%; height: auto; border: 1px solid;"  />
				</div>
			</td>
			<td width="33%">
				<div style="margin: 20 20 20 20;" id="imageThumb_2">
				<img src="/img/${pdto.photo_af3 }" alt="" id="${pdto.photo_af3 }" style="width: 100%; height: auto; border: 1px solid;"  />
				</div>
			</td>
		</tr>
		</table>
		</div>
		
	</td>
	
	<!-- 오른쪽 content -->
	<td style="padding: 20 0 40% 10px;">
	
		<div id="right_container" style="width: 100%; height: auto;">
		<table>
		<colgroup>
			<col width="50%"/><col width="50%"/>
		</colgroup>
		
		<tr align="center">
			<td colspan="2" align="left">
			<br/><br/>
				<h3>${pdto.p_name }</h3><!-- 상품명 --> 
				<br/>
			</td>
		</tr>
		
		
		<tr>
			<td colspan="2">
				<span><b>배송기간</b></span>
				<span>약 7일</span>
				<span><b>배송비</b></span>
				<span>무료배송</span>
				
				<span><b>제품코드</b> : ${pdto.model_id }</span>
				<hr/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<font size="15"><b style="color: red;">￦ <fmt:formatNumber value="${idto.price }" pattern="#,###"/></b> / 개</font> 
				<br/><br/>
			</td>
		</tr>
		<tr>
			<td align="center">			
				수량 : 
			</td>
			<td>
			<span class="quantity">
				<input type="text" id="count" name="count" value="1" size="20" readonly="readonly"/>&nbsp;&nbsp;
				<a href="#" onclick="plusCount()"><img alt="" src="./image/btn_count_up.gif" class="up" /></a>
				<a href="#" onclick="minusCount()"><img alt="" src="./image/btn_count_down.gif" class="down" /></a>
			</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<br/><hr/>
				<span style="text-align: right;"><b>총 상품금액</b> : 
					<span id="test"></span>
					<input type="text" id="totalprice" name="totalprice" value="" readonly="readonly" style="text-align: right; border: none; padding-right: 5px;"/> 
				</span>
				<hr/>
				<br/><br/>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<input type="button" value="장바구니" onclick="" />
			</td>
			<td align="center">
				<input type="button" value="바로구매" onclick="" />
			</td>
		</tr>
		
		</table>
		</div>	<!-- id="right_container" -->
		
	</td>
</tr>

</table>
</div>
<!-- 제품정보 컨테이너 -->
<div id="tabContainer" style="box-sizing: border-box;" align="left">
	<ul class="cloneTabsContainer">
		<li class="tabItem active" id="productinfo">제품 정보</li>
		<li class="tabItem" id="reviews" >상품평</li>
		<li class="tabItem" id="qnas" >상품Q&amp;A</li>	
	</ul>
<hr/>
	<div class="tabFillSpace">&nbsp;</div>
</div> <!-- id= tabContainer -->

<!-- 제품정보, 상품평, 상품 Q&A -->
<div id="infoContainer" align="left">	
	<jsp:include page="/WEB-INF/views/product/productInfo.jsp" flush="false"/> 
</div>

<div id="reviewsContainer" align="left" style="display: none;">
	<jsp:include page="/WEB-INF/views/reviews/p_reviewList.jsp" flush="false"/>
</div>

<div id="qnasContainer" align="left" style="display: none;">
	<jsp:include page="/WEB-INF/views/qna/p_qnaList.jsp" flush="false"/>
</div>
</div>	<!-- id="main_container" -->

</div><!-- id="main" -->
<br/><br/>
<script>
$(document).ready(function(){
	$("#totalprice").val((${idto.price }+"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
});

// 작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_0").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af1 }");
});
//작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_1").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af2 }");
});
//작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_2").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af3 }");
});

// 수량 -클릭시
function minusCount(){
	var count = $("#count").val();
	
	if(count != 0 && count > 1){
		count --;
		$("#count").val(count); 
		$("#totalprice").val(((${idto.price } * count) +"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
	}else {
		alert("수량을 다시 확인 해주세요");
		 $("#count").val(1);
		// $("#count").focus();
	}
}

// 수량 +클릭시
function plusCount(){
	var count = $("#count").val();	
	var maxcount = ${idto.count};
	
	if(count<maxcount && count>=0){
		
		count ++;
		$("#count").val(count);
		$("#totalprice").val(((${idto.price } * count) +"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
		
	}else {
		if(count < 0){
			alert("재고 수량이 1보다 작습니다.");
			$("#count").val(1);
			$("#count").focus();
		}else {
			alert("재고 수량이상 주문할 수 없습니다.");
		}		
	}
}

$("#productinfo").click(function() {
	$("#infoContainer").css("display", "block");
	$("#reviewsContainer").css("display", "none");
	$("#qnasContainer").css("display", "none");
});

$("#reviews").click(function() {
	$("#infoContainer").css("display", "none");
	$("#reviewsContainer").css("display", "block");
	$("#qnasContainer").css("display", "none");
});

$("#qnas").click(function() {
	$("#infoContainer").css("display", "none");
	$("#reviewsContainer").css("display", "none");
	$("#qnasContainer").css("display", "block");
});


</script>

</body>
</html>