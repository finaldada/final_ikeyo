<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style>
#contents {
    margin: 100px auto 80px;
    width: 1200px;
    overflow: hidden;
}

.right_contents {
    float: left;
    position: relative;
    min-height: 600px;
    width: 730px;
    margin-left: 65px;
    text-align: center;
}

span {
    display: inline-block;
}

.title {
    font-size: 35px;
    letter-spacing: -1.1px;
    color: #333;
    margin-bottom: 44px;
}

.order_status_div {
    background-color: #f0f0f0;
    padding: 23px;
    margin-bottom: 45px;
    overflow: hidden;
    padding-left: 160px;
}

.status_item {
    float: left;
    width: 100px;
    height: 100px;
    position: relative;
}

.bar_item {
    float: left;
    width: 8px;
    height: 2px;
    margin: 51px 19px 47px;
    background-color: #63666a;
}

.noto {
    font-family: 'Noto Sans KR';
    letter-spacing: -1px;
}



.order_table {
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    width: 100%;
	margin: 0px auto 80px;
	border-collapse: collapse;
}

.order_table tr:first-child td {
    color: #aaa;
    height: 24px;
}
.order_table tr:not(:first-child) td {
    padding: 40px 0px;
    vertical-align: top;
}

.order_table tr td.nolist {
    border-bottom: none;
    color: #aaa;
    font-weight: 300;
    padding: 100px 0 395px;
}

.order_table tr td {
    color: #333;
    text-align: center;
    border-bottom: 1px solid #f0f0f0;
}


.f20 {
    font-size: 20px;
}
.f14 {
    font-size: 14px;
}
.f13 {
    font-size: 13px;
}
.f16 {
    font-size: 16px;
}

.arial {
    font-family: 'arial';
    letter-spacing: 0px;
}

.table_value_lb {
    letter-spacing: -0.4px;
}

.orderNo_lb {
    padding-bottom: 1px;
    border-bottom: 1px solid #c80a1e;
    color: #c80a1e;
}

.mg190 {
    margin-bottom: 190px;
}
.table_key_lb {
    margin-bottom: 14px;
    font-weight: 500;
}



</style>


<div id="content" style="margin-top: 10%; margin-left: 15%;">
<div class="right_contents">
<span class="title noto">주문/배송 조회</span>
<div class="order_status_div">
	<div class="status_item">
		<img src="./image/orderStatus3.png" alt="" class="status_img" />
		<span class="status_count f13 arial"></span>
	</div>
	<div class="bar_item"></div>
	<div class="status_item">
		<img src="./image/orderStatus4.png" alt="" class="status_img" />
		<span class="status_count f13 arial"></span>
	</div>
	<div class="bar_item"></div>
	<div class="status_item">
		<img src="./image/orderStatus5.png" alt="" class="status_img" />
	</div>
</div>

<div style="margin: 40px auto;">
	<span class="noto f14" style="color:#aaa;">최대 3년 이내 주문내역만 조회하실 수 있습니다.</span>
</div>

<table class="order_table">
	<!-- 여기에 if문 -> 주문내역 리스트 뿌려주기-->
	<!-- list 비었을때 출력 -->
	<c:if test="${empty orderlist }">
		<tr>
			<td class="nolist noto f20" style="text-align: center;">주문내역이 없습니다.</td>
		</tr>
	</c:if>
	
	<!-- list 출력 (login.id와 비교) for문 돌리기 -->
	<c:if test="${not empty orderlist }">
	<tr>
		<td class="noto f13" width="150px">주문번호</td>
		<td class="noto f13">주문 배송 정보</td>
		<td class="noto f13" width="140px">진행상태</td>
	</tr>
	<c:forEach items="${orderlist }" var="olist" varStatus="vs">
	
	<tr>
		<td>
			<span class="table_key_lb noto f13">주문번호</span><br>
			<span class="table_value_lb arial f16 orderNo_lb mg190">${olist.order_num }</span><br>
			<span class="table_key_lb noto f13">주문일</span><br>
			<fmt:formatDate var="rdate" value="${olist.regdate }" pattern="yyyy/MM/dd"/>
			<span class="table_value_lb arial f16">${rdate }</span>
		</td>
		<td class="prel">
			<c:forEach items="${sublist }" var="sub" varStatus="subvs">
				<c:if test="${sub.order_num eq olist.order_num }">
				<span class="noto f16 seriesNm">${sub.model_id }</span><br>
				<!-- <span class="noto f16 productNm">800폭 피넛형 좌식책상</span><br> -->
				<div class="order_option_div">
					<!-- <span class="noto f13 rightOptionNm ml15">색상</span> -->
					<span class="noto f13 rightOptionNm ">수량</span>
				</div>
				
				<div class="order_option_div">
					<span class="noto f13 optionNm">${sub.p_name }</span>
					<!-- <span class="noto f13 rightOptionNm ml15">MLCA</span> -->
					<span class="noto f13 rightOptionNm">${sub.count }</span> 
				</div>
				<div class="price_div one_product_price_div">
					<!-- <input type="button" value="상품평 작성" class="reviewBtn noto f13 disabled" 
								   data-product-cd="HSLD108" data-group-no="1" data-order-no="OIL190502742" data-review-status="N"
								   data-order-status="OS0001" /> -->
					<span class="oneProductPrice arial f16">${sub.price * sub.count }<b class="noto" style="color:#c80a1e;">원</b></span>
				</div>
			</c:if>
			</c:forEach>
				<div class="bar"></div>
				<div class="total_price_div price_div">
					<span class="noto f20" style="color: #333;font-weight: 300;">전체</span>
					<span class="totalPrice arial f20">${olist.total_price }<b class="noto" style="color:#c80a1e;">원</b></span>
				</div>
		</td>
		<td>
			<!-- 0: 상품 준비중, 1: 배송중, 2: 배송완료, 3: 주문 취소 , 4: 구매 완료-->
			<c:if test="${olist.deli_info eq 0 }">
				<span class="orderStatus noto f16">상품 준비중</span><br>
				<img src="./image/os1.png" alt="상품 준비중" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 1 }">
				<span class="orderStatus noto f16">배송중</span><br>
				<img src="./image/os2.png" alt="배송중" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 2 }">
				<span class="orderStatus noto f16">배송완료</span><br>
				<img src="./image/os3.png" alt="배송완료" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 3 }">
				<span class="orderStatus noto f16" style="color: red">취소된 주문</span><br>
				<!-- <img src="./image/os1.png" alt="상품 준비중" width="80px" height="80px"/><br> -->
			</c:if>
			<c:if test="${olist.deli_info eq 4 }">
				<span class="orderStatus noto f16" style="color: blue">구매 완료</span><br>
				<!-- <img src="./image/os1.png" alt="상품 준비중" width="80px" height="80px"/><br> -->
			</c:if>
			
			
			<c:if test="${olist.deli_info < 2 }">
				<input type="button" value="주문취소" class="noto f13 btn orderCancelBtn"/>
			</c:if>
			<c:if test="${olist.deli_info eq 2 }">
				<input type="button" value="구매확정" class="noto f13 btn orderCancelBtn"/>
			</c:if>
			
			<!-- <span class="table_key_lb noto f13">희망 배송일</span><br> -->
			<!-- <span class="table_value_lb arial f16 mg30">2019.06.07</span><br> -->
		</td>
	</tr>
	<!-- 오더리스트 foreach -->
	
	</c:forEach>
	
	<!-- ${not empty orderlist } -->
	</c:if>
	
</table>

</div>





</div>


</div>









</body>
</html>